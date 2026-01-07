# Smart Flow v2.0 测试指南

> **版本**: v2.0.1
> **测试时间**: 2025-01-07
> **测试目标**: 验证所有功能正常工作
> **最新修复**: 需求澄清技能现已强制使用 AskUserQuestion 工具

---

## 🔄 最新更新 (v2.0.1)

### ✅ 已修复问题
**问题**: 需求澄清技能没有自动调用 `AskUserQuestion` 工具
- **影响**: 用户需要手动输入答案，而不是选择选项
- **修复**: 三个核心技能文件已更新，强制使用 `AskUserQuestion` 工具
  - `skills/requirements-clarity/SKILL.md`
  - `skills/smart-workflow/SKILL.md`
  - `skills-user/requirements-clarity/skills/SKILL.md`
- **效果**: 现在所有需求澄清都会自动弹出选项界面

**测试建议**: 优先测试"测试 1.2 - 需求澄清工具调用"，验证修复效果

---

## 🚀 前置准备

### 1. 确认插件已加载

首先，确认 Smart Flow v2.0.1 已经正确加载：

**方法 1: 使用斜杠命令**
```
/help
```
在输出中查找：
- `smart-flow` 或 `/sf` 命令
- 相关的斜杠命令（`/commit`, `/深度思考` 等）

**方法 2: 查看插件列表**
```
/plugin list
```

应该看到：
```
smart-flow@smart-flow-marketplace v2.0.1
```

### 2. 重启 Claude Code（如果需要）

如果插件没有正确加载，请：
1. 完全退出 Claude Code
2. 重新打开 Claude Code
3. 等待插件加载完成

### 3. 强制更新插件（如果测试失败）

```bash
# 1. 卸载旧版本
/plugin uninstall smart-flow@smart-flow-marketplace

# 2. 重新安装
/plugin install smart-flow@smart-flow-marketplace

# 3. 重启 Claude Code
```

---

## 📋 测试计划

### 阶段 1: 基础功能测试

#### 测试 1.1: 查看帮助信息

**命令**:
```
/smart-flow help
```

**预期结果**:
- 显示 Smart Flow 的使用说明
- 列出主要功能
- 显示如何触发工作流

**✅ 通过标准**: 看到帮助信息

---

#### 测试 1.2: 需求澄清工具调用 ⭐ **(最重要！)**

**测试命令**:
```
我想开发一个博客系统
```

**预期行为**:
- Claude 自动识别为需求不明确的任务
- **自动弹出 `AskUserQuestion` 界面**（这是核心！）
- 显示 2-4 个选择题，例如：
  - Q1: 这是个人博客还是多人博客平台？
    - A. 个人博客（单人写作）
    - B. 多人博客（团队协作）
    - C. 博客平台（开放注册）
  - Q2: 需要哪些核心功能？（多选）
    - [ ] 文章发布与编辑
    - [ ] 评论系统
    - [ ] 用户注册/登录
    - [ ] 文章分类/标签
  - Q3: 使用什么技术栈？
    - A. Django + Vue3
    - B. FastAPI + Vue3
    - C. 其他
  - Q4: 数据存储方案？
    - A. 本地 JSON 文件（推荐 MVP）
    - B. MySQL/PostgreSQL
    - C. SQLite

**✅ 通过标准**:
- **必须看到选项界面**，而不是手动提问
- 可以通过点击选项回答
- 回答后系统生成需求摘要

**❌ 失败标志**:
- 只是文字提问，没有弹出选项界面
- 需要手动输入答案
- 说明插件缓存未更新，需要强制更新（见上方"强制更新插件"）

**重要提示**: 这是最关键的测试！如果这个测试失败，说明修复没有生效。

---

#### 测试 1.3: 完整 Smart Flow 工作流

**测试命令**:
```
/smart-flow

我想开发一个用户登录功能
```

