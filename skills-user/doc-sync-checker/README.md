# 文档同步检查器 (Doc Sync Checker)

> **版本**: v1.0.0
> **创建日期**: 2026-01-21
> **作者**: Smart Flow Team
> **许可证**: MIT

---

## 📖 技能简介

**doc-sync-checker** 是一个自动文档同步检查技能，在代码修改完成后自动分析 API 接口和数据库模型的变更，检查相关文档是否需要同步更新。

### 核心特性

- ✅ **语言无关**：支持 Python、JavaScript、Go、Java 等多种语言
- ✅ **框架自动识别**：自动识别 Django、FastAPI、Express、Gin、Spring 等框架
- ✅ **智能变更检测**：检测 API 接口和数据库字段的新增、修改、删除
- ✅ **自动文档扫描**：自动扫描 `docs/` 文件夹中的相关文档
- ✅ **清晰同步报告**：生成易读的同步状态报告

---

## 🚀 快速开始

### 自动触发

技能会在以下情况自动触发：

1. **PostTask Hook**：代码修改完成后自动检查
2. **关键词触发**：用户说"检查文档"、"文档同步"等

### 手动调用

```
"检查文档同步"
"docs-sync-check"
"文档是否需要更新"
```

---

## 📁 文件结构

```
doc-sync-checker/
├── SKILL.md                    # 技能主文件
├── IMPLEMENTATION.md            # 实施文档
├── README.md                    # 本文件
├── config/                      # 配置文件
│   ├── patterns.json            # 代码模式定义
│   └── keywords.json            # 关键词配置
└── analyzers/                   # 代码分析器
    └── base-analyzer.md         # 基础分析器
```

---

## 🔍 支持的语言和框架

### Python

| 框架 | API 检测 | 数据库检测 | 状态 |
|------|----------|------------|------|
| Django | ✅ | ✅ | 完全支持 |
| FastAPI | ✅ | ✅ | 完全支持 |
| Flask | ✅ | ✅ | 完全支持 |

### JavaScript / TypeScript

| 框架 | API 检测 | 数据库检测 | 状态 |
|------|----------|------------|------|
| Express | ✅ | ✅ | 完全支持 |
| NestJS | ✅ | ✅ | 完全支持 |
| Next.js | ✅ | ✅ | 完全支持 |

### Go

| 框架 | API 检测 | 数据库检测 | 状态 |
|------|----------|------------|------|
| Gin | ✅ | ✅ | 完全支持 |
| Echo | ✅ | ✅ | 完全支持 |

---

## 📊 报告格式

### 示例报告

```markdown
## 📄 文档同步检查报告

### 检查时间
2026-01-21 15:30:00

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
是否需要我帮你生成文档模板？
- 输入 "生成 API 文档" 自动生成 API 文档
- 输入 "生成数据库文档" 自动生成数据库文档
```

---

## 🔧 配置

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

---

## 📚 相关文档

- [SKILL.md](SKILL.md) - 技能主文档
- [IMPLEMENTATION.md](IMPLEMENTATION.md) - 实施文档
- [config/patterns.json](config/patterns.json) - 代码模式配置
- [config/keywords.json](config/keywords.json) - 关键词配置
- [analyzers/base-analyzer.md](analyzers/base-analyzer.md) - 基础分析器

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

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

## 📝 更新日志

### v1.0.0 (2026-01-21)

- 🎉 首次发布
- ✅ 支持 Python/Django/FastAPI/Flask
- ✅ 支持 JavaScript/Express/NestJS/Next.js
- ✅ 支持 Go/Gin/Echo
- ✅ 自动文档同步检查
- ✅ PostTask Hook 集成

---

**维护者**: Smart Flow Team
**许可证**: MIT
