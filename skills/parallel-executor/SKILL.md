---
name: parallel-executor
description: "Use when tasks are decomposed and ready. Executes tasks in parallel stages, dispatching multiple agents concurrently while respecting dependencies."
---

# Parallel Executor - 并行执行引擎

## 概述

**核心原则**: 同时启动多个专业 agent，最大化并行效率

基于任务分解结果，智能调度多个 agent 并行工作，实时追踪进度，处理错误和重试。

## 输入

来自 `task-decomposer` 的任务清单（JSON 格式）

## 执行策略

### 并行阶段执行

```python
for stage in execution_plan.stages:
    if stage.can_run_in_parallel:
        # 同时启动该阶段的所有任务
        dispatch_all_tasks_in_parallel(stage.tasks)
        wait_for_all_to_complete()
    else:
        # 串行执行
        for task in stage.tasks:
            dispatch_task(task)
            wait_for_completion()
```

### 任务调度算法

```
1. 识别当前可执行的任务（无依赖或依赖已完成）
2. 同时启动所有可执行任务
3. 实时监控每个任务的状态
4. 任务完成后，检查是否有新任务可执行
5. 重复直到所有任务完成
```

## 进度追踪

### 实时状态显示

```
⏳ Smart Flow 执行进度

✅ 阶段 1: 需求澄清 (100%)
✅ 阶段 2: 任务分解 (100%)
⏳ 阶段 3: 并行执行 (40%)

   并行批次 1:
   ✅ product-manager (100%) - 12 分钟
      ✅ 已生成 PRD 文档
   ✅ ui-ux-designer (100%) - 18 分钟
      ✅ 已完成 UI 设计稿
   ✅ database-architect (100%) - 14 分钟
      ✅ 已完成数据库 schema

   并行批次 2 (等待批次 1):
   ⏳ backend-architect (50%) - 预计 8 分钟
      ⏳ 正在设计 API...
   ⏳ frontend-developer (30%) - 预计 15 分钟
      ⏳ 正在实现登录页面...

⏸ 阶段 4: 结果整合 (0%) - 等待中
```

### 状态文件保存

```json
{
  "execution_id": "EXEC-2025-01-07-001",
  "timestamp": "2025-01-07T14:50:22Z",
  "status": "in_progress",
  "current_stage": "parallel_executor",

  "progress": {
    "total_stages": 4,
    "completed_stages": 2,
    "current_stage_progress": "40%"
  },

  "tasks": {
    "completed": [
      {
        "id": 1,
        "agent": "product-manager",
        "duration": "12 minutes",
        "output": "docs/prd.md"
      },
      {
        "id": 2,
        "agent": "ui-ux-designer",
        "duration": "18 minutes",
        "output": "docs/ui-design.md"
      },
      {
        "id": 3,
        "agent": "database-architect",
        "duration": "14 minutes",
        "output": "docs/database-schema.sql"
      }
    ],
    "in_progress": [
      {
        "id": 4,
        "agent": "backend-architect",
        "progress": "50%",
        "started_at": "2025-01-07T14:50:00Z"
      },
      {
        "id": 5,
        "agent": "frontend-developer",
        "progress": "30%",
        "started_at": "2025-01-07T14:50:00Z"
      }
    ],
    "pending": [
      {
        "id": 6,
        "agent": "backend-developer",
        "blocked_by": [4]
      },
      {
        "id": 7,
        "agent": "test-automator",
        "blocked_by": [5, 6]
      }
    ]
  },

  "errors": [],

  "started_at": "2025-01-07T14:30:00Z",
  "estimated_completion": "2025-01-07T15:20:00Z"
}
```

## Agent 调用方式

### 使用 Task Tool