**预期流程**:
```
[阶段 1: 需求澄清]
⚠️ 应该弹出 AskUserQuestion 界面！

Q: 登录功能的使用场景？
   A. 网站用户登录
   B. 管理后台登录
   C. 两者都需要

Q: 登录方式？
   [ ] 邮箱+密码
   [ ] 手机号+密码
   [ ] 第三方登录（微信/GitHub）

... 根据你的选择继续提问

[阶段 2: 任务分解]
已识别以下任务：
✅ product-manager（PRD 文档）
✅ ui-ux-designer（界面设计）
✅ backend-architect（API 设计）
✅ security-auditor（安全审查）

[阶段 3: 并行执行]
⏳ 正在同时执行 4 个 agent...

[阶段 4: 结果整合]
✅ 完整报告已生成
```

**✅ 通过标准**:
- **阶段 1 必须弹出 AskUserQuestion 界面**
- 完整执行 4 个阶段
- 成功调用多个 Agent
- 生成完整报告

---

### 阶段 2: Agent 调用测试

#### 测试 2.1: 调用单个 Agent

**测试命令**:
```
使用 python-expert agent 帮我优化这段 Python 代码的性能

def calculate_sum(n):
    result = 0
    for i in range(n):
        for j in range(n):
            result += i * j
    return result
```

**预期结果**:
- 调用 `python-expert` agent
- 提供性能优化建议
- 给出优化后的代码

**✅ 通过标准**: 收到 Python 性能优化建议

---

#### 测试 2.2: 调用代码审查 Agent

**测试命令**:
```
使用 code-reviewer agent 审查以下代码

def add(a, b):
    return a + b

result = add(1, 2)
print(result)
```

**预期结果**:
- 调用 `code-reviewer` agent
- 提供代码审查意见
- 指出潜在问题

**✅ 通过标准**: 收到代码审查反馈

---

### 阶段 3: 技能使用测试

#### 测试 3.1: 使用 feature-development 技能

**测试命令**:
```
使用 feature-development 技能，帮我开发一个用户管理功能

需求：
- 用户列表展示（分页）
- 用户新增/编辑/删除
- 用户状态管理（启用/禁用）
- 使用 Django + Vue + Ant Design Vue
```

**预期行为**:
1. 识别为中等复杂度功能
2. **可能弹出 AskUserQuestion 补充细节**
3. 生成技术方案
4. 生成数据库设计
5. 生成 API 设计
6. 生成 UI 原型
7. 等待确认

**✅ 通过标准**:
- 生成了结构化文档
- 包含需求、技术方案、数据库、API、UI 设计
- **如果需要澄清，应该使用 AskUserQuestion 工具**

---

#### 测试 3.2: 使用 auto-fix 技能

**测试命令**:
```
使用 auto-fix 技能修复测试失败
```

**预期行为**:
- 自动运行测试
- 分析失败原因
- 尝试修复
- 循环直到测试通过

**✅ 通过标准**:
- 看到自动修复流程
- 测试最终通过（如果有测试的话）

---

### 阶段 4: 斜杠命令测试

#### 测试 4.1: Git 提交命令

**准备**: 先做一个简单的修改
```bash
# 创建一个测试文件
echo "# Test" > test.md
```

**测试命令**:
```
/commit
```

**预期结果**:
- 自动检测 Git 变更
- 生成符合规范的提交信息
- 自动创建提交

**✅ 通过标准**: Git 提交成功，提交信息规范

---

#### 测试 4.2: 深度思考命令

**测试命令**:
```
/深度思考 如何设计一个高可用的微服务架构？
```

**预期结果**:
- 启动深度思考模式
- 多角度分析问题
- 探索不同方案
- 给出综合结论

**✅ 通过标准**: 收到深度分析结果

---

## 🔍 故障排查

### 问题 1: 插件未加载

**症状**: `/smart-flow` 命令不存在

**解决方案**:
```bash
# 1. 检查插件是否安装
/plugin list

# 2. 如果没有，重新安装
/plugin install smart-flow@smart-flow-marketplace

# 3. 重启 Claude Code
```

---

### 问题 2: Agent 调用失败

**症状**: Agent 没有响应或返回错误

**可能原因**:
1. Agent 定义文件缺失
2. Agent 名称拼写错误

**解决方案**:
```
# 检查 agent 定义
ls agents/ | grep python

# 查看可用的 agent
cat UNIFIED_INDEX.md | grep "python-expert"
```

---

### 问题 3: 需求澄清没有弹出选项界面 ⭐

