# Agent 配置示例

本目录包含 Smart Flow 支持的专业 Agent 配置示例。

## Agent 列表

### 核心开发 (8个)
- [product-manager.md](agents/core/product-manager.md) - 产品经理
- [ui-ux-designer.md](agents/core/ui-ux-designer.md) - UI/UX 设计师
- [database-architect.md](agents/core/database-architect.md) - 数据库架构师
- [backend-architect.md](agents/core/backend-architect.md) - 后端架构师
- [frontend-developer.md](agents/core/frontend-developer.md) - 前端开发
- [backend-developer.md](agents/core/backend-developer.md) - 后端开发
- [test-automator.md](agents/core/test-automator.md) - 测试工程师
- [security-auditor.md](agents/core/security-auditor.md) - 安全专家

### 编程语言专项 (11个)
- [python-expert.md](agents/languages/python-expert.md) - Python 专家
- [typescript-expert.md](agents/languages/typescript-expert.md) - TypeScript 专家
- [javascript-developer.md](agents/languages/javascript-developer.md) - JavaScript 开发
- [golang-expert.md](agents/languages/golang-expert.md) - Go 专家
- [java-developer.md](agents/languages/java-developer.md) - Java 开发
- [cpp-engineer.md](agents/languages/cpp-engineer.md) - C++ 工程师
- [rust-expert.md](agents/languages/rust-expert.md) - Rust 专家
- [c-developer.md](agents/languages/c-developer.md) - C 语言专家
- [php-developer.md](agents/languages/php-developer.md) - PHP 开发
- [ruby-expert.md](agents/languages/ruby-expert.md) - Ruby 专家
- [sql-expert.md](agents/languages/sql-expert.md) - SQL 专家

### AI & 数据 (7个)
- [ai-engineer.md](agents/ai-data/ai-engineer.md) - AI 工程师
- [prompt-engineer.md](agents/ai-data/prompt-engineer.md) - Prompt 优化专家
- [data-engineer.md](agents/ai-data/data-engineer.md) - 数据工程师
- [ml-engineer.md](agents/ai-data/ml-engineer.md) - 机器学习工程师
- [mlops-engineer.md](agents/ai-data/mlops-engineer.md) - MLOps 工程师
- [data-scientist.md](agents/ai-data/data-scientist.md) - 数据科学家
- [data-analyst.md](agents/ai-data/data-analyst.md) - 数据分析师

### 部署 & 运维 (8个)
- [deployment-engineer.md](agents/deployment/deployment-engineer.md) - 部署工程师
- [devops-troubleshooter.md](agents/deployment/devops-troubleshooter.md) - DevOps 故障排查
- [cloud-architect.md](agents/deployment/cloud-architect.md) - 云架构师
- [db-deploy.md](agents/deployment/db-deploy.md) - 数据库部署专家
- [github-actions-runner.md](agents/deployment/github-actions-runner.md) - GitHub Actions 专家
- [terraform-specialist.md](agents/deployment/terraform-specialist.md) - Terraform 专家
- [incident-responder.md](agents/deployment/incident-responder.md) - 生产事故处理
- [windows-fullstack-deploy.md](agents/deployment/windows-fullstack-deploy.md) - Windows 全栈部署

## 配置格式

每个 Agent 配置文件包含：

```yaml
---
name: agent-name
description: Use when [triggering conditions]
model: inherit  # or specific model like claude-sonnet-4-5-20250929
---

# Agent Display Name

## 角色定义
[Agent 的专业角色和职责]

## 核心能力
[Agent 擅长的任务]

## 触发条件
[关键词匹配规则]

## 输出格式
[输出内容的格式要求]
```

## 自定义 Agent

用户可以添加自定义 Agent：

1. 在 `agents/` 目录创建新的 `.md` 文件
2. 按照 Agent 配置格式编写
3. 在 `task-decomposer` 中添加映射规则

## 示例

参见 [product-manager.md](agents/core/product-manager.md) 获取完整示例。

---

**文档版本**: v1.0.0
**最后更新**: 2025-01-07
