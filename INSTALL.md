# Smart Flow 安装指南

## 前置要求

- Claude Code 已安装
- 基本的命令行操作知识
- Git 客户端

## 安装步骤

### 方式 1: Git Clone (推荐)

```bash
# 1. 进入 Claude Code 插件目录
cd ~/.claude/plugins

# 2. 克隆 Smart Flow 插件
git clone https://github.com/YOUR-USERNAME/smart-flow.git

# 3. 验证安装
ls smart-flow/skills
# 应该看到:
# smart-workflow/
# requirements-clarity/
# task-decomposer/
# parallel-executor/
# result-synthesizer/
```

### 方式 2: 手动下载

```bash
# 1. 下载插件
# 从 GitHub Releases 下载 smart-flow-v1.0.0.zip

# 2. 解压到插件目录
cd ~/.claude/plugins
unzip smart-flow-v1.0.0.zip
```

## 配置 Claude Code

### 步骤 1: 编辑全局 CLAUDE.md

```bash
# 编辑全局配置文件
nano ~/.claude/CLAUDE.md
```

### 步骤 2: 添加 Smart Flow 配置

在 `~/.claude/CLAUDE.md` 文件末尾添加：

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

**Key Principles:**
- Never guess requirements - always ask first
- Parallel execution for maximum efficiency
- Support 40+ specialized agents
- Automatic integration of all outputs

**Required Skills:**
- smart-flow:smart-workflow (main workflow)
- smart-flow:requirements-clarity (requirement clarification)
- smart-flow:task-decomposer (task decomposition)
- smart-flow:parallel-executor (parallel execution)
- smart-flow:result-synthesizer (result synthesis)

**Manual Trigger:**
User can trigger Smart Flow by saying:
- `/smart-flow` or `/sf`
- `/smart-flow start`

**Automatic Trigger:**
Smart Flow will automatically trigger when:
- User input contains "新增"、"开发"、"实现"、"制作" keywords
- Requirements are vague (< 50 characters)
- User says "帮我做一个功能"
```

### 步骤 3: (可选) 添加项目级配置

如果只想在特定项目中使用 Smart Flow，在项目的 `CLAUDE.md` 中添加相同配置。

## 验证安装

### 测试 1: 检查插件文件

```bash
# 检查插件文件是否存在
ls -la ~/.claude/plugins/smart-flow/skills/

# 应该看到:
# smart-workflow/
# requirements-clarity/
# task-decomposer/
# parallel-executor/
# result-synthesizer/
```

### 测试 2: 检查主技能文件

```bash
# 查看主技能文件
cat ~/.claude/plugins/smart-flow/skills/smart-workflow/SKILL.md

# 应该看到完整的技能定义
```

### 测试 3: 实际测试

启动 Claude Code，输入：

```
/smart-flow
```

应该看到类似输出：

```
Smart Flow: 启动智能任务调度流程...
[进入阶段 1: 需求澄清]
```

## 卸载

```bash
# 删除插件目录
rm -rf ~/.claude/plugins/smart-flow

# 从 CLAUDE.md 中删除 Smart Flow 配置
nano ~/.claude/CLAUDE.md
# 删除 ## Smart Flow 部分
```

## 更新

```bash
# 进入插件目录
cd ~/.claude/plugins/smart-flow

# 拉取最新代码
git pull origin main

# 或者重新克隆
cd ..
rm -rf smart-flow
git clone https://github.com/YOUR-USERNAME/smart-flow.git
```

## 常见问题

### Q1: 安装后无法触发？

**解决方案**:
1. 检查 `~/.claude/CLAUDE.md` 是否正确配置
2. 重启 Claude Code
3. 确认技能文件路径正确

### Q2: Agent 无法找到？

**解决方案**:
1. 确认 agent 名称正确（区分大小写）
2. 检查 `agents/` 目录中是否有对应配置
3. 查看 Claude Code 日志

### Q3: 执行卡住不动？

**解决方案**:
1. 按 `Ctrl+C` 中断
2. 使用 `/smart-flow resume` 恢复
3. 查看执行状态文件

### Q4: 如何只使用部分功能？

Smart Flow 是模块化的，可以单独使用各个技能：

```
# 只使用需求澄清
Use smart-flow:requirements-clarity

# 只使用任务分解
Use smart-flow:task-decomposer

# 只使用并行执行
Use smart-flow:parallel-executor
```

## 下一步

- 阅读 [README.md](README.md) 了解使用示例
- 查看 [ARCHITECTURE.md](docs/ARCHITECTURE.md) 了解架构设计
- 参考 [CUSTOMIZATION.md](docs/CUSTOMIZATION.md) 自定义配置

## 技术支持

- GitHub Issues: [smart-flow/issues](https://github.com/YOUR-USERNAME/smart-flow/issues)
- Email: your-email@example.com

---

**安装成功后，您就可以开始使用 Smart Flow 了！** 🎉
