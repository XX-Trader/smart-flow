# Smart Flow - GitHub 私有仓库创建指南

本指南帮助你创建一个私有的 GitHub 仓库来存储 Smart Flow 插件。

## 📋 准备工作

### 1. GitHub 账号
- 确保你有 GitHub 账号
- 如果没有，访问 https://github.com 注册

### 2. Git 安装
- Windows: 下载安装 https://git-scm.com/download/win
- Mac: `brew install git`
- Linux: `sudo apt install git`

### 3. GitHub Personal Access Token (推荐)
由于 GitHub 已弃用密码认证，建议使用 Personal Access Token：

**创建步骤**：
1. 登录 GitHub
2. 点击右上角头像 → Settings
3. 左侧菜单最下方 → Developer settings
4. Personal access tokens → Tokens (classic)
5. Generate new token (classic)
6. 勾选 `repo` 权限
7. Generate token
8. **重要**: 复制并保存 token（只显示一次）

## 🔧 方法 1: 使用 GitHub CLI（推荐，最简单）

### 安装 GitHub CLI

**Windows**:
```powershell
winget install GitHub.cli
```

**Mac**:
```bash
brew install gh
```

**Linux**:
```bash
sudo apt install gh
```

### 登录 GitHub

```bash
gh auth login
```

按提示选择：
- GitHub.com
- HTTPS
- Yes (login with browser)

### 创建私有仓库并推送

```bash
# 进入 Smart Flow 目录
cd "d:/学习资料/量化交易/大白文件2021.5.31/CoinGod_Web/smart-flow"

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Smart Flow v1.0.0

- 完整的四阶段工作流系统
- 支持 67+ 专业 Agent
- 跨平台 Hooks 系统
- 完整文档和配置

🤖 Generated with Claude Code
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"

# 创建私有仓库并推送
gh repo create smart-flow --private --source=. --push
```

完成！你的私有仓库已创建在：`https://github.com/你的用户名/smart-flow`

## 🔧 方法 2: 使用 Git 命令（传统方式）

### 步骤 1: 在 GitHub 网站创建仓库

1. 访问 https://github.com/new
2. 填写信息：
   - **Repository name**: `smart-flow`
   - **Description**: `Smart Flow - Claude Code 智能任务调度插件`
   - **Private**: ✅ 选择（创建私有仓库）
   - **不要勾选** "Add a README file"（我们已有）
   - **不要勾选** "Add .gitignore"（我们已有）
3. 点击 "Create repository"

### 步骤 2: 初始化本地仓库并推送

```bash
# 进入 Smart Flow 目录
cd "d:/学习资料/量化交易/大白文件2021.5.31/CoinGod_Web/smart-flow"

# 初始化 Git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Smart Flow v1.0.0

- 完整的四阶段工作流系统
- 支持 67+ 专业 Agent
- 跨平台 Hooks 系统
- 完整文档和配置

🤖 Generated with Claude Code
Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"

# 添加远程仓库（替换为你的用户名）
git remote add origin https://github.com/你的用户名/smart-flow.git

# 推送（使用 token 认证）
git push -u origin main
```

**提示**: 当要求输入用户名和密码时：
- **用户名**: 你的 GitHub 用户名
- **密码**: 粘贴你的 Personal Access Token（不是 GitHub 密码）

## 🔧 方法 3: 使用 HTTPS with Token（避免每次输入密码）

### 配置 Git 凭证

```bash
# 设置 credential helper（Windows）
git config --global credential.helper manager-core

# 或（Mac/Linux）
git config --global credential.helper store
```

### 使用 Token 推送

```bash
# 推送时输入
# Username: 你的用户名
# Password: ghp_你的token（Personal Access Token）
git push -u origin main
```

## 📁 创建 .gitignore（可选）

```bash
# 在 smart-flow 目录创建 .gitignore
cat > .gitignore << 'EOF'
# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editor directories and files
.vscode/
.idea/
*.swp
*.swo
*~

# Build output
dist/
build/
*.log

# Temporary files
*.tmp
*.temp
file-list.txt
EOF

git add .gitignore
git commit -m "Add .gitignore file"
git push
```

## 🏷️ 添加仓库描述（可选）

### 使用 GitHub CLI

```bash
gh repo edit --description "Smart Flow - Claude Code 智能任务调度插件，通过需求澄清、任务分解、并行执行、结果整合四大阶段，大幅提升开发效率。"
```

### 或在网站设置

1. 访问你的仓库: https://github.com/你的用户名/smart-flow
2. 点击 Settings
3. 在 Description 中添加描述

## 🔒 验证仓库是私有的

### 使用 GitHub CLI

```bash
gh repo view --json visibility,isPrivate
```

应该显示：
```json
{
  "visibility": "private",
  "isPrivate": true
}
```

### 或在网站查看

1. 访问仓库页面
2. 右上角应该有 **"Private"** 标签
3. 访问 `https://github.com/你的用户名/smart-flow`，应该提示 "Repository not found"（未登录时）

## 📝 后续维护

### 更新仓库

```bash
# 修改文件后
cd "d:/学习资料/量化交易/大白文件2021.5.31/CoinGod_Web/smart-flow"

# 添加更改
git add .

# 提交
git commit -m "Update: 描述你的更改"

# 推送
git push
```

### 查看提交历史

```bash
git log --oneline
```

### 查看远程仓库信息

```bash
git remote -v
```

## 🎯 完成检查清单

- [ ] Git 已安装
- [ ] GitHub Personal Access Token 已创建
- [ ] 仓库已创建（私有）
- [ ] 代码已推送到 GitHub
- [ ] 仓库地址: `https://github.com/你的用户名/smart-flow`
- [ ] 仓库是私有的（未登录时无法访问）

## 💡 备份建议

私有仓库创建后，建议：

1. **定期备份**: 定期推送更新
2. **本地保留**: 保留本地副本
3. **克隆备份**: 在其他位置克隆备份

```bash
# 在其他位置克隆备份
git clone https://github.com/你的用户名/smart-flow.git smart-flow-backup
```

## 📚 下一步

仓库创建完成后：

1. ✅ 在本地使用 Smart Flow
2. ✅ 根据需要更新和优化
3. ✅ 定期推送到 GitHub 备份
4. ✅ 如果未来想公开，可以更改仓库设置

---

**完成！你的 Smart Flow 插件现在安全地存储在私有 GitHub 仓库中！** 🎉
