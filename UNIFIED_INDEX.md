# Smart Flow - 统一资源索引

> **最后更新**: 2025-01-10
> **版本**: v2.1.0 (Showcase 整合版)
> **资源总量**: 129 个 Agent + 132 个技能 + 11 个命令
> **新增**: 8 个 Showcase 精选 Agents + 自动触发 Hooks

---

## 📊 资源统计

### 资源分布

| 类别 | 数量 | 目录 |
|------|------|------|
| **核心工作流技能** | 5 | `skills/` |
| **用户自定义技能** | 10 | `skills-user/` |
| **用户子技能** | 40 | `skills-sub/` |
| **Superpowers 技能** | 14 | `skills-superpowers/` |
| **官方插件技能** | 68 | `skills-plugins/` |
| **Agent 定义** | 129 | `agents/` (+7 Showcase) |
| **自动触发 Hooks** | 2 | `.claude/hooks/` (新增) |
| **斜杠命令** | 11 | `commands/` |
| **总计** | **279** | - |

### 技能分类统计

#### 按来源分类
- **Smart Flow 核心**: 5 个（需求澄清、任务分解、并行执行、结果整合、智能工作流）
- **用户自定义**: 50 个（10 个直接技能 + 40 个子技能）
- **Superpowers**: 14 个（工作流、调试、测试、代码审查）
- **官方插件**: 68 个（文档处理、前端设计、AI 应用等）

#### 按功能分类
- **开发流程**: 20+ 个（需求分析、功能开发、部署测试）
- **代码质量**: 15+ 个（代码审查、测试驱动、安全审计）
- **文档处理**: 20+ 个（DOCX、PDF、PPTX、XLSX）
- **设计创意**: 15+ 个（算法艺术、前端设计、UI/UX）
- **AI/ML**: 10+ 个（AI 工程、Prompt 优化、数据科学）
- **研究分析**: 10+ 个（学术研究、市场调研、技术调研）
- **运维部署**: 10+ 个（部署、测试、CI/CD）
- **其他**: 40+ 个（区块链、加密货币、移动开发等）

---

## 🚀 快速导航

### 核心工作流（Smart Flow 原生）

| 技能 | 路径 | 功能 |
|------|------|------|
| **smart-workflow** | [skills/smart-workflow](skills/smart-workflow/SKILL.md) | 智能任务调度主流程 |
| **requirements-clarity** | [skills/requirements-clarity](skills/requirements-clarity/SKILL.md) | 需求澄清 |
| **task-decomposer** | [skills/task-decomposer](skills/task-decomposer/SKILL.md) | 任务分解 |
| **parallel-executor** | [skills/parallel-executor](skills/parallel-executor/SKILL.md) | 并行执行引擎 |
| **result-synthesizer** | [skills/result-synthesizer](skills/result-synthesizer/SKILL.md) | 结果整合 |

### 用户自定义技能（Top 10）

| 技能 | 路径 | 功能 |
|------|------|------|
| **feature-development** | [skills-user/feature-development](skills-user/feature-development/SKILL.md) | Django + Vue 全栈功能开发 |
| **auto-fix** | [skills-user/auto-fix](skills-user/auto-fix/SKILL.md) | 自动测试-修复循环 |
| **db-deploy** | [skills-user/db-deploy](skills-user/db-deploy/SKILL.md) | 全栈项目自动部署 |
| **deployment-test** | [skills-user/deployment-test](skills-user/deployment-test/SKILL.md) | 部署后自动化测试 |
| **intelligent-router** | [skills-user/intelligent-router](skills-user/intelligent-router/SKILL.md) | 智能任务路由系统 |
| **agent-manager** | [skills-user/agent-manager](skills-user/agent-manager/SKILL.md) | Agent 索引和管理 |
| **github-actions-runner** | [skills-user/github-actions-runner](skills-user/github-actions-runner/SKILL.md) | GitHub Actions 自托管 Runner |
| **windows-fullstack-deploy** | [skills-user/windows-fullstack-deploy](skills-user/windows-fullstack-deploy/SKILL.md) | Windows 本地开发环境部署 |
| **browser-mcp-guide** | [skills-user/browser-mcp-guide](skills-user/browser-mcp-guide/SKILL.md) | Chrome MCP 浏览器自动化指南 |
| **requirements-clarity** | [skills-user/requirements-clarity](skills-user/requirements-clarity/SKILL.md) | 需求确认和范围界定 |