**症状**: 只是文字提问，没有弹出 `AskUserQuestion` 界面

**原因**: 插件缓存未更新到 v2.0.1

**解决方案**:
```bash
# 1. 卸载旧版本
/plugin uninstall smart-flow@smart-flow-marketplace

# 2. 清理缓存（可选）
rm -rf "C:\Users\superma\.claude\plugins\cache\smart-flow-marketplace"

# 3. 重新安装
/plugin install smart-flow@smart-flow-marketplace

# 4. 重启 Claude Code
```

---

### 问题 4: 技能无法触发

**症状**: 技能没有自动匹配

**解决方案**:
```
# 明确指定技能
"使用 feature-development 技能..."

# 或查看技能列表
cat UNIFIED_INDEX.md
```

---

## 📊 测试结果记录

### 测试清单

| 测试项 | 状态 | 备注 |
|--------|------|------|
| 帮助信息显示 | ⬜ | 待测试 |
| **需求澄清工具调用** ⭐ | ⬜ | **最重要！验证 v2.0.1 修复** |
| Smart Flow 完整流程 | ⬜ | 待测试 |
| python-expert 调用 | ⬜ | 待测试 |
| code-reviewer 调用 | ⬜ | 待测试 |
| feature-development 技能 | ⬜ | 待测试 |
| auto-fix 技能 | ⬜ | 待测试 |
| /commit 命令 | ⬜ | 待测试 |
| /深度思考 命令 | ⬜ | 待测试 |

**图例**: ✅ 通过 | ⬜ 待测试 | ❌ 失败 | ⚠️ 警告

---

## 💡 快速测试脚本

如果你想快速测试核心功能，可以按顺序执行：

```bash
# 1. 测试帮助
/smart-flow help

# 2. 测试需求澄清工具调用 ⭐（最重要！）
我想开发一个博客系统
# 应该弹出选项界面！

# 3. 测试完整工作流
/smart-flow
我想开发一个用户登录功能
# 应该在阶段 1 弹出选项界面

# 4. 测试 Agent 调用
使用 python-expert 帮我优化代码

# 5. 测试斜杠命令
/commit

# 6. 测试深度思考
/深度思考 什么是好的代码架构？
```

---

## 🎯 成功标准

Smart Flow v2.0.1 测试通过的标准：

- ✅ **需求澄清自动弹出 AskUserQuestion 界面**（核心！）
- ✅ 所有斜杠命令可正常使用
- ✅ Agent 调用有响应
- ✅ 技能自动匹配正常
- ✅ 完整工作流可以执行
- ✅ 生成的输出质量合格

---

## 📝 测试日志模板

```markdown
### 测试日期: 2025-01-07
### 测试人: [你的名字]
### Claude Code 版本: [版本号]
### Smart Flow 版本: v2.0.1

#### 测试结果

1. 帮助信息: ✅/❌
   - 备注: [具体描述]

2. **需求澄清工具调用**: ✅/❌
   - 备注: [是否弹出选项界面？这是最关键的！]

3. Smart Flow 完整流程: ✅/❌
   - 备注: [阶段 1 是否弹出选项界面？]

4. Agent 调用: ✅/❌
   - 备注: [具体描述]

5. 技能使用: ✅/❌
   - 备注: [具体描述]

#### 发现的问题

- [问题描述 1]
- [问题描述 2]

#### 建议

- [改进建议 1]
- [改进建议 2]
```

---

## 🚀 开始测试吧！

现在你可以按照上面的测试计划，逐步测试 Smart Flow v2.0.1 的所有功能。

**建议测试顺序**:
1. **先测试"测试 1.2 - 需求澄清工具调用"** ⭐（验证修复效果）
2. 然后测试"测试 1.3 - 完整 Smart Flow 工作流"
3. 再测试 Agent 调用
4. 然后测试技能使用
5. 最后测试斜杠命令

祝测试顺利！ 🎉

---

## 📮 反馈渠道

如果测试中发现问题：
1. 记录具体失败场景
2. 检查插件版本是否为 v2.0.1
3. 尝试强制更新插件
4. 如果问题依然存在，提交 Issue 到 GitHub
