# Installing Smart Flow for Claude Code

Quick setup to enable Smart Flow in Claude Code.

## Installation

### Option 1: Automatic Installation (Recommended)

In Claude Code, tell me:

```
Fetch and follow instructions from https://raw.githubusercontent.com/YOUR-USERNAME/smart-flow/main/.claude/INSTALL.md
```

### Option 2: Manual Installation

**1. Clone Smart Flow repository:**

```bash
cd ~/.claude/plugins
git clone https://github.com/YOUR-USERNAME/smart-flow.git
```

**2. Verify installation:**

Check that skills are loaded:

```bash
ls ~/.claude/plugins/smart-flow/skills/
```

Should see:
- smart-workflow/
- requirements-clarity/
- task-decomposer/
- parallel-executor/
- result-synthesizer/

**3. Configure Claude Code:**

Edit `~/.claude/CLAUDE.md` and add:

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
Yes, when requirements are vague or incomplete.
```

## Verification

Test the installation in Claude Code:

```
/smart-flow
```

Should see:
```
Smart Flow: 启动智能任务调度流程...
[进入阶段 1: 需求澄清]
```

## Bootstrap

To initialize Smart Flow for the current session:

```
Run: ~/.claude/plugins/smart-flow/hooks/bootstrap.sh
```

Or on Windows:

```
Run: C:\Users\YourName\.claude\plugins\smart-flow\hooks\run-hook.cmd bootstrap.sh
```

## Update

To update Smart Flow to the latest version:

```bash
cd ~/.claude/plugins/smart-flow
git pull origin main
```

## Uninstall

```bash
# Remove Smart Flow
rm -rf ~/.claude/plugins/smart-flow

# Remove Smart Flow section from ~/.claude/CLAUDE.md
```

## Support

- GitHub: [smart-flow/issues](https://github.com/YOUR-USERNAME/smart-flow/issues)
- Email: your-email@example.com