```typescript
// 并行启动多个 agent
Task({
  subagent_type: "product-manager",
  prompt: "根据以下需求编写产品需求文档...",
  description: "编写 PRD",
  run_in_background: true  // 后台运行
})

Task({
  subagent_type: "ui-ux-designer",
  prompt: "根据以下需求设计 UI 界面...",
  description: "UI 设计",
  run_in_background: true  // 后台运行
})

Task({
  subagent_type: "database-architect",
  prompt: "根据以下需求设计数据库架构...",
  description: "数据库设计",
  run_in_background: true  // 后台运行
})

// 等待所有任务完成
waitForAllBackgroundTasks()
```

### 获取 Agent 输出

```typescript
// 获取后台任务结果
const results = await TaskOutput({
  task_id: "task-xxx",
  block: true,
  timeout: 300000  // 5 分钟超时
})
```

## 错误处理

### Agent 失败处理

```python
if agent_failed(task):
    # 记录错误
    log_error(task.error)

    # 询问用户是否重试
    user_choice = ask_user(
        f"Agent {task.agent} 执行失败: {task.error}\n"
        "是否重试? (1. 重试 2. 跳过 3. 终止)"
    )

    if user_choice == "重试":
        retry_task(task)
    elif user_choice == "跳过":
        mark_task_skipped(task)
        continue_with_dependent_tasks()
    else:  # 终止
        terminate_execution()
```

### 部分失败继续执行

```
⚠️ Agent backend-architect 执行失败

错误: 无法连接到数据库

选项:
1. 重试该任务
2. 跳过该任务，继续其他任务
3. 终止整个流程

用户选择: 2

✅ 已跳过 backend-architect
⚠️ 注意: 依赖该任务的任务 (backend-developer) 可能无法正常执行
⏳ 继续执行其他任务...
```

## 断点续传

### 保存执行状态

```json
{
  "checkpoint": "parallel_executor_stage_2",
  "can_resume": true,
  "resume_command": "/smart-flow resume EXEC-2025-01-07-001"
}
```

### 恢复执行

```
用户: /smart-flow resume

Smart Flow: 检测到未完成的执行:

执行 ID: EXEC-2025-01-07-001
开始时间: 2025-01-07 14:30
状态: 阶段 3 (40%)
已完成: 3/8 任务
剩余任务: 5 个

是否继续?
[1. 继续 2. 重新开始 3. 查看详情]

用户: 1

✅ 继续执行...
```

## 性能优化

### 并发控制

```python
# 限制同时运行的 agent 数量
MAX_CONCURRENT_AGENTS = 5

running_tasks = []
for task in pending_tasks:
    if len(running_tasks) < MAX_CONCURRENT_AGENTS:
        task_id = dispatch_agent(task)
        running_tasks.append(task_id)
    else:
        wait_for_any_completion(running_tasks)
        remove_completed(running_tasks)
```

### 资源管理

- **内存限制**: 监控内存使用，必要时暂停新任务
- **Token 管理**: 预估每个任务的 token 消耗
- **超时控制**: 设置每个任务的最大执行时间

## 完成检查

### 所有任务完成

```
✅ 所有任务已完成!

执行摘要:
- 总任务数: 8
- 成功: 7
- 失败: 0
- 跳过: 1
- 总耗时: 45 分钟

任务详情:
✅ product-manager - 12 分钟
✅ ui-ux-designer - 18 分钟
✅ database-architect - 14 分钟
⚠️ backend-architect - 跳过 (用户取消)
✅ frontend-developer - 22 分钟
✅ backend-developer - 25 分钟
✅ test-automator - 15 分钟
✅ security-auditor - 12 分钟

下一步: 生成完整报告...
```

## 验证检查清单

并行执行完成后：
- [ ] 所有任务都已执行（成功/跳过）
- [ ] 收集所有 agent 的输出
- [ ] 生成执行摘要
- [ ] 保存执行历史

## 后续步骤

并行执行完成后：
1. 收集所有 agent 输出
2. 生成执行摘要
3. 进入下一阶段：结果整合 (`smart-flow:result-synthesizer`)

---

**前置技能**: `smart-flow:task-decomposer`
**后续技能**: `smart-flow:result-synthesizer`
**版本**: v1.0.0
