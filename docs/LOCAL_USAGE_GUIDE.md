# Smart Flow 本地使用指南

本指南帮助你立即在本地使用 Smart Flow 插件。

## 🚀 快速开始（5分钟上手）

### 步骤 1: 确认 Claude Code 安装

打开命令行/终端，检查 Claude Code：

```bash
# Windows (Git Bash 或 PowerShell)
claude --version

# Mac/Linux
claude --version
```

如果显示版本号，说明已安装。

### 步骤 2: 复制插件到 Claude Code 目录

#### Windows 用户

```bash
# 使用 Git Bash 或 PowerShell
# 创建目标目录（如果不存在）
mkdir -p ~/.claude/plugins

# 复制插件
cp -r "d:/学习资料/量化交易/大白文件2021.5.31/CoinGod_Web/smart-flow" ~/.claude/plugins/
```

或者使用 Windows 资源管理器：
1. 打开 `C:\Users\你的用户名\.claude\plugins\`
2. 如果不存在，创建该目录
3. 将 `smart-flow` 文件夹复制到该目录

#### Mac/Linux 用户

```bash
# 创建目标目录
mkdir -p ~/.claude/plugins

# 复制插件
cp -r smart-flow ~/.claude/plugins/
```

### 步骤 3: 配置 Claude Code

编辑全局配置文件：

#### Windows
```bash
# 使用记事本或 VS Code
notepad C:\Users\你的用户名\.claude\CLAUDE.md
```

#### Mac/Linux
```bash
# 使用 nano 或 vim
nano ~/.claude/CLAUDE.md
```

在文件末尾添加以下内容：

```markdown
## Smart Flow

You have Smart Flow installed. Smart Flow is an intelligent task orchestration plugin that automatically manages requirements clarification, task decomposition, parallel agent execution, and result synthesis.

**When to use:**
- User wants to build a feature or start a new project
- Requirements are unclear or incomplete
- User inputs "新增"、"开发"、"实现"、"制作" keywords
- User explicitly triggers with `/smart-flow` or `/sf`

**How it works:**
1. Requirements Clarity - Systematic questioning to clarify all ambiguities
2. Task Decomposer - Automatically identify required professional domains
3. Parallel Executor - Execute tasks with multiple agents concurrently
4. Result Synthesizer - Generate comprehensive report

**Manual Trigger:**
- `/smart-flow` or `/sf`

**Automatic Trigger:**
Smart Flow will automatically trigger when requirements are vague or incomplete.

**Available Skills:**
- smart-flow:smart-workflow (main workflow)
- smart-flow:requirements-clarity (requirement clarification)
- smart-flow:task-decomposer (task decomposition)
- smart-flow:parallel-executor (parallel execution)
- smart-flow:result-synthesizer (result synthesis)

**Agents Supported:** 67+ specialized agents across development, design, deployment, and more.
```

保存并关闭文件。

### 步骤 4: 验证安装

启动 Claude Code：

```bash
claude
```

在 Claude Code 中输入：

```
/help
```

你应该看到 Smart Flow 相关的命令（如果集成成功）。

或者直接测试：

```
/smart-flow
```

应该看到类似输出：

```
Smart Flow: 启动智能任务调度流程...
[进入阶段 1: 需求澄清]
```

## 📖 详细使用指南

### 使用场景 1: 自动触发（推荐）

当你说"帮我做一个功能"时，Smart Flow 会自动启动：

```
你: 帮我做一个用户登录功能

Smart Flow: 检测到模糊需求，启动需求澄清流程...

[阶段 1: 需求澄清]
Q1: 功能目标是什么？
A: 允许用户使用邮箱或手机号登录网站
Q2: 目标用户是谁？
A: 网站注册用户
...

[阶段 2: 任务分解]
✅ 已识别 8 个任务，分为 3 个并行阶段

[阶段 3: 并行执行]
⏳ 正在同时执行 7 个 agent...
   ✅ product-manager (100%) - 12 分钟
   ✅ ui-ux-designer (100%) - 18 分钟
   ...

[阶段 4: 结果整合]
✅ 完整报告已生成!
- smart-flow-report-2025-01-07.md
```

### 使用场景 2: 手动触发

任何时候都可以手动启动：

```
你: /smart-flow

Smart Flow: 启动智能任务调度流程...
[进入阶段 1: 需求澄清]
```

或者使用简写：

```
你: /sf

Smart Flow: 启动智能任务调度流程...
```

### 使用场景 3: 单独使用各个技能

你也可以单独使用 Smart Flow 的各个技能：

#### 仅需求澄清

```
你: Use smart-flow:requirements-clarity

Smart Flow: 启动需求澄清流程...
[系统性提问，澄清所有细节]
```

#### 仅任务分解

```
你: Use smart-flow:task-decomposer

Smart Flow: 分析需求并分解任务...
[生成任务清单]
```

#### 仅并行执行

```
你: Use smart-flow:parallel-executor

