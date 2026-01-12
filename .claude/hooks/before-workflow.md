# Before-Workflow Hook

## 触发时机

在 Smart Workflow 开始执行前触发。

## 用途

初始化工作流状态、检查前置条件。

## 配置

```json
{
  "lifecycleHooks": {
    "PreExec": {
      "enabled": true,
      "handler": ".claude/hooks/before-workflow.md"
    }
  }
}
```

## 实现

```markdown
---
name: before-workflow-hook
description: 工作流开始前的初始化
---

# Before-Workflow Hook 执行

## 1. 初始化状态

创建执行状态文件：

```json
{
  "executionId": "EXEC-2026-01-12-001",
  "startTime": "2026-01-12T15:00:00Z",
  "status": "initialized",
  "stages": {
    "requirements": 0,
    "decomposition": 0,
    "execution": 0,
    "synthesis": 0
  }
}
```

## 2. 检查前置条件

- [ ] 项目目录存在
- [ ] 有写入权限
- [ ] Git 仓库可用（如需要）

## 3. 清理旧状态

删除过期的执行记录

---

**版本**: v1.0.0
**更新**: 2026-01-12
