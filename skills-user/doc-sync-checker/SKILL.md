---
name: doc-sync-checker
displayName: "文档同步检查器"
version: "1.0.0"
description: 代码修改后自动检查 API 文档和数据库文档是否需要同步更新。支持多语言、框架无关，通过分析代码变更智能提醒文档同步。

triggers:
  keywords:
    - "文档同步"
    - "检查文档"
    - "docs-sync"
    - "doc-check"
  auto_trigger: true
  confidence_threshold: 0.6

tools:
  required:
    - Read
    - Glob
    - Grep
  optional:
    - Bash
    - Edit

permissions:
  level: "read"
  scope:
    - "file:read"
    - "file:write"

context:
  mode: inline
  isolation: false
  max_context_tokens: 50000

hot_reload: true
progressive_load: true

metadata:
  category: "plugin"
  tags:
    - "documentation"
    - "sync"
    - "api"
    - "database"
  author: "Smart Flow Team"
  license: "MIT"
  created_at: "2026-01-21"
  updated_at: "2026-01-21"

scope:
  level: "project"
  priority: 45

compatibility:
  claude_code_min_version: "2026.01.0"
  requires_restart: false
---

# 文档同步检查器 (Doc Sync Checker)

## 🎯 技能概述

**doc-sync-checker** 是一个自动文档同步检查工具，在代码修改完成后自动分析 API 接口和数据库模型的变更，检查相关文档是否需要同步更新。

### 核心特性

- ✅ **语言无关**：支持 Python、JavaScript、Go、Java 等多种语言
- ✅ **框架自动识别**：自动识别 Django、FastAPI、Express、Gin、Spring 等框架
- ✅ **智能变更检测**：检测 API 接口的新增、修改、删除
- ✅ **数据库字段跟踪**：检测数据库模型的字段变更
- ✅ **文档扫描**：自动扫描 `docs/` 文件夹中的相关文档
- ✅ **极简报告**：生成清晰的同步状态报告

---

## 🚀 使用方法

### 自动触发（推荐）

代码修改完成后，**PostTask Hook** 会自动触发文档同步检查。

**适用场景**：
- 修改了 API 接口文件（views、controllers、routes）
- 修改了数据库模型文件（models、schemas）
- 修改了前端 API 调用文件

### 手动调用

用户可以说：
```
"检查文档同步"
"docs-sync-check"
"文档是否需要更新"
```

---

## 📋 检查流程

### 第一步：分析变更文件

检测最近修改的文件，判断文件类型：

| 文件类型 | 典型路径 | 触发检查 |
|----------|----------|----------|
| **API 接口** | `views/`, `controllers/`, `routes/`, `api/` | ✅ |
| **数据库模型** | `models/`, `schemas/`, `entities/` | ✅ |
| **前端 API** | `src/api/`, `api/` (前端) | ✅ |
| **配置文件** | `settings.py`, `.env` | ❌ |
| **文档文件** | `docs/`, `README.md` | ❌ |

### 第二步：提取代码变更

#### API 接口提取

**Python/Django**:
```python
# 会被提取的接口
path('api/users/', views.user_list)  # → GET /api/users/
path('api/users/create', views.create_user)  # → POST /api/users/create
```

**Python/FastAPI**:
```python
@app.get("/api/users")
async def get_users():  # → GET /api/users

@app.post("/api/users/create")
async def create_user():  # → POST /api/users/create
```

**JavaScript/Express**:
```javascript
app.get('/api/users', handler)  # → GET /api/users
app.post('/api/users/create', handler)  # → POST /api/users/create
```

#### 数据库模型提取

**Python/Django**:
```python
class User(models.Model):
    username = models.CharField()  # 字段: username
    email = models.EmailField()    # 字段: email
```

**JavaScript/Prisma**:
```prisma
model User {
  username String
  email    String
}
```

### 第三步：扫描文档

扫描 `docs/` 文件夹，查找相关文档：

| 文档类型 | 典型路径 |
|----------|----------|
| **API 文档** | `docs/api/`, `docs/apis/`, `docs/API.md` |
| **数据库文档** | `docs/database/`, `docs/db/`, `docs/schema.md` |
| **需求文档** | `docs/requirements/`, `docs/需求.md` |

### 第四步：生成报告

```markdown
## 📄 文档同步检查报告

### 变更文件
- backend/views/user_views.py
- backend/models/user.py

### API 接口变更
| 接口 | 变更类型 | 文档状态 |
|------|----------|----------|
| GET /api/users/ | 新增 | ⚠️ 需要更新 |
| POST /api/users/create | 新增 | ⚠️ 需要更新 |

### 数据库字段变更
| 表名 | 字段 | 变更类型 | 文档状态 |
|------|------|----------|----------|
| users | phone | 新增 | ⚠️ 需要更新 |

### 建议操作
- [ ] 更新 docs/api/user-api.md
- [ ] 更新 docs/database/user-schema.md

### 快速操作
输入 "生成 API 文档" 或 "生成数据库文档" 获取帮助
```

---

## 🔍 支持的语言和框架

### Python

