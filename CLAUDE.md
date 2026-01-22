# CLAUDE.md - 量化交易项目开发规范

> **更新时间**: 2026-01-21
> **项目类型**: 量化交易系统
> **适用范围**: 全局开发规范

---

## 📋 目录

1. [项目概览](#项目概览)
2. [测试与质量规范](#测试与质量规范)
3. [开发流程规范](#开发流程规范)
4. [文档管理规范](#文档管理规范)
5. [代码质量标准](#代码质量标准)

---

## 项目概览

### 项目定位
量化交易系统，包含策略执行、风险控制、数据处理等核心模块。

### 技术栈
- **后端**: Python 3.9+ / Node.js 18+
- **数据库**: MySQL 8.0+ / PostgreSQL 14+
- **缓存**: Redis 7.0+
- **测试**: pytest / Jest + Vitest

### 核心模块
1. **策略执行** (`src/strategy/`): 订单管理、策略信号触发
2. **风险控制** (`src/risk/`): 止损逻辑、持仓限额、风险敞口
3. **API接口** (`src/api/`): RESTful API、WebSocket
4. **数据处理** (`src/utils/`): K线清洗、数据转换
5. **基础设施** (`src/infra/`): 数据库、缓存、日志

---

## 测试与质量规范

### 🎯 测试覆盖率双重标准 (Dual-Standard)

**强制要求**: AI 必须在提交任何代码前运行覆盖率检查，并严格遵守以下分级：

| 模块类型 | 覆盖率红线 | 包含目录 (示例) | 要求明细 |
|---------|-----------|----------------|---------|
| **核心模块 (Tier 1)** | **95%** | `src/strategy/`, `src/risk/`, `src/api/` | 必须覆盖所有 if/else 分支与异常捕获块 |
| **通用模块 (Tier 2)** | **80%** | `src/utils/`, `src/infra/`, `scripts/` | 保证主流程逻辑和核心工具函数 100% 通过测试 |

**强制动作**:
- ❌ 若覆盖率未达标，AI **严禁**宣布任务完成
- ✅ 必须继续补齐测试用例直到达标
- ✅ 使用 `npm run test:cov` 或 `pytest --cov` 验证

**验证命令**:
```bash
# Node.js/TypeScript 项目
npm run test:cov

# Python 项目
pytest --cov=src --cov-report=term-missing --cov-report=html

# 自动化验证脚本
bash scripts/check-coverage.sh
```

### 📊 测试进度动态跟踪

**强制要求**: 项目根目录必须维护 `TEST_PROGRESS.md`。

**更新频率**: AI 每次完成功能后必须同步更新。

**状态标注**:
- ✅ = 已通过测试
- ⏳ = 部分完成（有遗留边界情况或待测项）
- ❌ = 未测试或测试失败

**记录内容**:
```markdown
### 风险控制模块
- [✅] 止损逻辑触发 (98%) - `tests/risk/stop-loss.test.ts`
- [⏳] 极端行情下的滑点模拟 (NA) - 原因：Mock数据构造中
```

**详细模板**: 参见 [TEST_PROGRESS.md](./TEST_PROGRESS.md)

### 🔄 任务闭环要求

在每次任务结束（对话收尾）前，AI **必须**:

1. ✅ 核对并更新 `TEST_PROGRESS.md`
2. ✅ 检查覆盖率是否达标（核心≥95%，通用≥80%）
3. ✅ 检查 API 文档与代码实现是否同步
4. ✅ 在响应中明确告知当前核心模块的整体覆盖率情况

**示例输出**:
```
=== 任务完成报告 ===
✅ 功能：用户登录接口
✅ 覆盖率：97% (核心模块，目标95%)
✅ 测试文件：tests/api/auth.test.ts
✅ TEST_PROGRESS.md 已更新

=== 当前整体覆盖率 ===
核心模块：92.5% (目标95%) ⚠️
通用模块：85.3% (目标80%) ✅
```

### 🛠️ 测试工具集成

#### 如何手动触发 TDD 技能

**重要**: TDD 技能采用**完全手动触发**模式，不会自动启动。你需要明确请求测试功能。

**触发方式**：

1️⃣ **直接请求 TDD**:
```
"用 TDD 开发用户登录功能"
"测试驱动开发实现订单接口"
"先写测试，后写代码"
```

2️⃣ **检查覆盖率**:
```
"检查覆盖率"
"测试覆盖率达标了吗？"
"运行覆盖率检查"
```

3️⃣ **要求写测试**:
```
"写测试用例"
"编写单元测试"
"给这个功能加上测试"
```

4️⃣ **质量要求**:
```
"确保代码质量"
"需要高质量的测试"
```

**触发后会自动执行**:
- ✅ 强制执行 TDD 流程（先写测试，后写代码）
- ✅ 核心模块必须达到 95% 覆盖率
- ✅ 通用模块必须达到 80% 覆盖率
- ✅ 自动更新 TEST_PROGRESS.md
- ✅ 覆盖率不达标则不允许完成任务

#### Node.js/TypeScript 项目配置
```json
// package.json
{
  "scripts": {
    "test": "jest",
    "test:cov": "jest --coverage --coverageThreshold='{
      \"global\": {
        \"branches\": 80,
        \"functions\": 80,
        \"lines\": 80,
        \"statements\": 80
      }
    }'",
    "test:watch": "jest --watch"
  }
}
```

**Python 项目**:
```ini
# pytest.ini
[tool:pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*
addopts =
    --cov=src
    --cov-report=term-missing
    --cov-report=html
    --cov-fail-under=80
```

**自动化脚本**:
```bash
# 一键验证所有覆盖率
bash scripts/check-coverage.sh

# 初始化测试配置
bash scripts/check-coverage.sh --init
```

---

## 开发流程规范

### 📝 TDD (Test-Driven Development) 流程

**铁律**: 不允许在没有失败测试的情况下编写生产代码。

**Red-Green-Refactor 循环**:
1. **RED**: 写一个失败的测试
2. **验证**: 确认测试失败（而不是错误）
3. **GREEN**: 写最少的代码让测试通过
4. **验证**: 确认测试通过
5. **REFACTOR**: 重构代码
6. **重复**: 下一个测试

**详细规范**: 参见 [smart-flow/skills/test-driven-development/SKILL.md](./smart-flow/skills/test-driven-development/SKILL.md)

### 🚀 功能开发流程

1. **需求澄清**: 使用 `/smart-flow` 启动需求澄清
2. **技术方案设计**: 编写技术方案文档
3. **API 设计**: 设计 API 接口和数据结构
4. **TDD 开发**: 先写测试，后写实现
5. **覆盖率验证**: 确保达到覆盖率标准
6. **文档更新**: 更新 `TEST_PROGRESS.md` 和相关文档
7. **代码审查**: 自查代码质量和安全性
8. **提交**: 使用 `/commit` 创建符合规范的提交

### 🔄 Bug 修复流程

1. **重现 Bug**: 编写失败测试用例
2. **确认失败**: 运行测试确认失败
3. **修复代码**: 修改代码让测试通过
4. **验证**: 确保所有测试通过
5. **覆盖率检查**: 确保覆盖率没有下降
6. **文档更新**: 更新相关文档

---

## 文档管理规范

### 📏 文档"千行拆分"原则

**长度限制**: 需求文档、API文档、项目说明 **严禁超过 1000 行**。

**拆分逻辑**: 一旦接近阈值，必须按功能维度进行横向拆分。

**示例**:
```
API.md (1000+ 行)
  ├── API_AUTH.md (认证相关)
  ├── API_TRADE.md (交易相关)
  ├── API_MARKET.md (行情相关)
  └── API_USER.md (用户管理)
```

**索引维护**: 拆分后需在主索引文件中更新指向子文档的链接。

### 📂 文档分层索引体系

**根节点 (Root)**:
- `README.md`: 项目概览
- `CLAUDE.md`: 全局开发规范（本文件）
- `TEST_PROGRESS.md`: 测试进度跟踪

**中间节点 (Folder)**:
- 每个子文件夹必须包含 `README.md` 或 `INDEX.md`
- 列出核心文件功能、对外接口、数据结构、依赖关系

**叶节点 (File)**:
- 核心逻辑文件或行数 > 500 行的复杂文件，必须有详细说明
- 包含：核心逻辑流程、输入输出定义、状态机流转

**全链路文档同步**:
- 修改代码 → 更新注释 → 更新文件夹 README → 更新 CLAUDE.md（如涉及架构调整）

---

## 代码质量标准

### 🎯 命名规范

- **意图导向**: 函数名要描述"做什么"，不是"怎么做"
  - ✅ `calculateStopLossPrice()`
  - ❌ `process()`

- **模块边界清晰**: 一个函数只做一件事
- **注释写"为什么"**: 不写"做了什么"

### 🧹 代码整洁

- **极简 MVP**: 拒绝过度设计
- **YAGNI**: 不为了未来可能的需求添加功能
- **DRY**: 避免重复代码，提取公共逻辑

### 🛡️ 安全规范

- **边界检查**: 所有用户输入必须验证
- **SQL 注入防护**: 使用参数化查询
- **错误处理**: 关键路径必须有错误处理
- **日志记录**: 敏感操作必须记录日志

### ⚡ 性能规范

- **数据库查询**: 避免N+1查询
- **缓存策略**: 热点数据必须缓存
- **异步处理**: 耗时操作必须异步化

---

## 📚 相关文档

### 测试相关
- [TEST_PROGRESS.md](./TEST_PROGRESS.md) - 测试进度跟踪
- [smart-flow/skills/test-driven-development/SKILL.md](./smart-flow/skills/test-driven-development/SKILL.md) - TDD 技能文档
- [scripts/check-coverage.sh](./scripts/check-coverage.sh) - 覆盖率检查脚本

### 开发工具
- [smart-flow/README.md](./smart-flow/README.md) - Smart Flow 插件文档
- [smart-flow/commands/INDEX.md](./smart-flow/commands/INDEX.md) - 斜杠命令索引

### 项目文档
- [README.md](./README.md) - 项目概览
- [docs/](./docs/) - 详细文档目录

---

## 🔄 更新日志

### 2026-01-21 - v1.0
- ✅ 初始化项目开发规范
- ✅ 添加测试覆盖率双重标准（核心95% + 通用80%）
- ✅ 添加测试进度跟踪要求
- ✅ 添加文档千行拆分原则
- ✅ 创建 TEST_PROGRESS.md 模板
- ✅ 创建覆盖率检查脚本

---

**维护说明**:
1. 本文件由 AI 和用户共同维护
2. 重大规范变更需要记录在更新日志中
3. 每月审查一次，确保规范与实际开发流程一致

---

**文档版本**: v1.0
**最后更新**: 2026-01-21
**下次审查**: 2026-02-21
