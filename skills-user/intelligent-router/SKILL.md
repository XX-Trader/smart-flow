---
name: intelligent-router
displayName: "智能路由"
version: "1.0.0"
description: Plugin skill for intelligent-router

triggers:
  keywords:
    - "intelligent-router"
    - "智能路由"
    - "路由分发"
    - "Agent路由"

  auto_trigger: false
  confidence_threshold: 0.7

tools:
  required:
    - Read
    - Write
  optional:
    - Bash
    - Edit

permissions:
  level: "write"
  scope:
    - "file:read"
    - "file:write"

context:
  mode: inline
  isolation: false
  max_context_tokens: 50000

hot_reload: true
progressive_load: true

metadata:
  category: "plugin"
  tags:
    "intelligent"
    "router"
  author: "Smart Flow Team"
  license: "MIT"
  updated_at: "2026-01-12"

scope:
  level: "project"
  priority: 40

compatibility:
  claude_code_min_version: "2026.01.0"
  requires_restart: false
---

**维护者**: superma
**许可证**: MIT
**仓库**: 本地技能库
