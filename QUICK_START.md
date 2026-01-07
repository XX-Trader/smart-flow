# Smart Flow - 本地快速部署指南

本指南帮助你立即在本地使用 Smart Flow，无需 GitHub。

## 📦 快速安装（2分钟）

### Windows 用户

#### 步骤 1: 复制插件

打开 **PowerShell** 或 **Git Bash**，执行：

```powershell
# PowerShell 命令
# 创建目标目录
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.claude\skills"

# 复制插件
Copy-Item -Path "d:\学习资料\量化交易\大白文件2021.5.31\CoinGod_Web\smart-flow" -Destination "$env:USERPROFILE\.claude\skills\" -Recurse -Force

# 验证安装
Get-ChildItem "$env:USERPROFILE\.claude\skills\smart-flow\skills"
```

或使用 **Git Bash**：

```bash
# 创建目录
mkdir -p ~/.claude/skills

# 复制插件
cp -r "/d/学习资料/量化交易/大白文件2021.5.31/CoinGod_Web/smart-flow" ~/.claude/skills/

# 验证
ls ~/.claude/skills/smart-flow/skills
```

#### 步骤 2: 配置 Claude Code

打开 **记事本** 或 **VS Code**，编辑文件：

```
C:\Users\你的用户名\.claude\CLAUDE.md
```

在文件末尾添加（复制以下内容）：

```markdown
## Smart Flow

You have Smart Flow installed. Smart Flow is an intelligent task orchestration plugin that automatically manages requirements clarification, task decomposition, parallel agent execution, and result synthesis.

**When to use:**
- User wants to build a feature or start a new project
- Requirements are unclear or incomplete
- User inputs "新增"、"开发"、"实现"、"制作" keywords
- User explicitly triggers with `/smart-flow` or `/sf`

**How it works:**
1. Requirements Clarity - Systematic questioning
2. Task Decomposer - Identify professional domains
3. Parallel Executor - Execute concurrently
4. Result Synthesizer - Generate report

**Manual Trigger:**
- `/smart-flow` or `/sf`

**Automatic Trigger:**
Yes, when requirements are vague.
```

保存文件。

#### 步骤 3: 验证安装

启动 Claude Code：

```powershell
claude
```

测试：

```
/smart-flow
```

### Mac/Linux 用户

```bash
# 1. 复制插件
mkdir -p ~/.claude/skills
cp -r smart-flow ~/.claude/skills/

# 2. 配置（如果文件不存在则创建）
cat >> ~/.claude/CLAUDE.md << 'EOF'

## Smart Flow

You have Smart Flow installed. Use smart-flow skills for intelligent task orchestration.

**Trigger:** /smart-flow or /sf
**Auto-trigger:** Yes, when requirements are vague.
EOF

# 3. 验证
ls ~/.claude/skills/smart-flow/skills
```

## 🚀 立即使用

安装完成后，在 Claude Code 中测试：

```
/smart-flow
我想做一个简单的待办事项应用，包含增删改查功能
```

Smart Flow 会：
1. 询问细节需求
2. 分解成多个任务
3. 并行执行多个 agent
4. 生成完整报告

## ✅ 验证清单

安装成功的标志：

- [ ] `~/.claude/skills/smart-flow/` 目录存在
- [ ] 其下有 `skills/` 目录，包含 5 个技能文件夹
- [ ] `~/.claude/CLAUDE.md` 包含 Smart Flow 配置
- [ ] Claude Code 中输入 `/smart-flow` 能触发

## 🐛 常见问题

### Q: 提示 "command not found: claude"

**A**: Claude Code 未安装或未在 PATH 中。请先安装 Claude Code。

### Q: 复制文件失败

**A**:
- Windows: 确保使用 PowerShell 或 Git Bash
- 检查源路径是否正确
- 确保目标目录有写权限

### Q: 配置文件找不到

**A**:
- Windows: `C:\Users\你的用户名\.claude\CLAUDE.md`
- Mac/Linux: `~/.claude/CLAUDE.md`
- 如果不存在，手动创建

### Q: /smart-flow 无反应

**A**:
1. 确认 CLAUDE.md 已正确配置
2. 重启 Claude Code
3. 检查技能文件是否存在

## 📚 更多文档

- [docs/LOCAL_USAGE_GUIDE.md](LOCAL_USAGE_GUIDE.md) - 详细使用指南
- [README.md](README.md) - 项目介绍
- [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md) - 项目总结

## 🎉 开始使用

现在 Smart Flow 已经安装在你的本地机器上，可以立即开始使用！

尝试第一个项目：

```
/smart-flow
帮我做一个用户登录功能
```

---

**快速安装完成！** 🎊
