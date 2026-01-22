#!/bin/bash
# 测试覆盖率检查脚本
# 用于量化交易项目的自动化测试覆盖率验证

set -e  # 遇到错误立即退出

# ============================================
# 配置项
# ============================================

# 覆盖率阈值
CORE_THRESHOLD=95
GENERAL_THRESHOLD=80

# 核心模块目录（根据项目调整）
CORE_MODULES=("src/strategy" "src/risk" "src/api")
# 通用模块目录（根据项目调整）
GENERAL_MODULES=("src/utils" "src/infra" "scripts")

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ============================================
# 工具函数
# ============================================

print_header() {
    echo ""
    echo "============================================"
    echo "$1"
    echo "============================================"
    echo ""
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

# 检测项目类型
detect_project_type() {
    if [ -f "package.json" ]; then
        echo "node"
    elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
        echo "python"
    else
        echo "unknown"
    fi
}

# ============================================
# Node.js/TypeScript 项目
# ============================================

run_node_tests() {
    print_header "🔍 运行 Node.js/TypeScript 测试覆盖率检查"

    # 检查是否安装了测试工具
    if ! command -v npx &> /dev/null; then
        print_error "未找到 npx，请确保已安装 Node.js"
        exit 1
    fi

    # 运行测试并生成覆盖率报告
    print_header "📊 生成覆盖率报告"

    # 尝试不同的测试命令
    if grep -q '"test:cov"' package.json; then
        npm run test:cov
    elif grep -q '"jest"' package.json; then
        npx jest --coverage --coverageThreshold='{"global":{"branches":80,"functions":80,"lines":80,"statements":80}}'
    elif grep -q '"vitest"' package.json; then
        npx vitest run --coverage
    else
        print_error "未找到测试脚本，请在 package.json 中添加 test:cov 命令"
        exit 1
    fi

    # 解析覆盖率结果
    parse_jest_coverage
}

parse_jest_coverage() {
    print_header "📈 解析覆盖率结果"

    COVERAGE_FILE="coverage/coverage-summary.json"

    if [ ! -f "$COVERAGE_FILE" ]; then
        print_warning "未找到覆盖率摘要文件，尝试从终端输出解析"
        return
    fi

    echo ""
    echo "模块覆盖率详情:"
    echo "----------------"

    # 使用 Node.js 解析 JSON
    node -e "
        const fs = require('fs');
        const coverage = JSON.parse(fs.readFileSync('$COVERAGE_FILE', 'utf8'));
        const total = coverage.total;

        const linesPct = total.lines.pct;
        const branchesPct = total.branches.pct;
        const functionsPct = total.functions.pct;
        const statementsPct = total.statements.pct;

        console.log('语句覆盖率: ' + statementsPct.toFixed(2) + '%');
        console.log('分支覆盖率: ' + branchesPct.toFixed(2) + '%');
        console.log('函数覆盖率: ' + functionsPct.toFixed(2) + '%');
        console.log('行覆盖率: ' + linesPct.toFixed(2) + '%');
        console.log('');

        const coreThreshold = $CORE_THRESHOLD;
        const generalThreshold = $GENERAL_THRESHOLD;

        // 检查各模块覆盖率（需要根据实际项目路径调整）
        for (const [path, data] of Object.entries(coverage)) {
            if (path === 'total') continue;

            const isCore = ${CORE_MODULES[@]}.some(dir => path.includes(dir.replace('src/', '')));
            const threshold = isCore ? coreThreshold : generalThreshold;
            const lines = data.lines.pct;

            const status = lines >= threshold ? '✅' : '❌';
            const type = isCore ? '核心' : '通用';
            console.log(\`\${status} [\${type}] \${path}: \${lines.toFixed(2)}% (目标: \${threshold}%)\`);
        }
    "
}

# ============================================
# Python 项目
# ============================================

run_python_tests() {
    print_header "🔍 运行 Python 测试覆盖率检查"

    # 检查是否安装了 pytest
    if ! command -v pytest &> /dev/null; then
        print_error "未找到 pytest，请安装: pip install pytest pytest-cov"
        exit 1
    fi

    # 运行测试并生成覆盖率报告
    print_header "📊 生成覆盖率报告"

    pytest --cov=src --cov-report=term-missing --cov-report=json

    # 解析覆盖率结果
    parse_python_coverage
}

parse_python_coverage() {
    print_header "📈 解析覆盖率结果"

    COVERAGE_FILE="coverage.json"

    if [ ! -f "$COVERAGE_FILE" ]; then
        print_warning "未找到 coverage.json，跳过详细解析"
        return
    fi

    # 使用 Python 解析覆盖率
    python3 -c "
import json
import sys

with open('$COVERAGE_FILE', 'r') as f:
    coverage = json.load(f)

totals = coverage['totals']
lines_pct = totals['percent_covered']

print(f'\\n总覆盖率: {lines_pct:.2f}%')
print('')

core_threshold = $CORE_THRESHOLD
general_threshold = $GENERAL_THRESHOLD

print('文件覆盖率详情:')
print('----------------')

for file_path, file_data in coverage['files'].items():
    summary = file_data['summary']
    pct = summary['percent_covered']

    is_core = any(dir in file_path for dir in ${CORE_MODULES[@]})
    threshold = core_threshold if is_core else general_threshold

    status = '✅' if pct >= threshold else '❌'
    type_label = '核心' if is_core else '通用'

    print(f'{status} [{type_label}] {file_path}: {pct:.2f}% (目标: {threshold}%)')
"
}

# ============================================
# 覆盖率验证
# ============================================

verify_coverage() {
    print_header "✅ 验证覆盖率是否达标"

    # 根据项目类型运行相应测试
    PROJECT_TYPE=$(detect_project_type)

    case $PROJECT_TYPE in
        node)
            run_node_tests
            ;;
        python)
            run_python_tests
            ;;
        *)
            print_error "无法识别项目类型，请手动配置"
            exit 1
            ;;
    esac

    print_header "🎉 测试完成"
    print_success "请查看上方覆盖率报告，确认是否达标"
    echo ""
    echo "核心模块目标: ${CORE_THRESHOLD}%"
    echo "通用模块目标: ${GENERAL_THRESHOLD}%"
    echo ""
}

# ============================================
# 主程序
# ============================================

# 检查参数
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "用法: $0 [选项]"
    echo ""
    echo "选项:"
    echo "  --help, -h     显示帮助信息"
    echo "  --init         初始化配置文件"
    echo ""
    echo "示例:"
    echo "  $0              # 运行覆盖率检查"
    echo "  $0 --init       # 初始化配置"
    exit 0
fi

# 初始化配置
if [ "$1" = "--init" ]; then
    print_success "创建配置文件..."

    # 创建 .coveragerc for Python
    cat > .coveragerc << 'EOF'
[run]
source = src
omit =
    */tests/*
    */test_*.py
    */__pycache__/*
    */site-packages/*

[report]
exclude_lines =
    pragma: no cover
    def __repr__
    raise AssertionError
    raise NotImplementedError
    if __name__ == .__main__.:
EOF

    print_success "已创建 .coveragerc"

    # 更新 package.json for Node.js
    if [ -f "package.json" ]; then
        print_warning "请在 package.json 中添加以下脚本:"
        echo ""
        cat << 'EOF'
{
  "scripts": {
    "test:cov": "jest --coverage --coverageThreshold='{
      \"global\": {
        \"branches\": 80,
        \"functions\": 80,
        \"lines\": 80,
        \"statements\": 80
      }
    }'"
  }
}
EOF
    fi

    print_success "配置初始化完成！"
    exit 0
fi

# 运行覆盖率检查
verify_coverage