### Superpowers 技能（工作流最佳实践）

| 技能 | 路径 | 功能 |
|------|------|------|
| **brainstorming** | [skills-superpowers/brainstorming](skills-superpowers/brainstorming/SKILL.md) | 创意头脑风暴 |
| **writing-plans** | [skills-superpowers/writing-plans](skills-superpowers/writing-plans/SKILL.md) | 编写实施计划 |
| **test-driven-development** | [skills-superpowers/test-driven-development](skills-superpowers/test-driven-development/SKILL.md) | TDD 测试驱动开发 |
| **systematic-debugging** | [skills-superpowers/systematic-debugging](skills-superpowers/systematic-debugging/SKILL.md) | 系统化调试 |
| **dispatching-parallel-agents** | [skills-superpowers/dispatching-parallel-agents](skills-superpowers/dispatching-parallel-agents/SKILL.md) | 并行 Agent 调度 |
| **executing-plans** | [skills-superpowers/executing-plans](skills-superpowers/executing-plans/SKILL.md) | 执行实施计划 |
| **subagent-driven-development** | [skills-superpowers/subagent-driven-development](skills-superpowers/subagent-driven-development/SKILL.md) | 子代理驱动开发 |
| **verification-before-completion** | [skills-superpowers/verification-before-completion](skills-superpowers/verification-before-completion/SKILL.md) | 完成前验证 |
| **using-git-worktrees** | [skills-superpowers/using-git-worktrees](skills-superpowers/using-git-worktrees/SKILL.md) | Git Worktrees 使用 |
| **code-review** | [skills-superpowers/requesting-code-review](skills-superpowers/requesting-code-review/SKILL.md) | 代码审查流程 |

### 官方插件技能（文档与设计）

| 类别 | 数量 | 路径 |
|------|------|------|
| **文档处理** | 16 | [skills-plugins/document-skills/](skills-plugins/document-skills/) |
| **示例技能** | 16 | [skills-plugins/example-skills/](skills-plugins/example-skills/) |

文档处理技能包括：
- DOCX 处理、PDF 处理、PPTX 处理、XLSX 处理
- 前端设计、品牌指南、画布设计
- Web 应用测试、人工制品构建等

### 子技能（创意与工具）

热门技能包括：
- **algorithmic-art**: 算法艺术生成
- **canvas-design**: 画布设计
- **frontend-design**: 前端设计
- **doc-coauthoring**: 文档协作
- **mcp-builder**: MCP 服务器构建
- **skill-creator**: 技能创建器
- **theme-factory**: 主题工厂

完整列表请查看 [skills-sub/](skills-sub/) 目录。

---

## 🤖 Agent 索引（129 个）

Smart Flow 支持 **129 个专业 Agent**，按领域分类：

### 🆕 Showcase 精选 Agents (8个新增)

| Agent | 来源 | 功能 |
|-------|------|------|
| **plan-reviewer_showcase** | showcase | 实施前计划审查，识别潜在问题 |
| **refactor-planner_showcase** | showcase | 创建详细重构计划和风险评估 |
| **code-refactor-master_showcase** | showcase | 执行复杂重构，追踪依赖关系 |
| **auto-error-resolver_showcase** | showcase | 自动修复 TypeScript 编译错误 |
| **frontend-error-fixer_showcase** | showcase | 调试和修复前端错误 |
| **code-architecture-reviewer_showcase** | showcase | 审查代码架构一致性和最佳实践 |
| **web-research-specialist_showcase** | showcase | 创意搜索和深度研究 |
| **documentation-architect_showcase** | showcase | 生成全面的技术文档 |

### 核心开发（20+）
- `product-manager` - 产品经理
- `ui-ux-designer` - UI/UX 设计师
- `database-architect` - 数据库架构师
- `backend-architect` - 后端架构师
- `frontend-developer` - 前端开发
- `backend-developer` - 后端开发
- `test-automator` - 测试工程师
- `security-auditor` - 安全专家

### 编程语言专项（11+）
- `python-expert` - Python 专家
- `typescript-expert` - TypeScript 专家
- `javascript-developer` - JavaScript 开发
- `golang-expert` - Go 专家
- `java-developer` - Java 开发
- `cpp-engineer` - C++ 工程师
- `rust-expert` - Rust 专家
- `c-developer` - C 语言专家

