---
name: parallel-executor
description: "Use when tasks are decomposed and user confirmed configuration. Executes tasks in parallel stages with real-time progress tracking."
---

# Parallel Executor - 并行执行引擎

## 概述

**核心原则**: 同时启动多个专业 agent，最大化并行效率，实时显示进度

基于任务分解结果和用户确认的配置，智能调度多个 agent 并行工作，实时追踪进度，处理错误和重试。

---

## 📊 输入

来自 `task-decomposer` 的任务清单（JSON 格式）

**包含**:
- 任务列表和依赖关系
- 用户选择的 Agent 组合
- 用户配置的并行数量

---

## 🎯 进度跟踪集成

### 进度显示

**参考**: `utils/progress-tracker.md`

```markdown
## Smart Flow 工作流进度

Phase 1: 需求澄清     ████████████░░░░░░░░░░ 100% ✅
Phase 2: 任务分解     ████████████░░░░░░░░░░ 100% ✅
Phase 3: 并行执行     ████████░░░░░░░░░░░░░░  60% 🔄
Phase 4: 结果综合     ░░░░░░░░░░░░░░░░░░░░░░   0%
────────────────────────────────────────────
总进度: ███████████████░░░░░░░░  68%

🔄 Agent 执行中:
  ✅ product-manager (100%) - 12分钟
     ✅ 已生成 PRD 文档
  ✅ ui-ux-designer (100%) - 15分钟
     ✅ 已完成 UI 设计稿
  ✅ database-architect (100%) - 10分钟
     ✅ 已完成数据库 schema
  🔄 backend-architect (50%) - 预计8分钟
     🔄 正在设计 API...
  🔄 frontend-developer (30%) - 预计15分钟
     🔄 正在实现登录页面...
```

---

## 🚀 执行流程

### Step 1: 确认执行配置

显示用户确认界面：

```markdown
## Smart Flow 执行确认

### 配置摘要
- **Agent 数量**: 6个
- **并行数量**: 3个
- **执行阶段**: 2个
- **预计耗时**: 50分钟

### Agent 列表

批次 1 (3个并行):
  1. product-manager (产品经理) - 12分钟
  2. ui-ux-designer (UI/UX 设计师) - 15分钟
  3. database-architect (数据库架构师) - 10分钟

批次 2 (3个并行，依赖批次1):
  4. backend-architect (后端架构师) - 15分钟
  5. frontend-developer (前端开发) - 25分钟
  6. backend-developer (后端开发) - 20分钟

### 准备启动

确认开始执行?
  [1. 确认启动  2. 调整配置  3. 取消]
```

### Step 2: 启动并行执行

```python
for stage in execution_plan.stages:
    # 显示阶段开始
    display_stage_start(stage)

    # 获取该阶段的所有任务
    tasks = stage.tasks

    # 分批并行执行（根据用户配置的并行数）
    for batch in create_batches(tasks, parallel_count):
        # 并行启动该批次的所有 agent
        for task in batch:
            task_id = dispatch_agent(task)
            monitor_progress(task_id)

        # 等待该批次完成
        wait_for_batch_completion(batch)

        # 更新进度
        update_progress(stage, batch)
```

### Step 3: 实时进度更新

**每个 Agent 状态变化时立即更新**：

```python
def on_agent_progress(agent_id, progress_percent):
    # 更新该 Agent 的进度
    update_agent_progress(agent_id, progress_percent)

    # 更新阶段进度
    stage_progress = calculate_stage_progress()
    update_stage_progress(stage_progress)

    # 更新总进度
    total_progress = calculate_total_progress()
    update_total_progress(total_progress)

    # 显示进度
    display_progress()
```

---

## 📋 执行策略

### 并行阶段执行

```python
# 伪代码
for stage in execution_plan.stages:
    if stage.can_run_in_parallel:
        # 根据用户配置的并行数分批
        batch_size = user_config.parallel_count

        for batch in split_into_batches(stage.tasks, batch_size):
            # 同时启动该批次的所有任务
            for task in batch:
                task_id = dispatch_agent(task, run_in_background=True)

            # 等待该批次所有任务完成
            wait_for_all_tasks(task_id)

            # 检查是否有失败
            if any_failed(batch):
                handle_failures(batch)

            # 更新进度
            update_stage_progress(stage.name, 100%)
    else:
        # 串行执行
        for task in stage.tasks:
            dispatch_agent(task)
            wait_for_completion()
            update_progress(task.name, 100%)
```

### 任务调度算法

```
1. 识别当前可执行的任务（无依赖或依赖已完成）
2. 根据用户配置的并行数分批
3. 同时启动每批的所有任务（使用 Task tool 的 run_in_background 参数）
4. 实时监控每个任务的状态
5. 任务完成后，检查是否有新任务可执行
6. 重复直到所有任务完成
```

---

## 🔧 Agent 调用方式

### 使用 Task Tool

