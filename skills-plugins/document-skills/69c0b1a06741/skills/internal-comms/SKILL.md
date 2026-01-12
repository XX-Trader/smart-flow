---
name: internal-comms
displayName: "内部通信"
version: "1.0.0"
description: A set of resources to help me write all kinds of internal communications, using the formats that my company likes to use. Claude should use this skill whenever asked to write some sort of internal communications (status reports, leadership updates, 3P updates, company newsletters, FAQs, incident reports, project updates, etc.).

triggers:
  keywords:
    "internal"
    "comms"
  auto_trigger: false
  confidence_threshold: 0.6

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
    "internal"
    "comms"
  author: "Smart Flow Team"
  license: "Complete terms in LICENSE.txt"
  updated_at: "2026-01-12"

scope:
  level: "project"
  priority: 40

compatibility:
  claude_code_min_version: "2026.01.0"
  requires_restart: false
---

## When to use this skill
To write internal communications, use this skill for:
- 3P updates (Progress, Plans, Problems)
- Company newsletters
- FAQ responses
- Status reports
- Leadership updates
- Project updates
- Incident reports

## How to use this skill

To write any internal communication:

1. **Identify the communication type** from the request
2. **Load the appropriate guideline file** from the `examples/` directory:
    - `examples/3p-updates.md` - For Progress/Plans/Problems team updates
    - `examples/company-newsletter.md` - For company-wide newsletters
    - `examples/faq-answers.md` - For answering frequently asked questions
    - `examples/general-comms.md` - For anything else that doesn't explicitly match one of the above
3. **Follow the specific instructions** in that file for formatting, tone, and content gathering

If the communication type doesn't match any existing guideline, ask for clarification or more context about the desired format.

## Keywords
3P updates, company newsletter, company comms, weekly update, faqs, common questions, updates, internal comms
