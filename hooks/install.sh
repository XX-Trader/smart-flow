#!/bin/bash
# Smart Flow Installation Hook
# This script installs Smart Flow for Claude Code, Codex, or OpenCode

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SMART_FLOW_DIR="$(dirname "$SCRIPT_DIR")"

echo "🚀 Smart Flow Installation"
echo "=========================="
echo ""

# Detect platform
if [ -n "$CLAUDE_CODE" ]; then
    PLATFORM="claude-code"
    echo "✅ Detected: Claude Code"
elif [ -n "$CODEX" ]; then
    PLATFORM="codex"
    echo "✅ Detected: Codex"
elif command -v open-code &> /dev/null; then
    PLATFORM="opencode"
    echo "✅ Detected: OpenCode"
else
    echo "❌ Error: Unable to detect platform"
    echo "   Supported platforms: Claude Code, Codex, OpenCode"
    exit 1
fi

# Install for Claude Code
if [ "$PLATFORM" = "claude-code" ]; then
    echo ""
    echo "📦 Installing for Claude Code..."

    # Claude Code uses ~/.claude/plugins/ directory
    PLUGINS_DIR="$HOME/.claude/plugins"

    # Create directory if it doesn't exist
    mkdir -p "$PLUGINS_DIR"

    # Copy Smart Flow to plugins directory
    if [ -d "$PLUGINS_DIR/smart-flow" ]; then
        echo "⚠️  Smart Flow already exists. Updating..."
        rm -rf "$PLUGINS_DIR/smart-flow"
    fi

    cp -r "$SMART_FLOW_DIR" "$PLUGINS_DIR/smart-flow"

    echo "✅ Installed to: $PLUGINS_DIR/smart-flow"

    # Configure CLAUDE.md
    CLAUDE_MD="$HOME/.claude/CLAUDE.md"
    if [ -f "$CLAUDE_MD" ]; then
        echo ""
        echo "📝 Updating $CLAUDE_MD..."

        # Check if Smart Flow section already exists
        if grep -q "## Smart Flow" "$CLAUDE_MD"; then
            echo "⚠️  Smart Flow section already exists in CLAUDE.md"
            echo "   Please manually update it if needed"
        else
            # Append Smart Flow configuration
            cat >> "$CLAUDE_MD" << 'EOF'

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
EOF
            echo "✅ Added Smart Flow configuration to CLAUDE.md"
        fi
    else
        echo "⚠️  Warning: $CLAUDE_MD not found"
        echo "   Please manually configure Smart Flow in your CLAUDE.md"
    fi

    echo ""
    echo "🎉 Installation complete!"
    echo ""
    echo "📖 Quick Start:"
    echo "   1. Restart Claude Code"
    echo "   2. Type: /smart-flow"
    echo "   3. Follow the prompts"
    echo ""
    echo "📚 Documentation:"
    echo "   $SKILLS_DIR/smart-flow/README.md"
fi

# Install for Codex
if [ "$PLATFORM" = "codex" ]; then
    echo ""
    echo "📦 Installing for Codex..."

    # Codex uses ~/.codex/skills/ directory
    SKILLS_DIR="$HOME/.codex/skills"

    # Create directory if it doesn't exist
    mkdir -p "$SKILLS_DIR"

    # Copy Smart Flow to skills directory
    if [ -d "$SKILLS_DIR/smart-flow" ]; then
        echo "⚠️  Smart Flow already exists. Updating..."
        rm -rf "$SKILLS_DIR/smart-flow"
    fi

    cp -r "$SMART_FLOW_DIR" "$SKILLS_DIR/smart-flow"

    echo "✅ Installed to: $SKILLS_DIR/smart-flow"

    # Configure AGENTS.md
    AGENTS_MD="$HOME/.codex/AGENTS.md"
    if [ -f "$AGENTS_MD" ]; then
        echo ""
        echo "📝 Updating $AGENTS_MD..."

        # Check if Smart Flow section already exists
        if grep -q "## Smart Flow" "$AGENTS_MD"; then
            echo "⚠️  Smart Flow section already exists in AGENTS.md"
        else
            # Append Smart Flow configuration
            cat >> "$AGENTS_MD" << 'EOF'

## Smart Flow

You have Smart Flow installed. Smart Flow is an intelligent task orchestration plugin.

**When to use:**
- User wants to build a feature or start a new project
- Requirements are unclear or incomplete

**How to use:**
Tell user: "I'm using Smart Flow to clarify requirements and execute tasks."

**Manual trigger:**
User can say: "Use smart-flow" or "Run smart-flow"
EOF
            echo "✅ Added Smart Flow configuration to AGENTS.md"
        fi
    else
        echo "⚠️  Warning: $AGENTS_MD not found"
        echo "   Please manually configure Smart Flow in your AGENTS.md"
    fi

    echo ""
    echo "🎉 Installation complete!"
fi

# Install for OpenCode
if [ "$PLATFORM" = "opencode" ]; then
    echo ""
    echo "📦 Installing for OpenCode..."

    # OpenCode uses ~/.opencode/skills/ directory
    SKILLS_DIR="$HOME/.opencode/skills"

    # Create directory if it doesn't exist
    mkdir -p "$SKILLS_DIR"

    # Copy Smart Flow to skills directory
    if [ -d "$SKILLS_DIR/smart-flow" ]; then
        echo "⚠️  Smart Flow already exists. Updating..."
        rm -rf "$SKILLS_DIR/smart-flow"
    fi

    cp -r "$SMART_FLOW_DIR" "$SKILLS_DIR/smart-flow"

    echo "✅ Installed to: $SKILLS_DIR/smart-flow"

    echo ""
    echo "🎉 Installation complete!"
    echo ""
    echo "📖 Quick Start:"
    echo "   1. Restart OpenCode"
    echo "   2. Say: Use smart-flow"
fi

echo ""
echo "✨ Enjoy using Smart Flow!"
echo ""
echo "📮 Support: https://github.com/YOUR-USERNAME/smart-flow/issues"