Smart Flow: 并行执行多个 agent...
[同时执行多个任务]
```

## 🎯 实际使用示例

### 示例 1: 开发用户登录功能

```
你: /smart-flow
我想做一个用户登录功能，支持邮箱和手机号登录

Smart Flow:
[阶段 1: 需求澄清]
Q1: 登录功能的目标用户是谁?
A: 网站注册用户
Q2: 需要支持第三方登录吗(微信/GitHub)?
A: 暂时不需要
Q3: 需要记住登录状态吗?
A: 需要
Q4: 密码有什么安全要求?
A: 必须加密存储
...

[阶段 2: 任务分解]
✅ 已识别 8 个任务:
1. product-manager - 产品需求文档
2. ui-ux-designer - UI 设计
3. database-architect - 数据库设计
4. backend-architect - API 设计
5. frontend-developer - 前端实现
6. backend-developer - 后端实现
7. test-automator - 测试用例
8. security-auditor - 安全审查

[阶段 3: 并行执行]
⏳ 执行中...

[阶段 4: 结果整合]
✅ 完整报告已生成!
包含: PRD、UI设计、数据库schema、API文档、前后端代码、测试用例、安全审查报告
```

### 示例 2: 开发电商网站

```
你: 帮我做一个电商网站

Smart Flow: 检测到模糊需求，启动需求澄清...

[系统性提问]
Q1: 电商网站要卖什么商品?
A: 电子产品
Q2: 目标市场是哪里?
A: 中国
Q3: 需要支付功能吗?
A: 需要，支持微信和支付宝
...

[自动识别 15+ 个专业领域]
[并行执行，大幅提升效率]
[生成完整报告]
```

## 🔧 高级使用

### 恢复未完成的执行

如果 Smart Flow 执行中断，可以恢复：

```
你: /smart-flow resume

Smart Flow: 检测到未完成的执行:
执行 ID: EXEC-2025-01-07-001
已完成: 3/8 任务
是否继续? [1. 继续 2. 重新开始]

你: 1

Smart Flow: 继续执行...
```

### 查看历史记录

```
你: /smart-flow history

Smart Flow: 历史执行记录:
- EXEC-2025-01-07-001: 用户登录功能 (完成)
- EXEC-2025-01-06-002: 数据库优化 (完成)
- EXEC-2025-01-05-003: API设计 (中断)
```

### 自定义 Agent

你可以添加自定义 Agent 配置：

1. 编辑 `~/.claude/plugins/smart-flow/agents/core/my-agent.md`
2. 在 `task-decomposer` 中添加映射规则

## ⚙️ 配置选项

### 修改触发关键词

编辑 `~/.claude/plugins/smart-flow/skills/smart-workflow/SKILL.md`，修改触发条件部分。

### 修改 Agent 数量

编辑 `~/.claude/plugins/smart-flow/skills/task-decomposer/SKILL.md`，添加/删除 Agent 映射。

### 修改并行度

编辑 `~/.claude/plugins/smart-flow/skills/parallel-executor/SKILL.md`，修改 `MAX_CONCURRENT_AGENTS`。

## 🐛 故障排除

### 问题 1: 无法触发 Smart Flow

**症状**: 输入需求没有自动触发 Smart Flow

**解决方案**:
1. 检查 `~/.claude/CLAUDE.md` 是否正确配置
2. 重启 Claude Code
3. 尝试手动触发: `/smart-flow`

### 问题 2: Agent 无法找到

**症状**: 报错 "Agent xxx not found"

**解决方案**:
1. 检查 Agent 名称拼写
2. 查看 `docs/AGENT_LIST.md` 确认可用 Agent
3. 在 `task-decomposer` 中添加该 Agent 映射

### 问题 3: 执行卡住不动

**症状**: 执行到某个阶段卡住

**解决方案**:
1. 按 `Ctrl+C` 中断
2. 使用 `/smart-flow resume` 恢复
3. 查看执行状态文件

### 问题 4: 报告文件找不到

**症状**: 执行完成后找不到生成的报告

**解决方案**:
1. 报告在当前工作目录
2. 文件名格式: `smart-flow-report-YYYY-MM-DD.md`
3. 使用 `find . -name "smart-flow-report-*"` 搜索

## 📚 学习资源

- [README.md](README.md) - 项目介绍
- [INSTALL.md](INSTALL.md) - 安装指南
- [docs/AGENT_LIST.md](docs/AGENT_LIST.md) - Agent 列表
- [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md) - 项目总结

## 💡 最佳实践

1. **始终从需求澄清开始**: 不要跳过需求澄清阶段
2. **让 Smart Flow 完整执行**: 尽量让所有 Agent 完成
3. **查看生成的报告**: 完整报告包含所有 Agent 的输出
4. **根据报告实施**: 报告中的代码可以直接使用
5. **保存执行历史**: 重要项目的历史记录很有价值

## 🎉 开始使用

现在你可以开始使用 Smart Flow 了！

建议的第一次使用：

```
/smart-flow
我想做一个简单的待办事项应用
```

体验完整的四阶段工作流！

---

**文档版本**: v1.0.0
**最后更新**: 2025-01-07
