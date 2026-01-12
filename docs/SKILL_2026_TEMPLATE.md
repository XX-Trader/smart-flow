# SKILL.md 2026 规范模板

## 完整 YAML 元数据规范

```yaml
---
# ===== 基本信息 =====
name: skill-name
displayName: "技能显示名称（可选，中文）"
version: "1.0.0"
description: "Use when [具体触发场景描述]. More details here if needed."

# ===== 触发器配置 =====
triggers:
  keywords:
    - "关键词1"
    - "关键词2"
  patterns:
    - "正则表达式模式"
    - "自然语言描述"
  auto_trigger: true  # 是否自动触发
  confidence_threshold: 0.8  # 触发置信度阈值 (0-1)

# ===== 工具依赖 =====
tools:
  required:
    - Task
    - AskUserQuestion
  optional:
    - Bash
    - Read
    - Edit

# ===== 权限配置 =====
permissions:
  level: "full"  # read | write | execute | full
  scope:
    - "file:read"
    - "file:write"
    - "network:request"

# ===== 上下文配置 =====
context:
  mode: fork  # fork | inline | shared
  isolation: true  # 是否隔离子代理上下文
  max_context_tokens: 50000  # 最大上下文 token 数

# ===== 加载配置 =====
hot_reload: true  # 支持热重载
progressive_load: true  # 渐进式加载

# ===== 生命周期钩子 =====
hooks:
  pre_load: "scripts/pre_load.js"  # 加载前
  post_load: "scripts/post_load.js"  # 加载后
  pre_exec: "scripts/pre_exec.js"  # 执行前
  post_exec: "scripts/post_exec.js"  # 执行后
  on_error: "scripts/on_error.js"  # 错误时

# ===== 子代理配置 =====
subagent:
  max_concurrent: 5  # 最大并发子代理数
  timeout: 300000  # 超时时间（毫秒）
  retry_count: 3  # 重试次数
  result_format: "json"  # json | markdown | text

# ===== 元数据 =====
metadata:
  category: "workflow"  # 分类
  tags:
    - "自动化"
    - "工作流"
  author: "Smart Flow Team"
  license: "MIT"
  created_at: "2026-01-12"
  updated_at: "2026-01-12"

# ===== 作用域配置 =====
scope:
  level: "project"  # project | user | enterprise
  priority: 100  # 优先级（数字越大优先级越高）

# ===== 兼容性 =====
compatibility:
  claude_code_min_version: "2026.01.0"
  requires_restart: false  # 是否需要重启才能生效

# ===== 调试配置 =====
debug:
  enabled: false
  log_level: "info"  # debug | info | warn | error
  trace_execution: false  # 追踪执行路径
---
```

---

## 最小化模板（推荐）

```yaml
---
name: skill-name
description: "Use when [触发场景]"

triggers:
  keywords:
    - "关键词"
  auto_trigger: true

tools:
  required:
    - Task

permissions:
  level: "full"

context:
  mode: fork
  isolation: true

hot_reload: true
progressive_load: true

scope:
  level: "project"
---
```

---

## 字段说明

### 必需字段

| 字段 | 类型 | 说明 |
|------|------|------|
| `name` | string | 技能唯一标识符（英文，kebab-case） |
| `description` | string | 技能描述，用于触发判断 |

### 可选字段

#### triggers（触发器配置）
- `keywords`: 关键词列表
- `patterns`: 正则表达式或自然语言模式
- `auto_trigger`: 是否自动触发
- `confidence_threshold`: 触发置信度阈值（0-1）

#### tools（工具依赖）
- `required`: 必需工具列表
- `optional`: 可选工具列表

#### permissions（权限配置）
- `level`: 权限级别
  - `read`: 只读
  - `write`: 可写
  - `execute`: 可执行
  - `full`: 完全权限
- `scope`: 权限范围列表

#### context（上下文配置）
- `mode`: 上下文模式
  - `fork`: 派生子代理（独立沙盒）
  - `inline`: 内联执行
  - `shared`: 共享上下文
- `isolation`: 是否隔离
- `max_context_tokens`: 最大 token 数

#### hooks（生命周期钩子）
- `pre_load`: 加载前执行
- `post_load`: 加载后执行
- `pre_exec`: 执行前执行
- `post_exec`: 执行后执行
- `on_error`: 错误时执行

#### subagent（子代理配置）
- `max_concurrent`: 最大并发数
- `timeout`: 超时时间（毫秒）
- `retry_count`: 重试次数
- `result_format`: 结果格式

#### metadata（元数据）
- `category`: 分类
- `tags`: 标签列表
- `author`: 作者
- `license`: 许可证
- `created_at`: 创建时间
- `updated_at`: 更新时间

---

## 示例：升级 smart-workflow/SKILL.md

### 升级前（当前格式）
```yaml
---
name: smart-workflow
description: "Use when user wants to build a feature or start a new project. Automatically orchestrates requirements clarification, task decomposition, parallel agent execution, and result synthesis."
---
```

### 升级后（2026 规范）
```yaml
---
name: smart-workflow
displayName: "智能工作流"
version: "2.1.0"
description: "Use when user wants to build a feature or start a new project. Automatically orchestrates requirements clarification, task decomposition, parallel agent execution, and result synthesis."

triggers:
  keywords:
    - "新增"
    - "开发"
    - "实现"
    - "制作"
    - "创建"
    - "build"
    - "develop"
    - "implement"
    - "create"
  patterns:
    - "(帮我|做个|做一个).{0,50}(功能|模块)"
    - "(新增|开发|实现).{0,30}(功能|接口)"
  auto_trigger: true
  confidence_threshold: 0.7

tools:
  required:
    - Task
    - AskUserQuestion
    - TodoWrite
  optional:
    - Bash
    - Read
    - Write

permissions:
  level: "full"
  scope:
    - "file:read"
    - "file:write"
    - "agent:dispatch"

context:
  mode: fork
  isolation: true
  max_context_tokens: 100000

hot_reload: true
progressive_load: true

hooks:
  pre_exec: ".claude/hooks/before-workflow.md"
  post_exec: ".claude/hooks/after-workflow.md"

subagent:
  max_concurrent: 10
  timeout: 600000
  retry_count: 2
  result_format: "markdown"

metadata:
  category: "workflow"
  tags:
    - "自动化"
    - "并行执行"
    - "任务调度"
  author: "Smart Flow Team"
  license: "MIT"
  created_at: "2024-01-07"
  updated_at: "2026-01-12"

scope:
  level: "project"
  priority: 100

compatibility:
  claude_code_min_version: "2026.01.0"
  requires_restart: false

debug:
  enabled: false
  log_level: "info"
  trace_execution: false
---
```

---

## 迁移检查清单

升级 SKILL.md 文件时，确保：

- [ ] 添加 `version` 字段
- [ ] 添加 `triggers` 配置
- [ ] 添加 `tools` 依赖声明
- [ ] 添加 `permissions` 权限配置
- [ ] 添加 `context: fork` 配置（如需子代理）
- [ ] 添加 `hot_reload: true`
- [ ] 添加 `progressive_load: true`
- [ ] 添加 `metadata` 元数据
- [ ] 添加 `scope` 作用域配置
- [ ] 配置 `hooks`（如需生命周期钩子）

---

**版本**: v1.0.0
**创建日期**: 2026-01-12
**作者**: Smart Flow Team
**参考**: [Claude Code 2026 规范](https://claude.com/docs/2026/spec)
