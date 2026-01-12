# Pre-Compact Hook

## 触发时机

在 Claude Code 压缩上下文之前执行。

## 用途

保留关键状态信息，防止重要数据在上下文压缩时丢失。

## 配置

在 `.claude/settings.json` 中配置：

```json
{
  "lifecycleHooks": {
    "PreCompact": {
      "enabled": true,
      "handler": ".claude/hooks/pre-compact.md"
    }
  },
  "context": {
    "preserveOnCompact": [
      "user.requirements",
      "session.state",
      "task.results"
    ]
  }
}
```

## 实现示例

```markdown
---
name: pre-compact-hook
description: 在上下文压缩前保留关键状态
---

# Pre-Compact Hook 执行

## 检查当前状态

1. **检查是否有正在进行的 Smart Flow 执行**
   - 如果有，保存执行状态到 `.claude/state/execution.json`
   - 包含：当前阶段、已完成任务、待执行任务

2. **保存用户需求**
   - 保存到 `user.requirements` 上下文变量
   - 格式：JSON

3. **保存任务结果**
   - 保存到 `task.results` 上下文变量
   - 格式：JSON 数组

## 保留清单

在压缩前确保保留以下信息：

- [ ] 用户需求（完整 JSON）
- [ ] 执行状态（阶段、进度）
- [ ] 已完成任务结果
- [ ] 待执行任务列表
- [ ] 用户配置（Agent 选择、并行数）

## 恢复检查

压缩后，首先检查：
1. 是否有未完成的执行？
2. 是否需要恢复到某个检查点？
3. 是否询问用户"继续上次任务"？
```

## 状态保存示例

```json
{
  "execution": {
    "id": "EXEC-2026-01-12-001",
    "status": "in_progress",
    "currentStage": "parallel-execution",
    "progress": {
      "requirements": 100,
      "decomposition": 100,
      "execution": 45,
      "synthesis": 0
    },
    "completedTasks": [
      "product-manager",
      "ui-ux-designer",
      "database-architect"
    ],
    "pendingTasks": [
      "backend-architect",
      "frontend-developer"
    ],
    "checkpoint": "stage-3-batch-1"
  },
  "userRequirements": {
    "goal": "创建用户登录功能",
    "features": ["登录", "注册", "密码重置"],
    "techStack": ["React", "FastAPI"]
  },
  "results": {
    "product-manager": "docs/prd.md",
    "ui-ux-designer": "docs/ui-design.md",
    "database-architect": "docs/database-schema.sql"
  }
}
```

---

**版本**: v1.0.0
**更新**: 2026-01-12