### AI & 数据（10+）
- `ai-engineer` - AI 工程师
- `prompt-engineer` - Prompt 优化专家
- `data-engineer` - 数据工程师
- `ml-engineer` - 机器学习工程师
- `mlops-engineer` - MLOps 工程师
- `data-scientist` - 数据科学家
- `data-analyst` - 数据分析师

### 部署 & 运维（10+）
- `deployment-engineer` - 部署工程师
- `devops-troubleshooter` - DevOps 故障排查
- `cloud-architect` - 云架构师
- `db-deploy` - 数据库部署专家
- `github-actions-runner` - GitHub Actions 专家
- `incident-responder` - 生产事故处理

### 研究 & 分析（10+）
- `research-orchestrator` - 研究协调器
- `comprehensive-researcher` - 综合研究员
- `technical-researcher` - 技术研究员
- `academic-researcher` - 学术研究员
- `market-research-analyst` - 市场研究分析师

### 其他领域（60+）
包括网络工程师、调试专家、性能工程师、代码审查、移动开发、区块链、加密货币、MCP 专家等。

**完整 Agent 列表**: 请查看 [agents/](agents/) 目录，所有 Agent 定义文件按名称组织。

---

## ⚡ 斜杠命令（11 个）

斜杠命令提供快速调用方式：

| 命令 | 功能 | 文件 |
|------|------|------|
| `/commit` | Git 提交 | [commit.md](commands/commit.md) |
| `/深度思考` | 深度思考模式 | [深度思考.md](commands/深度思考.md) |
| `/深度分析` | 多角度分析 | [深度分析.md](commands/深度分析.md) |
| `/循环` | 自动循环执行 | [循环.md](commands/循环.md) |
| `/自动循环` | 一键启动循环 | [自动循环.md](commands/自动循环.md) |
| `/反复` | 反复执行 | [反复.md](commands/反复.md) |

完整索引请查看 [commands/INDEX.md](commands/INDEX.md)。

---

## 📖 使用指南

### 如何调用技能

#### 1. 自动匹配（推荐）

直接描述任务，Smart Flow 会自动匹配最合适的技能或 Agent：

```
"帮我开发一个用户登录功能" → 自动匹配 feature-development
"审查这段代码" → 自动匹配 code-reviewer
"部署项目到服务器" → 自动匹配 db-deploy
```

#### 2. 明确指定技能

```
"使用 feature-development 技能开发用户管理"
"调用 python-expert agent 优化代码"
"启动 smart-workflow 工作流"
```

#### 3. 使用斜杠命令

```
/commit                    # 创建 Git 提交
/深度思考 如何设计系统？   # 启动深度思考
/循环 让测试通过           # 自动循环执行
```

### 完整工作流示例

#### 场景 1: 开发新功能

```
# 1. 启动 Smart Flow 工作流
/smart-flow

# 2. 自动执行：
#    - 需求澄清（requirements-clarity）
#    - 任务分解（task-decomposer）
#    - 并行执行（parallel-executor）
#      ├─ product-manager（PRD）
#      ├─ ui-ux-designer（UI 设计）
#      ├─ database-architect（数据库设计）
#      ├─ backend-architect（API 设计）
#      ├─ frontend-developer（前端实现）
#      ├─ test-automator（测试用例）
#      └─ security-auditor（安全审查）
#    - 结果整合（result-synthesizer）

# 3. 完成后创建 Git 提交
/commit --style=full --type=feat
```

#### 场景 2: 快速修复 Bug

```
# 使用 auto-fix 技能
"使用 auto-fix 修复测试失败"

# 自动循环直到测试通过
/循环 修复Bug 次数 20 完成 测试全部通过

# 提交修复
/commit --type=fix
```

#### 场景 3: 技术调研

```
# 使用 research-orchestrator
"使用 research-orchestrator 调研微服务架构"

# 或者深度思考
/深度思考 如何设计高可用系统？
```

---

## 🎯 技能选择指南

### 按任务类型选择

| 任务类型 | 推荐技能/Agent |
|---------|--------------|
| **需求不明确** | `brainstorming`, `requirements-clarity`, `smart-workflow` |
| **新功能开发** | `feature-development`, `smart-workflow` |
| **Bug 修复** | `auto-fix`, `debugger`, `systematic-debugging` |
| **代码审查** | `code-reviewer`, `security-auditor` |
| **性能优化** | `performance-engineer`, `database-optimizer` |
| **部署上线** | `db-deploy`, `deployment-engineer`, `deployment-test` |
| **技术调研** | `research-orchestrator`, `technical-researcher`, `/深度思考` |
| **文档编写** | `doc-coauthoring`, `api-documenter`, `documentation-architect` |
| **测试相关** | `test-driven-development`, `test-automator` |
| **并行任务** | `dispatching-parallel-agents`, `parallel-executor` |

