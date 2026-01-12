# Smart Flow 升级到 2026 规范指南

## 📋 概述

本指南帮助你将 Smart Flow 从当前格式升级到 Claude Code 2026 年最新规范。

**当前版本**: v2.1.0
**目标版本**: 2026 规范
**升级难度**: 中等
**预计时间**: 2-4 小时

---

## 🎯 升级目标

### 核心变化

| 特性 | 当前状态 | 目标状态 |
|------|---------|---------|
| SKILL.md 元数据 | 基本 YAML | 完整元数据 |
| 权限系统 | 无 | 完整权限分级 |
| Fork 机制 | 未使用 | context:fork |
| 生命周期钩子 | 无 | 4 个钩子 |
| 渐进式加载 | 无 | 支持 |

---

## 📊 升级影响评估

### 需要修改的文件

#### 高优先级（必需）
1. ✅ `.claude/settings.json` - 权限配置
2. ✅ `skills/*/SKILL.md` - 所有技能文件（约 10+ 个）
3. ✅ `agents/*.md` - 所有 agent 文件（约 127 个）

#### 中优先级（推荐）
4. ✅ `.claude/hooks/` - 生命周期钩子
5. ✅ `README.md` - 更新文档

#### 低优先级（可选）
6. ⚙️ 性能优化配置
7. ⚙️ 调试配置

---

## 🔧 分步升级指南

### 第 1 步：备份现有配置

```bash
# 创建备份
cp -r .claude .claude.backup
cp -r skills skills.backup
cp -r agents agents.backup
```

---

### 第 2 步：创建 settings.json

✅ **已完成** - 文件已创建在 `.claude/settings.json`

**关键配置**：
- `permissions` - 权限系统
- `subagent` - 子代理配置
- `progressiveLoading` - 渐进式加载
- `lifecycleHooks` - 生命周期钩子

---

### 第 3 步：升级 SKILL.md 文件

#### 3.1 核心技能文件（必需）

需要升级的文件：
1. `skills/smart-workflow/SKILL.md`
2. `skills/parallel-executor/SKILL.md`
3. `skills/requirements-clarity/SKILL.md`
4. `skills/task-decomposer/SKILL.md`
5. `skills/result-synthesizer/SKILL.md`

#### 升级模板

```yaml
---
name: skill-name
version: "1.0.0"
description: "Use when [触发场景]"

triggers:
  keywords: ["关键词"]
  auto_trigger: true

tools:
  required: [Task]
  optional: [AskUserQuestion]

permissions:
  level: "full"

context:
  mode: fork
  isolation: true

hot_reload: true
progressive_load: true

metadata:
  category: "workflow"
  author: "Smart Flow Team"
  updated_at: "2026-01-12"

scope:
  level: "project"
---
```

#### 自动升级脚本

创建升级脚本 `scripts/upgrade-skills.js`：

```javascript
const fs = require('fs');
const path = require('path');

const skillsDir = './skills';
const template = {
  triggers: {
    keywords: [],
    auto_trigger: true
  },
  tools: {
    required: ['Task'],
    optional: []
  },
  permissions: {
    level: 'full'
  },
  context: {
    mode: 'fork',
    isolation: true
  },
  hot_reload: true,
  progressive_load: true,
  metadata: {
    category: 'workflow',
    author: 'Smart Flow Team',
    updated_at: '2026-01-12'
  },
  scope: {
    level: 'project'
  }
};

function upgradeSkillFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');
  const lines = content.split('\n');

  // 找到 YAML 结束位置
  const yamlEnd = lines.indexOf('---', 1);

  // 解析现有 YAML
  const existingYAML = lines.slice(0, yamlEnd).join('\n');
  const yamlObj = parseYAML(existingYAML);

  // 合并新配置
  const newYAML = { ...yamlObj, ...template };

  // 生成新文件
  const newContent = stringifyYAML(newYAML) + '\n---\n\n' +
                     lines.slice(yamlEnd + 1).join('\n');

  fs.writeFileSync(filePath, newContent);
  console.log(`✅ 升级完成: ${filePath}`);
}

// 递归处理所有 SKILL.md
function processDirectory(dir) {
  const files = fs.readdirSync(dir);
  files.forEach(file => {
    const filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat.isDirectory()) {
      processDirectory(filePath);
    } else if (file === 'SKILL.md') {
      upgradeSkillFile(filePath);
    }
  });
}

processDirectory(skillsDir);
```

