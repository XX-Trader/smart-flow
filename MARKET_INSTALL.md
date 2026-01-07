# 🛒 Smart Flow - 通过市场安装

Claude Code 支持**插件市场**系统，用户可以像安装 npm 包一样安装插件。

## 📦 方法 1: 通过市场安装（推荐）

### 步骤 1: 注册 Smart Flow 市场

在 Claude Code 中执行：

```bash
/plugin marketplace add XX-Trader/smart-flow-marketplace
```

### 步骤 2: 安装 Smart Flow 插件

```bash
/plugin install smart-flow@smart-flow-marketplace
```

### 步骤 3: 验证安装

```bash
/help
```

应该看到：
```
# /smart-flow - 启动智能任务调度流程
# /sf - 智能任务调度快捷命令
```

## 📦 方法 2: 直接克隆安装

如果市场不可用，可以手动安装：

```bash
# 1. 进入插件目录
cd ~/.claude/plugins

# 2. 克隆插件
git clone https://github.com/XX-Trader/smart-flow.git

# 3. 配置 CLAUDE.md
# 在 ~/.claude/CLAUDE.md 中添加 Smart Flow 配置
```

详细步骤请参考 [INSTALL.md](INSTALL.md)

## 🔄 更新插件

### 通过市场更新

```bash
/plugin update smart-flow@smart-flow-marketplace
```

### 手动更新

```bash
cd ~/.claude/plugins/smart-flow
git pull origin master
```

## 🗑️ 卸载插件

### 通过市场卸载

```bash
/plugin uninstall smart-flow@smart-flow-marketplace
```

### 手动卸载

```bash
# 删除插件目录
rm -rf ~/.claude/plugins/smart-flow

# 从 CLAUDE.md 中删除 Smart Flow 配置
nano ~/.claude/CLAUDE.md
```

## 📚 市场配置文件

Smart Flow 使用以下配置文件：

### `.claude-plugin/plugin.json`
定义插件信息：
- 插件名称、描述、版本
- 作者信息
- 支持的技能和命令
- 功能特性

### `.claude-plugin/marketplace.json`
定义市场信息：
- 市场名称和描述
- 包含的插件列表
- 插件源路径

## 🌐 发布到公共市场

如果你想将 Smart Flow 发布到公共市场：

### 选项 1: 提交到 Claude Code 官方市场

联系 Claude Code 团队，申请将插件加入官方市场。

### 选项 2: 使用 GitHub 仓库作为市场

当前方式：
- 用户通过 `XX-Trader/smart-flow-marketplace` 访问
- 直接从 GitHub 仓库安装
- 适合个人或团队使用

### 选项 3: 创建独立的 Marketplace 仓库

1. 创建 `smart-flow-marketplace` 仓库
2. 在仓库中包含多个插件的 `marketplace.json`
3. 用户注册市场后可以选择安装多个插件

## 🔧 自定义市场

### 创建自己的市场

如果你想创建一个包含多个插件的市场：

1. **创建市场仓库**：
   ```bash
   mkdir my-marketplace
   cd my-marketplace
   ```

2. **创建 marketplace.json**：
   ```json
   {
     "name": "my-marketplace",
     "description": "我的 Claude Code 插件市场",
     "owner": {
       "name": "Your Name",
       "email": "your-email@example.com"
     },
     "plugins": [
       {
         "name": "smart-flow",
         "description": "智能任务调度插件",
         "version": "1.0.0",
         "source": "https://github.com/XX-Trader/smart-flow",
         "author": {
           "name": "XX-Trader"
         }
       },
       {
         "name": "another-plugin",
         "description": "另一个插件",
         "version": "1.0.0",
         "source": "./another-plugin",
         "author": {
           "name": "Your Name"
         }
       }
     ]
   }
   ```

3. **发布到 GitHub**：
   ```bash
   git init
   git add .
   git commit -m "Initial marketplace"
   git remote add origin https://github.com/YOUR-USERNAME/marketplace.git
   git push -u origin main
   ```

4. **用户使用**：
   ```bash
   /plugin marketplace add YOUR-USERNAME/marketplace
   /plugin install smart-flow@marketplace
   ```

## 📖 参考资料

- [Claude Code 插件开发文档](https://docs.claudecode.com/plugins)
- [Superpowers 插件市场](https://github.com/obra/superpowers)
- [插件市场最佳实践](https://github.com/obra/superpowers-marketplace)

## 💡 提示

- **市场 vs 插件**：
  - 市场（Marketplace）：包含多个插件的仓库
  - 插件（Plugin）：单个插件项目

- **安装方式**：
  - 通过市场安装：`/plugin install plugin-name@marketplace-name`
  - 直接克隆：`git clone https://github.com/...`

- **推荐方式**：
  - 公开发布：使用市场机制
  - 私人使用：直接克隆到 `~/.claude/plugins/`

---

**现在用户可以通过市场轻松安装 Smart Flow 了！** 🎉
