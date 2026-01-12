# Post-Task Hook

## 触发时机

在任务（Task）完成后执行。

## 用途

清理临时资源、更新状态、记录日志。

## 配置

在 `.claude/settings.json` 中配置：

```json
{
  "lifecycleHooks": {
    "PostTask": {
      "enabled": true,
      "handler": ".claude/hooks/post-task.md"
    }
  }
}
```

## 实现示例

```markdown
---
name: post-task-hook
description: 任务完成后的处理流程
---

# Post-Task Hook 执行

## 1. 清理临时资源

- 删除临时文件
- 释放内存
- 关闭文件句柄

## 2. 更新状态

更新任务状态到执行记录：

```json
{
  "taskId": "task-xxx-1",
  "status": "completed",
  "endTime": "2026-01-12T15:30:00Z",
  "duration": 120000
}
```

## 3. 记录日志

记录任务执行日志到 `.claude/logs/tasks.log`

---

**版本**: v1.0.0
**更新**: 2026-01-12