| 框架 | API 检测 | 数据库检测 | 状态 |
|------|----------|------------|------|
| Django | ✅ | ✅ | 完全支持 |
| FastAPI | ✅ | ✅ (SQLAlchemy) | 完全支持 |
| Flask | ✅ | ✅ (SQLAlchemy) | 完全支持 |

### JavaScript / TypeScript

| 框架 | API 检测 | 数据库检测 | 状态 |
|------|----------|------------|------|
| Express | ✅ | ✅ (Mongoose) | 完全支持 |
| NestJS | ✅ | ✅ (TypeORM/Prisma) | 完全支持 |
| Next.js | ✅ (App Router) | ✅ (Prisma) | 完全支持 |

### Go

| 框架 | API 检测 | 数据库检测 | 状态 |
|------|----------|------------|------|
| Gin | ✅ | ✅ (GORM) | 完全支持 |
| Echo | ✅ | ✅ (GORM) | 完全支持 |

### Java

| 框架 | API 检测 | 数据库检测 | 状态 |
|------|----------|------------|------|
| Spring Boot | ✅ | ✅ (JPA) | 计划支持 |

---

## 📁 配置文件

### `config/patterns.json`

定义各种语言和框架的代码模式。

**结构**：
```json
{
  "api_patterns": {
    "python": {
      "django": ["path\\(['\"]([^'\"]+)['\"]"],
      "fastapi": ["@app\\.(get|post)\\(['\"]([^'\"]+)['\"]"]
    }
  },
  "db_patterns": {
    "python": {
      "django": ["class \\w+\\(models\\.Model\\)"]
    }
  }
}
```

### `config/keywords.json`

定义触发关键词。

**结构**：
```json
{
  "trigger_keywords": ["检查文档", "文档同步"],
  "api_keywords": ["接口", "api", "路由"],
  "db_keywords": ["数据库", "model", "schema"]
}
```

---

## 🎨 文档模板

### API 文档模板

```markdown
# {module_name} API 文档

## 接口列表

### {method} {path}

**功能描述**: {description}

**请求参数**:
| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| {param_name} | {type} | {required} | {description} |

**响应示例**:
```json
{
  "code": 200,
  "data": {}
}
```
```

### 数据库文档模板

```markdown
# {table_name} 数据库设计

## 表结构

| 字段名 | 类型 | 约束 | 说明 |
|--------|------|------|------|
| {field_name} | {type} | {constraints} | {description} |

## 索引
- {index_name}: {fields}

## 关联关系
- {relation}
```

---

## 🔄 工作流程

```
代码修改完成
    ↓
PostTask Hook 触发
    ↓
检测是否涉及接口/数据库文件
    ↓
    ├─ 否 → 跳过检查
    │
    └─ 是 → 调用 doc-sync-checker 技能
            ↓
        分析代码变更
            ↓
        扫描 docs/ 文件夹
            ↓
        生成同步报告
            ↓
        输出报告 + 询问是否需要帮助
```

---

## 📊 检查结果说明

| 状态图标 | 含义 | 操作 |
|----------|------|------|
| ✅ | 文档已同步 | 无需操作 |
| ⚠️ | 文档需要更新 | 检查并更新文档 |
| ❓ | 未找到文档 | 询问是否创建文档 |
| ❌ | 检查失败 | 查看错误信息 |

---

## 🛠️ 高级配置

### 自定义文档路径

在项目根目录创建 `.docs-sync.json`:

```json
{
  "docs_path": "documentation",
  "api_docs_path": "documentation/apis",
  "db_docs_path": "documentation/database"
}
```

### 忽略特定文件

```json
{
  "ignore_patterns": [
    "*_test.py",
    "migrations/*",
    "node_modules/*"
  ]
}
```

### 自定义检测规则

```json
{
  "custom_patterns": {
    "my_custom_api": [
      "def api_.*\\(",
      "@register.*"
    ]
  }
}
```

---

## 📚 相关技能

- [feature-development](../feature-development/SKILL.md) - 功能开发流程
- [api-documenter](../../agents/api-documenter.md) - API 文档生成器
- [documentation-architect](../../agents/documentation-architect_showcase.md) - 技术文档架构师

---

## 🔧 故障排查

### 问题：没有触发检查

**可能原因**：
1. 修改的文件不是接口或模型文件
2. PostTask Hook 未启用

**解决方案**：
- 检查 `.claude/settings.json` 中 `lifecycleHooks.PostTask.enabled` 是否为 `true`
- 手动调用："检查文档同步"

### 问题：检测不到某些接口

**可能原因**：
- 使用了非常规的路由定义方式
- 框架未支持

**解决方案**：
- 在 `config/patterns.json` 中添加自定义模式
- 提交 Issue 请求支持新框架

---

## 📝 更新日志

### v1.0.0 (2026-01-21)
- 🎉 首次发布
- ✅ 支持 Python/Django/FastAPI
- ✅ 支持 JavaScript/Express/NestJS
- ✅ 支持 Go/Gin
- ✅ 自动文档同步检查

---

**最后更新**: 2026-01-21
**维护者**: Smart Flow Team
**许可证**: MIT
