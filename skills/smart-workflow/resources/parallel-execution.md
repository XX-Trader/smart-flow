# 并行执行详细说明

## 执行引擎

### 核心机制

```
┌─────────────────────────────────────────────┐
│  并行执行引擎 (parallel-executor)            │
├─────────────────────────────────────────────┤
│  1. 解析任务清单和依赖关系                   │
│  2. 识别可并行任务                           │
│  3. 同时启动多个 Agent                       │
│  4. 实时追踪执行进度                         │
│  5. 处理 Agent 输出和错误                    │
│  6. 完成后进入下一阶段                       │
└─────────────────────────────────────────────┘
```

### 进度追踪格式

```
⏳ Smart Flow 执行进度

✅ 阶段 1: 需求澄清 (100%)
✅ 阶段 2: 任务分解 (100%)
⏳ 阶段 3: 并行执行 (60%)
   ✅ 产品经理 (100%) - 5 分钟
   ✅ UI/UX 设计师 (100%) - 8 分钟
   ✅ 数据库架构师 (100%) - 6 分钟
   ⏳ 后端架构师 (50%) - 预计 3 分钟
   ⏳ 前端开发 (30%) - 预计 10 分钟
⏸ 阶段 4: 结果整合 (0%) - 等待中
```

## Agent 并行策略

### 最大并行数

- **默认**: 5 个 Agent 同时执行
- **可配置**: 通过 `maxParallel` 参数调整
- **智能调整**: 根据任务依赖自动调整

### 超时处理

- **默认超时**: 10 分钟 (600000ms)
- **可配置**: 通过 `timeout` 参数调整
- **超时处理**: 记录超时，继续其他任务

### 错误处理

```
Agent 失败处理流程:
1. 记录错误信息
2. 标记任务为失败
3. 继续执行其他任务
4. 最终报告中标注失败任务
5. 提供"重试失败任务"选项
```

## 支持的 Agents (122+)

### 核心开发 Agents

| Agent | 功能 | 输出 |
|-------|------|------|
| `product-manager` | 产品需求文档 | PRD.md |
| `ui-ux-designer` | UI/UX 设计稿 | UI-Design.md |
| `database-architect` | 数据库设计 | schema.sql |
| `backend-architect` | 后端架构设计 | architecture.md |
| `frontend-developer` | 前端实现 | component.tsx |
| `backend-developer` | 后端实现 | service.py |
| `test-automator` | 测试用例 | tests/ |
| `security-auditor` | 安全审查 | security-report.md |

### Showcase 精选 Agents (新增)

| Agent | 来源 | 功能 |
|-------|------|------|
| `plan-reviewer_showcase` | showcase | 计划审查 |
| `refactor-planner_showcase` | showcase | 重构计划 |
| `code-refactor-master_showcase` | showcase | 代码重构 |
| `auto-error-resolver_showcase` | showcase | 修复编译错误 |
| `frontend-error-fixer_showcase` | showcase | 前端错误修复 |

## 执行示例

### 示例 1: 简单功能开发

```
输入: "做一个用户登录功能"

并行执行:
阶段1:
  ✅ product-manager (3分钟) → PRD.md
  ✅ ui-ux-designer (5分钟) → UI-Design.md

阶段2:
  ✅ backend-architect (4分钟) → API.md
  ✅ database-architect (3分钟) → schema.sql
  ✅ frontend-developer (8分钟) → login.tsx

阶段3:
  ✅ test-automator (5分钟) → tests/
  ✅ security-auditor (3分钟) → security-report.md
```

### 示例 2: 复杂系统开发

```
输入: "做一个电商系统"

并行执行:
阶段1:
  ✅ product-manager (10分钟) → 完整PRD
  ✅ ui-ux-designer (15分钟) → 全套UI设计
  ✅ database-architect (8分钟) → 数据库设计
  ✅ backend-architect (12分钟) → 系统架构

阶段2:
  ✅ backend-developer (20分钟) → 所有API
  ✅ frontend-developer (25分钟) → 所有页面
  ✅ api-documenter (10分钟) → API文档

阶段3:
  ✅ test-automator (15分钟) → 测试用例
  ✅ security-auditor (10分钟) → 安全审查
  ✅ deployment-engineer (8分钟) → 部署配置
```

## 增量执行和断点续传

### 状态保存

```json
{
  "executionId": "EXEC-2025-01-10-001",
  "timestamp": "2025-01-10T12:00:00Z",
  "status": "in_progress",
  "completedStages": ["requirements", "decomposition"],
  "currentStage": "execution",
  "completedTasks": [
    "product-manager",
    "ui-ux-designer",
    "database-architect"
  ],
  "pendingTasks": [
    "backend-architect",
    "frontend-developer"
  ],
  "failedTasks": []
}
```

### 断点续传

```
用户: /smart-flow resume EXEC-2025-01-10-001

→ 从上次中断处继续执行:
  - 跳过已完成任务
  - 只执行待办任务
  - 整合所有输出
```

## 相关资源

- **主技能**: [../SKILL.md](../SKILL.md)
- **子技能**: [parallel-executor/SKILL.md](../../parallel-executor/SKILL.md)
