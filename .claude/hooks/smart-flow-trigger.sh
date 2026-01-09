#!/bin/bash
# Smart Flow Auto-Trigger Hook (Shell Wrapper)
# This script wraps the TypeScript hook for execution

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOOK_SCRIPT="$SCRIPT_DIR/smart-flow-trigger.ts"

# Check if Node.js is available
if command -v npx &> /dev/null; then
    npx tsx "$HOOK_SCRIPT"
elif command -v node &> /dev/null; then
    # If tsx is not available, try using node directly
    node --loader ts-node/esm "$HOOK_SCRIPT" 2>/dev/null || node "$HOOK_SCRIPT"
else
    # Silently fail if Node.js is not available
    exit 0
fi