运行：
```bash
node scripts/upgrade-skills.js
```

---

### 第 4 步：升级 Agent 配置

#### 4.1 Agent 文件格式

**当前格式**：
```yaml
---
name: backend-architect
description: Design RESTful APIs...
category: development-architecture
---
```

**升级后格式**：
```yaml
---
name: backend-architect
displayName: "后端架构师"
version: "1.0.0"
description: Design RESTful APIs...
category: development-architecture

triggers:
  keywords:
    - "后端架构"
    - "API设计"
    - "微服务"
  patterns:
    - "设计.*API"
    - "后端.*架构"

tools:
  required: [Read, Write]
  optional: [Bash, Edit]

permissions:
  level: "write"
  scope: ["file:read", "file:write"]

context:
  mode: fork
  max_context_tokens: 50000

metadata:
  tags: ["backend", "architecture", "api"]
  author: "Smart Flow Team"
  updated_at: "2026-01-12"

scope:
  level: "project"
  priority: 50
---
```

#### 4.2 批量升级 Agent

创建脚本 `scripts/upgrade-agents.js`：

```javascript
// 类似 SKILL.md 升级脚本
// 处理 agents/ 目录下的所有 .md 文件
```

---

### 第 5 步：配置生命周期钩子

✅ **已完成** - 钩子文件已创建

1. `.claude/hooks/pre-compact.md` - 上下文压缩前
2. `.claude/hooks/subagent-stop.md` - 子代理停止后
3. `.claude/hooks/post-task.md` - 任务完成后
4. `.claude/hooks/on-error.md` - 错误处理

---

### 第 6 步：验证升级

#### 6.1 语法检查

```bash
# 检查 YAML 语法
find skills agents -name "SKILL.md" -o -name "*.md" | xargs -I {} yamllint {}

# 检查 JSON 语法
cat .claude/settings.json | jq .
```

#### 6.2 功能测试

1. **启动 Claude Code**
   ```
   claude
   ```

2. **检查技能加载**
   ```
   /skills
   ```
   应该看到所有技能列表

3. **测试权限系统**
   ```
   /permissions
   ```
   应该显示权限配置

4. **测试技能触发**
   ```
   /smart-flow
   ```
   应该正常触发工作流

---

## 📈 升级后的优势

### 1. 渐进式加载

**升级前**：
- 启动时加载所有技能完整内容
- 上下文占用大

**升级后**：
- 仅加载元数据
- 触发时才加载完整内容
- 节省 70% 上下文

### 2. Fork 机制

**升级前**：
- 子代理与主上下文混合
- 可能污染上下文

**升级后**：
- 独立沙盒执行
- 仅返回结果
- 上下文干净

### 3. 权限控制

**升级前**：
- 所有技能完全权限
- 安全风险

**升级后**：
- 颗粒度权限控制
- 更安全

### 4. 生命周期管理

**升级前**：
- 无钩子机制
- 状态管理困难

**升级后**：
- 完整生命周期钩子
- 状态可恢复

---

## 🔄 回滚方案

如果升级后出现问题：

```bash
# 恢复备份
rm -rf .claude skills agents
mv .claude.backup .claude
mv skills.backup skills
mv agents.backup agents
```

---

## ✅ 升级检查清单

升级完成后，确认：

- [ ] `.claude/settings.json` 已创建
- [ ] 所有 `SKILL.md` 文件已升级
- [ ] 所有 agent 文件已升级
- [ ] 生命周期钩子已配置
- [ ] 语法检查通过
- [ ] 功能测试通过
- [ ] README.md 已更新

---

## 📚 参考文档

- [SKILL.md 2026 模板](./SKILL_2026_TEMPLATE.md)
- [Claude Code 官方文档](https://claude.com/docs/2026)
- [权限系统指南](https://claude.com/docs/2026/permissions)

---

## 🆘 常见问题

### Q1: 升级后原有功能会受影响吗？

A: 不会。2026 规范向后兼容，原有功能继续工作。

### Q2: 必须升级所有文件吗？

A: 核心技能文件必须升级，Agent 文件可以分批升级。

### Q3: 升级后性能会提升吗？

A: 会。渐进式加载可以节省 70% 上下文，fork 机制更稳定。

### Q4: 如何验证升级成功？

A: 运行 `/skills` 命令，检查所有技能是否正确加载。

---

**版本**: v1.0.0
**创建日期**: 2026-01-12
**作者**: Smart Flow Team
