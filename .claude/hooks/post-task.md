# Post-Task Hook

## 触发时机

在任务（Task）完成后执行。

## 用途

清理临时资源、更新状态、记录日志、**自动检查文档同步**。

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

---

## 执行流程

### 步骤 1: 获取变更文件

```bash
# 获取最近修改的文件
git diff --name-only HEAD
```

### 步骤 2: 判断是否需要文档检查

检查变更的文件是否包含：
- API 接口文件（`*views*`, `*controller*`, `*route*`, `*handler*`）
- 数据库模型文件（`*model*`, `*schema*`, `*entity*`）
- 前端 API 调用文件（`src/api/`, `api/`）
- **文档文件（`docs/*`, `*.md`, `README*`, `API.md`, `schema.md`）**

**如果不是接口、模型或文档文件，跳过文档检查。**

> **注意**：如果修改了文档文件，会反向检查文档内容是否与当前代码一致。

### 步骤 3: 执行文档同步检查

如果需要检查，调用 `doc-sync-checker` 技能：

1. 分析变更的文件类型
2. 提取 API 接口变更
3. 提取数据库字段变更
4. 扫描 `docs/` 文件夹
5. 生成同步报告

### 步骤 4: 清理临时资源

- 删除临时文件
- 释放内存
- 关闭文件句柄

### 步骤 5: 更新状态

更新任务状态到执行记录：

```json
{
  "taskId": "task-xxx-1",
  "status": "completed",
  "endTime": "2026-01-12T15:30:00Z",
  "duration": 120000,
  "docSyncChecked": true
}
```

### 步骤 6: 记录日志

记录任务执行日志到 `.claude/logs/tasks.log`

---

## 示例输出

### 场景 1: 修改了 API 接口

```
✅ 任务完成

📄 文档同步检查报告

检测到 API 接口变更：
- POST /api/users/create (新增)

文档状态：⚠️ 需要更新
建议操作：更新 docs/api/user-api.md

是否需要我帮你生成文档模板？
```

### 场景 2: 修改了数据库模型

```
✅ 任务完成

📄 文档同步检查报告

检测到数据库字段变更：
- users.phone (新增)

文档状态：⚠️ 需要更新
建议操作：更新 docs/database/user-schema.md
```

### 场景 3: 修改了文档文件

```
✅ 任务完成

📄 文档同步检查报告

检测到文档文件变更：
- docs/api/user-api.md

正在反向检查文档与代码的一致性...
⚠️ 发现不一致：
  文档中记录了 5 个接口，代码中实际有 6 个接口
  缺少接口: DELETE /api/users/:id

建议操作：
- [ ] 更新 docs/api/user-api.md 添加缺失接口
- [ ] 或确认该接口是否已废弃
```

### 场景 4: 无需检查

```
✅ 任务完成

修改的文件不涉及接口、数据库或文档，跳过文档检查。
```

---

## 实现代码

---

**版本**: v2.0.0
**更新**: 2026-01-21
**变更**: 新增文档同步检查功能