### 按项目阶段选择

| 阶段 | 推荐技能 |
|------|---------|
| **需求分析** | `brainstorming`, `requirements-clarity`, `product-manager` |
| **技术设计** | `writing-plans`, `backend-architect`, `database-architect` |
| **开发实施** | `feature-development`, `subagent-driven-development` |
| **测试验证** | `test-driven-development`, `verification-before-completion` |
| **代码审查** | `requesting-code-review`, `code-reviewer` |
| **部署上线** | `db-deploy`, `deployment-test` |
| **运维监控** | `incident-responder`, `devops-troubleshooter` |

---

## 🔧 高级功能

### 1. 并行 Agent 调用

Smart Flow 的核心优势是并行调用多个 Agent：

```
# parallel-executor 会自动：
1. 识别任务依赖关系
2. 将无依赖任务并行执行
3. 实时追踪进度
4. 整合所有输出
```

示例：同时调用 5 个 Agent
- 产品经理（PRD）
- UI 设计师（UI 设计）
- 数据库架构师（数据库设计）
- 后端架构师（API 设计）
- 前端开发（页面实现）

### 2. 断点续传

Smart Flow 支持保存执行状态，可以中断后继续：

```
/smart-flow resume EXEC-2025-01-07-001
```

### 3. 历史记录

每次执行都会保存完整记录：
- 需求文档
- 任务清单
- Agent 输出
- 执行摘要
- 错误日志

### 4. 自定义 Agent

你可以添加自己的 Agent 定义到 `agents/` 目录：

```markdown
---
name: my-specialist
description: 我的专属专家
category: custom
---

You are a specialist in...
```

---

## 📚 参考文档

### 官方文档
- [Smart Flow README](README.md)
- [安装指南](INSTALL.md)
- [市场安装指南](MARKET_INSTALL.md)
- [架构设计](docs/ARCHITECTURE.md)
- [Agent 列表](docs/AGENT_LIST.md)
- [自定义指南](docs/CUSTOMIZATION.md)

### 外部参考
- [Superpowers](https://github.com/obra/superpowers) - 灵感来源
- [Claude Code 文档](https://claude.com/claude-code) - Claude Code 官方文档
- [用户目录索引](C:/Users/superma/.claude/SKILLS_AND_AGENTS_INDEX.md) - 本地资源索引

---

## 🤝 贡献指南

### 如何添加新技能

1. 在对应的 `skills-*/` 目录下创建新技能目录
2. 创建 `SKILL.md` 文件
3. 添加 YAML frontmatter：
   ```yaml
   ---
   name: skill-name
   description: 技能描述
   license: MIT
   ---
   ```
4. 编写技能文档
5. 更新本索引文件

### 如何添加新 Agent

1. 在 `agents/` 目录创建 `<agent-name>.md` 文件
2. 添加 Agent 定义
3. 更新本索引文件

### 如何添加新命令

1. 在 `commands/` 目录创建 `<command-name>.md` 文件
2. 添加命令描述和用法
3. 更新 `commands/INDEX.md`

---

## 📝 版本历史

### v2.1.0 (2025-01-10) - Showcase 整合版
- ✅ 新增 8 个 Showcase 精选 Agents
- ✅ 新增自动触发 Hooks (smart-flow-trigger)
- ✅ 新增 smart-flow-rules.json 配置
- ✅ 拆分 smart-workflow 资源文件
- ✅ 更新统一索引
- ✅ 总资源量: 129 Agents + 132 技能 + 11 命令

### v2.0.0 (2025-01-07) - 全量整合版
- ✅ 整合 122 个 Agent
- ✅ 整合 132 个技能
- ✅ 整合 11 个命令
- ✅ 创建统一索引
- ✅ 支持按需加载
- ✅ 完整的分类和导航

### v1.0.0 (2025-01-07) - MVP 版本
- ✅ 5 个核心工作流技能
- ✅ 基础功能实现

---

## 📮 联系我们

- GitHub: [smart-flow](https://github.com/XX-Trader/smart-flow)
- Issues: [smart-flow/issues](https://github.com/XX-Trader/smart-flow/issues)

---

**Smart Flow v2.0.0 - 让 AI 成为你的项目经理和开发专家** 🚀
