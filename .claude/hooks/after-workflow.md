# After-Workflow Hook

## 触发时机

在 Smart Workflow 完成后触发。

## 用途

清理资源、生成报告、更新文档。

## 配置

```json
{
  "lifecycleHooks": {
    "PostExec": {
      "enabled": true,
      "handler": ".claude/hooks/after-workflow.md"
    }
  }
}
```

## 实现

```markdown
---
name: after-workflow-hook
description: 工作流完成后的清理
---

# After-Workflow Hook 执行

## 1. 更新最终状态

```json
{
  "executionId": "EXEC-2026-01-12-001",
  "endTime": "2026-01-12T16:00:00Z",
  "status": "completed",
  "totalDuration": 3600000
}
```

## 2. 生成执行报告

创建 `smart-flow-execution-report.md`

## 3. 清理临时文件

删除 `.claude/temp/` 下的临时文件

## 4. 归档执行记录

移动到 `.claude/archive/` 目录

---

**版本**: v1.0.0
**更新**: 2026-01-12
