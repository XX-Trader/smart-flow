# On-Error Hook

## 触发时机

当发生错误或异常时执行。

## 用途

错误处理、日志记录、用户通知。

## 配置

在 `.claude/settings.json` 中配置：

```json
{
  "lifecycleHooks": {
    "OnError": {
      "enabled": true,
      "handler": ".claude/hooks/on-error.md"
    }
  }
}
```

## 实现示例

```markdown
---
name: on-error-hook
description: 错误处理流程
---

# On-Error Hook 执行

## 1. 记录错误

```json
{
  "error": {
    "message": "Database connection failed",
    "code": "DB_ERROR",
    "stack": "..."
  },
  "context": {
    "task": "backend-architect",
    "timestamp": "2026-01-12T15:30:00Z"
  }
}
```

## 2. 通知用户

使用 `AskUserQuestion` 询问用户处理方式：

```
⚠️ 发生错误

错误信息: Database connection failed

如何处理?
1. 重试
2. 跳过
3. 终止
```

## 3. 错误恢复

根据用户选择执行相应操作

---

**版本**: v1.0.0
**更新**: 2026-01-12
