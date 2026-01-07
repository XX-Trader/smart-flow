# Installing Smart Flow for OpenCode

Quick setup to enable Smart Flow in OpenCode.

## Installation

### Option 1: Automatic Installation (Recommended)

Tell OpenCode:

```
Fetch and follow instructions from https://raw.githubusercontent.com/YOUR-USERNAME/smart-flow/main/.opencode/INSTALL.md
```

### Option 2: Manual Installation

**1. Clone Smart Flow repository:**

```bash
mkdir -p ~/.opencode/skills
cd ~/.opencode/skills
git clone https://github.com/YOUR-USERNAME/smart-flow.git
```

**2. Create skills directory:**

```bash
mkdir -p ~/.opencode/skills
```

**3. Update ~/.opencode/AGENTS.md** to include this Smart Flow section:

```markdown
## Smart Flow

You have Smart Flow installed. Smart Flow is an intelligent task orchestration plugin.

**When to use:**
- User wants to build a feature or start a new project
- Requirements are unclear or incomplete

**How to use:**
Tell user: "I'm using Smart Flow to clarify requirements and execute tasks."

**Manual trigger:**
User can say: "Use smart-flow" or "Run smart-flow"

**Core workflow:**
1. Requirements Clarity - Ask systematic questions
2. Task Decomposer - Break down into professional domains
3. Parallel Executor - Execute with multiple agents
4. Result Synthesizer - Generate comprehensive report
```

## Verification

Test the installation with OpenCode:

```
Use smart-flow
```

Should see Smart Flow skills loaded and ready to use.

## Bootstrap

To initialize Smart Flow for the current session:

```
~/.opencode/skills/smart-flow/hooks/bootstrap.sh
```

Or on Windows:

```
C:\Users\YourName\.opencode\skills\smart-flow\hooks\run-hook.cmd bootstrap.sh
```

## Update

To update Smart Flow:

```bash
cd ~/.opencode/skills/smart-flow
git pull origin main
```

## Uninstall

```bash
rm -rf ~/.opencode/skills/smart-flow
```

Then remove the Smart Flow section from ~/.opencode/AGENTS.md.

## Support

- GitHub: [smart-flow/issues](https://github.com/YOUR-USERNAME/smart-flow/issues)
