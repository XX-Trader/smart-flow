# 🔧 Smart Flow 市场配置问题解决方案

## ❌ 问题分析

你输入的：
```
https://github.com/XX-Trader/smart-flow
```

**问题**：
1. 格式错误（应该用 `owner/repo` 格式）
2. `smart-flow` 仓库不是市场仓库，它是插件仓库
3. 需要一个独立的 `smart-flow-marketplace` 仓库

## ✅ 解决方案（3 种方法）

### 方法 1: 使用 SSH URL（推荐，如果有 SSH 密钥）

在 Claude Code 中执行：

```
/plugin marketplace add git@github.com:XX-Trader/smart-flow.git
```

或简化格式：

```
/plugin marketplace add XX-Trader/smart-flow
```

### 方法 2: 配置 Git 凭证（推荐）

#### Windows:

```bash
# 在 Git Bash 或 PowerShell 中执行

# 1. 配置凭证助手（使用 Windows 凭据管理器）
git config --global credential.helper wincred

# 2. 或者配置凭据存储
git config --global credential.helper store

# 3. 手动克隆一次以保存凭据
git clone https://github.com/XX-Trader/smart-flow.git
# 输入：
# Username: XX-Trader
# Password: ghp_xxxxxxxxxxxxxxxxxxxxxx（你的 GitHub Token）

# 4. 删除测试克隆
rm -rf smart-flow

# 5. 回到 Claude Code 重试
/plugin marketplace add XX-Trader/smart-flow
```

#### Mac/Linux:

```bash
# 1. 配置凭证助手
git config --global credential.helper osxkeychain  # Mac
# 或
git config --global credential.helper cache       # Linux

# 2. 手动克隆一次
git clone https://github.com/XX-Trader/smart-flow.git
# 输入用户名和 Token

# 3. 删除测试克隆
rm -rf smart-flow

# 4. 回到 Claude Code 重试
/plugin marketplace add XX-Trader/smart-flow
```

### 方法 3: 创建独立的市场仓库（最佳方案）

创建一个专门的 `smart-flow-marketplace` 仓库：

#### 步骤 1: 创建新仓库

访问：https://github.com/new

**填写**：
- Repository name: `smart-flow-marketplace`
- Description: `Smart Flow 插件市场`
- 选择: **Private** (私有)
- 勾选：Add a README file
- 点击 "Create repository"

#### 步骤 2: 上传 marketplace.json

```bash
# 1. 克隆新仓库
cd "d:\学习资料\量化交易\大白文件2021.5.31\CoinGod_Web"
git clone https://github.com/XX-Trader/smart-flow-marketplace.git
cd smart-flow-marketplace

# 2. 复制 marketplace.json
cp ../smart-flow/.claude-plugin/marketplace.json .

# 3. 修改 marketplace.json（更新插件路径）
```

修改 `marketplace.json`：

```json
{
  "name": "smart-flow-marketplace",
  "description": "Smart Flow 智能任务调度插件市场",
  "owner": {
    "name": "XX-Trader",
    "email": "your-email@example.com"
  },
  "homepage": "https://github.com/XX-Trader/smart-flow",
  "plugins": [
    {
      "name": "smart-flow",
      "description": "智能任务调度插件 - 通过需求澄清、任务分解、并行执行、结果整合四大阶段，大幅提升开发效率。支持 67+ 专业 Agent。",
      "version": "1.0.0",
      "source": "https://github.com/XX-Trader/smart-flow.git",
      "author": {
        "name": "XX-Trader",
        "email": "your-email@example.com"
      }
    }
  ]
}
```

```bash
# 4. 提交并推送
git add marketplace.json
git commit -m "Add: Smart Flow marketplace configuration"
git push origin master
```

#### 步骤 3: 在 Claude Code 中添加市场

```
/plugin marketplace add XX-Trader/smart-flow-marketplace
```

#### 步骤 4: 安装插件

```
/plugin install smart-flow@smart-flow-marketplace
```

## 🎯 推荐流程（最快）

### 如果你想快速测试：

**选项 A**: 使用手动克隆（最简单）

```bash
cd ~/.claude/plugins
git clone https://github.com/XX-Trader/smart-flow.git
```

然后配置 `CLAUDE.md` 即可使用。

**选项 B**: 配置 Git 凭证后使用市场

```bash
# 1. 配置 Git 凭据
git config --global credential.helper wincred

# 2. 手动克隆一次（输入 Token）
git clone https://github.com/XX-Trader/smart-flow.git temp
rm -rf temp

# 3. 在 Claude Code 中
/plugin marketplace add XX-Trader/smart-flow
```

**选项 C**: 创建独立市场仓库（最规范）

按照方法 3 的步骤，创建 `smart-flow-marketplace` 仓库。

## 🔑 关于 GitHub Token

如果还没有 Token：

1. 访问：https://github.com/settings/tokens
2. 点击 "Generate new token" (classic)
3. Note: `Smart Flow Plugin`
4. 勾选权限：☑️ **repo**
5. 生成并复制 Token

## 📝 总结

| 方法 | 难度 | 时间 | 推荐度 |
|------|------|------|--------|
| 手动克隆 | ⭐ | 1分钟 | ⭐⭐⭐⭐⭐ |
| 配置凭据 | ⭐⭐ | 2分钟 | ⭐⭐⭐⭐ |
| 创建市场仓库 | ⭐⭐⭐ | 5分钟 | ⭐⭐⭐⭐⭐ |

**推荐**：如果只是个人使用，用**手动克隆**最快；
如果要公开发布或分享给团队，用**创建市场仓库**最规范。

---

需要我帮你创建独立的市场仓库吗？