```typescript
// 并行启动多个 agent（后台运行）
Task({
  subagent_type: "product-manager",
  prompt: "根据以下需求编写产品需求文档...",
  description: "编写 PRD",
  run_in_background: true  // 关键：后台运行
})

Task({
  subagent_type: "ui-ux-designer",
  prompt: "根据以下需求设计 UI 界面...",
  description: "UI 设计",
  run_in_background: true  // 关键：后台运行
})

Task({
  subagent_type: "database-architect",
  prompt: "根据以下需求设计数据库架构...",
  description: "数据库设计",
  run_in_background: true  // 关键：后台运行
})

// 等待所有后台任务完成
waitForAllBackgroundTasks()
```

### 获取 Agent 输出

```typescript
// 获取后台任务结果
const result1 = await TaskOutput({
  task_id: "task-xxx-1",
  block: true,
  timeout: 300000  // 5 分钟超时
})

const result2 = await TaskOutput({
  task_id: "task-xxx-2",
  block: true,
  timeout: 300000
})

const result3 = await TaskOutput({
  task_id: "task-xxx-3",
  block: true,
  timeout: 300000
})
```

---

## ⚠️ 错误处理

### Agent 失败处理

```python
if agent_failed(task):
    # 记录错误
    log_error(task.error)

    # 使用 AskUserQuestion 询问用户
    user_choice = ask_user(
        f"⚠️ Agent {task.agent} 执行失败\n\n"
        f"错误: {task.error}\n\n"
        "如何处理?",
        options=[
            "重试该任务",
            "跳过该任务，继续其他任务",
            "终止整个流程"
        ]
    )

    if user_choice == "重试该任务":
        retry_task(task)
    elif user_choice == "跳过该任务":
        mark_task_skipped(task)
        warn_dependent_tasks(task)
    else:  # 终止
        terminate_execution()
```

### 部分失败继续执行

```
⚠️ Agent backend-architect 执行失败

错误: 无法连接到数据库

如何处理?
1. 重试该任务
2. 跳过该任务，继续其他任务
3. 终止整个流程

用户选择: 2

✅ 已跳过 backend-architect
⚠️ 注意: 依赖该任务的任务 (backend-developer) 可能无法正常执行
⏳ 继续执行其他任务...
```

---

## 💾 断点续传

### 保存执行状态

```json
{
  "checkpoint": "parallel_executor_stage_2_batch_1",
  "can_resume": true,
  "resume_command": "/smart-flow resume EXEC-2025-01-07-001",

  "progress": {
    "phase1": 100,
    "phase2": 40,
    "phase3": 0,
    "phase4": 0,
    "total": 68
  }
}
```

### 恢复执行

```
用户: /smart-flow resume

Smart Flow: 检测到未完成的执行:

执行 ID: EXEC-2025-01-07-001
开始时间: 2025-01-07 14:30
状态: 阶段 3 批次 1 (40%)
已完成: 3/6 任务
剩余任务: 3 个

是否继续?
[1. 继续 2. 重新开始 3. 查看详情]

用户: 1

✅ 继续执行...
```

---

## ⚙️ 性能优化

### 并发控制

```python
# 用户配置的并行数
MAX_CONCURRENT_AGENTS = user_config.parallel_count

running_tasks = []
for task in pending_tasks:
    if len(running_tasks) < MAX_CONCURRENT_AGENTS:
        task_id = dispatch_agent(task, run_in_background=True)
        running_tasks.append(task_id)
    else:
        wait_for_any_completion(running_tasks)
        remove_completed(running_tasks)
```

### 资源管理

- **内存限制**: 监控内存使用，必要时暂停新任务
- **Token 管理**: 预估每个任务的 token 消耗
- **超时控制**: 设置每个任务的最大执行时间（默认30分钟）

---

## ✅ 完成检查

### 所有任务完成

```markdown
✅ 所有任务已完成!

### 执行摘要

- **总任务数**: 6
- **成功**: 6
- **失败**: 0
- **跳过**: 0
- **总耗时**: 47分钟

### 任务详情

✅ product-manager - 12分钟
   📄 输出: docs/prd.md

✅ ui-ux-designer - 15分钟
   📄 输出: docs/ui-design.md

✅ database-architect - 10分钟
   📄 输出: docs/database-schema.sql

✅ backend-architect - 14分钟
   📄 输出: docs/api-design.md

✅ frontend-developer - 26分钟
   📄 输出: src/frontend/

✅ backend-developer - 20分钟
   📄 输出: src/backend/

### 进度更新

Phase 3: 并行执行  ████████████░░░░░░░░░░ 100% ✅

下一步: 生成综合报告...
```

---

## ✅ 验证检查清单

并行执行完成后：
- [ ] 所有任务都已执行（成功/跳过）
- [ ] 收集所有 agent 的输出
- [ ] 生成执行摘要
- [ ] 更新进度：Phase 3 完成 (100%)
- [ ] 保存执行历史
- [ ] 进入下一阶段：结果整合

---

## 🔄 后续步骤

并行执行完成后：
1. 收集所有 agent 输出
2. 生成执行摘要
3. 更新进度：Phase 3 完成 (100%)
4. 进入下一阶段：结果整合 (`smart-flow:result-synthesizer`)

---

**前置技能**: `smart-flow:task-decomposer`
**后续技能**: `smart-flow:result-synthesizer`
**参考工具**: `utils/progress-tracker.md`
**版本**: v2.1.0
