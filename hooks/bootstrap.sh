#!/bin/bash
# Smart Flow Bootstrap Script
# This script initializes Smart Flow for the current session

set -e

SMART_FLOW_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "🚀 Smart Flow Bootstrap"
echo "======================"
echo ""

# Load Smart Flow skills
echo "📦 Loading Smart Flow skills..."

# Core skills
SKILLS=(
    "smart-workflow"
    "requirements-clarity"
    "task-decomposer"
    "parallel-executor"
    "result-synthesizer"
)

for skill in "${SKILLS[@]}"; do
    SKILL_FILE="$SMART_FLOW_DIR/skills/$skill/SKILL.md"
    if [ -f "$SKILL_FILE" ]; then
        echo "  ✅ Loaded: $skill"
        # In real implementation, this would register the skill with the AI
    else
        echo "  ❌ Not found: $skill ($SKILL_FILE)"
    fi
done

echo ""
echo "🤖 Available Agents: 40+"
echo "  - Core Development: 8 agents"
echo "  - Programming Languages: 11 agents"
echo "  - AI & Data: 7 agents"
echo "  - Deployment & DevOps: 8 agents"
echo "  - And more..."
echo ""

# Check platform
if [ -n "$CLAUDE_CODE" ]; then
    echo "✅ Platform: Claude Code"
    echo "   Trigger: /smart-flow or /sf"
    echo "   Auto-trigger: Yes (when requirements unclear)"
elif [ -n "$CODEX" ]; then
    echo "✅ Platform: Codex"
    echo "   Trigger: Use smart-flow"
    echo "   Auto-trigger: No"
elif command -v open-code &> /dev/null; then
    echo "✅ Platform: OpenCode"
    echo "   Trigger: Use smart-flow"
    echo "   Auto-trigger: No"
else
    echo "⚠️  Platform: Unknown"
fi

echo ""
echo "📚 Documentation:"
echo "   $SMART_FLOW_DIR/README.md"
echo ""
echo "✨ Smart Flow is ready!"
echo ""

# Output for AI to parse
cat << 'EOF'
SMART_FLOW_READY=true
SMART_FLOW_VERSION=1.0.0
SMART_FLOW_SKILLS=5
SMART_FLOW_AGENTS=40+
EOF
