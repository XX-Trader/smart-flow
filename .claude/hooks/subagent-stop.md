# Subagent-Stop Hook

## 触发时机

在子代理（Subagent）停止执行后触发。

## 用途

处理子代理返回结果，清理临时资源，更新执行状态。

## 配置

在 `.claude/settings.json` 中配置：

```json
{
  "lifecycleHooks": {
    "SubagentStop": {
      "enabled": true,
      "handler": ".claude/hooks/subagent-stop.md"
    }
  }
}
```

## 执行流程

```markdown
---
name: subagent-stop-hook
description: 子代理停止后的处理流程
---

# Subagent Stop Hook 执行

## 1. 接收结果

从子代理接收执行结果：

```json
{
  "agentId": "product-manager",
  "taskId": "task-xxx-1",
  "status": "success",
  "result": {
    "output": "docs/prd.md",
    "metadata": {
      "duration": 72000,
      "tokensUsed": 5000
    }
  },
  "error": null
}
```

## 2. 验证结果

### 成功情况
- [ ] 确认输出文件存在
- [ ] 验证输出格式正确
- [ ] 更新任务状态为"已完成"
- [ ] 记录执行时间

### 失败情况
- [ ] 记录错误信息
- [ ] 标记任务为"失败"
- [ ] 决定是否重试
- [ ] 通知用户（如果需要）

## 3. 更新执行状态

更新 `.claude/state/execution.json`：

```json
{
  "completedTasks": [
    "product-manager",
    "ui-ux-designer",
    "database-architect"
  ],
  "taskResults": {
    "product-manager": {
      "status": "completed",
      "output": "docs/prd.md",
      "duration": 72000
    }
  }
}
```

## 4. 检查依赖

### 确认是否有任务等待此结果

```python
def check_dependencies(completed_task):
    """检查是否有任务依赖已完成的任务"""
    waiting_tasks = []
    for task in pending_tasks:
        if completed_task in task.dependencies:
            waiting_tasks.append(task)
    return waiting_tasks
```

## 5. 触发下一批任务

如果有等待的任务可以开始执行：

```markdown
✅ product-manager 已完成
🔄 检查依赖任务...

可以启动的新任务：
  - ui-ux-designer (依赖: product-manager) ✓
  - database-architect (依赖: product-manager) ✓

🚀 启动下一批任务...
```

## 6. 清理资源

- [ ] 清理临时文件
- [ ] 释放内存
- [ ] 关闭打开的文件句柄

## 7. 进度更新

更新整体进度显示：

```markdown
## Smart Flow 执行状态

✅ 阶段 1: 需求澄清 - 完成
✅ 阶段 2: 任务分解 - 完成
🔄 阶段 3: 并行执行 - 50%
   ✅ product-manager (72秒)
   ✅ ui-ux-designer (85秒)
   ✅ database-architect (68秒)
   🔄 backend-architect (进行中...)
   ⏳ frontend-developer (等待中...)
```

---

## 错误处理

### 子代理失败

```json
{
  "agentId": "backend-architect",
  "taskId": "task-xxx-4",
  "status": "failed",
  "result": null,
  "error": {
    "message": "Database connection timeout",
    "code": "DB_TIMEOUT",
    "retryable": true
  }
}
```

### 处理策略

1. **记录错误**
   ```json
   {
     "failedTasks": [
       {
         "agent": "backend-architect",
         "error": "Database connection timeout",
         "retryCount": 1
       }
     ]
   }
   ```

2. **询问用户**
   ```
   ⚠️ backend-architect 执行失败
   错误: Database connection timeout

   如何处理?
   1. 重试 (1/3)
   2. 跳过此任务
   3. 终止整个流程
   ```

3. **执行用户选择**
   - 重试：重新启动子代理
   - 跳过：标记为跳过，继续其他任务
   - 终止：停止整个流程

---

**版本**: v1.0.0
**更新**: 2026-01-12
