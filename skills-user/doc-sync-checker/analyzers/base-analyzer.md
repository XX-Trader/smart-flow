# 基础代码分析器

## 概述

基础分析器定义了文档同步检查的核心分析逻辑，包括文件分类、变更检测、文档扫描等。

---

## 📋 分析流程

```
┌─────────────────────────────────────┐
│     1. 获取变更文件列表              │
│     (从 Git diff 或最近修改)         │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│     2. 文件类型分类                  │
│     ├─ API 文件                     │
│     ├─ 数据库文件                   │
│     └─ 其他文件 (忽略)              │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│     3. 提取代码变更                  │
│     ├─ API 接口变更                 │
│     └─ 数据库字段变更               │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│     4. 扫描文档                      │
│     └─ 查找相关文档                 │
└──────────────┬──────────────────────┘
               │
               ▼
┌─────────────────────────────────────┐
│     5. 生成报告                      │
│     └─ 输出同步状态                 │
└─────────────────────────────────────┘
```

---

## 🔍 步骤详解

### 步骤 1: 获取变更文件

**方式 A: 使用 Git diff (推荐)**

```bash
# 获取相对于上次提交的变更文件
git diff --name-only HEAD

# 获取最近未提交的变更文件
git diff --name-only

# 获取最近 N 次提交的变更文件
git diff --name-only HEAD~N
```

**方式 B: 文件修改时间**

```python
# 获取最近修改的文件（最近 1 小时）
import os
import time

recent_files = []
for root, dirs, files in os.walk('.'):
    for file in files:
        filepath = os.path.join(root, file)
        if time.time() - os.path.getmtime(filepath) < 3600:
            recent_files.append(filepath)
```

### 步骤 2: 文件类型分类

**规则**:

| 文件路径模式 | 类型 | 说明 |
|-------------|------|------|
| `*views*`, `*controller*`, `*route*`, `*handler*` | API | 接口层文件 |
| `*/api/*`, `*/routes/*`, `*/controllers/*` | API | 接口目录 |
| `*model*`, `*schema*`, `*entity*` | 数据库 | 模型文件 |
| `*/models/*`, `*/entities/*`, `*/schemas/*` | 数据库 | 模型目录 |
| `*test*`, `*/migrations/*`, `*/node_modules/*` | 忽略 | 测试和依赖 |

**实现**:

```python
import os

def classify_file(filepath):
    """分类文件类型"""
    # 检查是否应该忽略
    ignore_patterns = ['*test*', '*/migrations/*', '*/node_modules/*']
    if any(pattern in filepath for pattern in ignore_patterns):
        return 'ignore'

    # 检查 API 文件
    api_patterns = ['views', 'controller', 'route', 'handler', '/api/']
    if any(pattern in filepath.lower() for pattern in api_patterns):
        return 'api'

    # 检查数据库文件
    db_patterns = ['model', 'schema', 'entity', '/models/', '/entities/']
    if any(pattern in filepath.lower() for pattern in db_patterns):
        return 'database'

    return 'other'
```

### 步骤 3: 提取代码变更

**API 接口提取**:

使用正则表达式匹配代码模式：

```python
import re

def extract_api_endpoints(code, language, framework):
    """提取 API 接口"""
    endpoints = []

    # Django
    if framework == 'django':
        patterns = [
            r"path\(['\"]([^'\"]+)['\"]",
            r"url\(['\"]([^'\"]+)['\"]"
        ]
        for pattern in patterns:
            matches = re.findall(pattern, code)
            endpoints.extend(matches)

    # FastAPI
    elif framework == 'fastapi':
        patterns = [
            r"@app\.(get|post|put|delete|patch)\(['\"]([^'\"]+)['\"]",
            r"@router\.(get|post|put|delete|patch)\(['\"]([^'\"]+)['\"]"
        ]
        for pattern in patterns:
            matches = re.findall(pattern, code)
            endpoints.extend([m[1] for m in matches])

    return endpoints
```

**数据库字段提取**:

```python
def extract_db_fields(code, language, framework):
    """提取数据库字段"""
    fields = []

    # Django
    if framework == 'django':
        # 提取模型类
        model_pattern = r"class (\w+)\(models\.Model\):"
        models = re.findall(model_pattern, code)

        # 提取字段
        field_pattern = r"(\w+)\s*=\s*models\.\w+Field\("
        fields = re.findall(field_pattern, code)

    # Prisma
    elif framework == 'prisma':
        model_pattern = r"model (\w+)\s*\{"
        models = re.findall(model_pattern, code)

        field_pattern = r"(\w+)\s+(String|Int|Boolean|DateTime|Float)"
        fields = re.findall(field_pattern, code)

    return fields
```

### 步骤 4: 扫描文档

```python
import os

def scan_docs(api_endpoints, db_fields):
    """扫描文档文件夹"""
    docs = {
        'api': [],
        'database': [],
        'requirements': []
    }

    # 扫描 docs/ 文件夹
    for root, dirs, files in os.walk('docs'):
        for file in files:
            filepath = os.path.join(root, file)

            # API 文档
            if 'api' in filepath.lower():
                docs['api'].append(filepath)

            # 数据库文档
            if 'database' in filepath.lower() or 'db' in filepath.lower():
                docs['database'].append(filepath)

            # 需求文档
            if 'requirement' in filepath.lower() or '需求' in filepath:
                docs['requirements'].append(filepath)

    return docs
```

### 步骤 5: 生成报告

```python
def generate_report(api_changes, db_changes, docs):
    """生成同步报告"""
    report = {
        'timestamp': datetime.now().isoformat(),
        'api_changes': api_changes,
        'db_changes': db_changes,
        'docs_found': docs,
        'sync_status': check_sync_status(api_changes, db_changes, docs)
    }
    return report

def check_sync_status(api_changes, db_changes, docs):
    """检查同步状态"""
    status = {
        'api': 'unknown',
        'database': 'unknown'
    }

    # 检查 API 文档状态
    if api_changes and not docs['api']:
        status['api'] = 'missing'
    elif api_changes:
        status['api'] = 'needs_update'

    # 检查数据库文档状态
    if db_changes and not docs['database']:
        status['database'] = 'missing'
    elif db_changes:
        status['database'] = 'needs_update'

    return status
```

---

## 📊 报告格式

```markdown
## 📄 文档同步检查报告

### 检查时间
{timestamp}

### 变更文件
- {file1}
- {file2}

### API 接口变更
| 接口 | 变更类型 | 文档状态 |
|------|----------|----------|
| {endpoint} | {change_type} | {status} |

### 数据库字段变更
| 表名 | 字段 | 变更类型 | 文档状态 |
|------|------|----------|----------|
| {table} | {field} | {change_type} | {status} |

### 建议操作
- [ ] {action1}
- [ ] {action2}
```

---

## 🔧 工具函数

### 检测语言和框架

```python
def detect_language_and_framework(filepath):
    """检测文件的语言和框架"""
    ext = os.path.splitext(filepath)[1].lower()

    # Python
    if ext == '.py':
        # 检测框架
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
            if 'from django' in content or 'import django' in content:
                return 'python', 'django'
            elif 'from fastapi' in content or 'import fastapi' in content:
                return 'python', 'fastapi'
            elif 'from flask' in content or 'import flask' in content:
                return 'python', 'flask'

    # JavaScript/TypeScript
    elif ext in ['.js', '.ts']:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
            if '@nestjs' in content or '@Controller' in content:
                return 'javascript', 'nest'
            elif "require('express')" in content or "from 'express'" in content:
                return 'javascript', 'express'

    # Go
    elif ext == '.go':
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
            if '"github.com/gin-gonic/gin"' in content:
                return 'go', 'gin'
            elif '"github.com/labstack/echo' in content:
                return 'go', 'echo'

    return 'unknown', 'unknown'
```

### 提取变更类型

```python
def detect_change_type(old_code, new_code):
    """检测变更类型"""
    if not old_code:
        return 'add'
    if not new_code:
        return 'delete'
    return 'modify'
```

---

## 📝 使用示例

```python
# 创建分析器实例
analyzer = BaseAnalyzer()

# 分析变更
changes = analyzer.analyze_changes(
    files=['backend/views/user_views.py', 'backend/models/user.py']
)

# 生成报告
report = analyzer.generate_report(changes)

# 输出报告
print(format_report(report))
```

---

**最后更新**: 2026-01-21
