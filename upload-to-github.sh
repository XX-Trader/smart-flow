#!/bin/bash
# Smart Flow - GitHub 私有仓库一键上传脚本 (Mac/Linux)

set -e

echo "========================================"
echo " Smart Flow - GitHub 私有仓库上传工具"
echo "========================================"
echo ""

# 检查 Git
if ! command -v git &> /dev/null; then
    echo "[错误] 未检测到 Git"
    echo "请先安装 Git:"
    echo "  Mac:   brew install git"
    echo "  Linux: sudo apt install git"
    exit 1
fi

echo "[1/5] Git 已安装"
echo ""

# 检查目录
if [ ! -f "skills/smart-workflow/SKILL.md" ]; then
    echo "[错误] 请在 smart-flow 根目录运行此脚本"
    echo "当前目录: $(pwd)"
    exit 1
fi

echo "[2/5] 目录检查通过"
echo ""

# 菜单
echo "========================================"
echo " 请选择操作:"
echo "========================================"
echo ""
echo "1. 创建新的私有仓库 (推荐)"
echo "2. 推送到现有仓库"
echo "3. 使用 GitHub CLI (最快)"
echo "4. 查看仓库状态"
echo ""
read -p "请输入选项 (1-4): " choice

case $choice in
    1)
        NEW_REPO=true
        ;;
    2)
        PUSH_EXISTING=true
        ;;
    3)
        USE_GH_CLI=true
        ;;
    4)
        SHOW_STATUS=true
        ;;
    *)
        echo "无效选项"
        exit 1
        ;;
esac

if [ "$NEW_REPO" = true ]; then
    echo ""
    echo "========================================"
    echo " 创建新的私有仓库"
    echo "========================================"
    echo ""
    echo "[步骤指南]"
    echo ""
    echo "1. 脚本将为你生成 GitHub CLI 命令"
    echo "2. 请按以下步骤操作:"
    echo ""
    echo "   a) 打开浏览器访问: https://github.com/new"
    echo "   b) 创建仓库:"
    echo "      - Repository name: smart-flow"
    echo "      - 选择: Private (私有)"
    echo "      - 不要勾选任何其他选项"
    echo "   c) 点击 'Create repository'"
    echo "   d) 复制仓库 URL"
    echo ""
    read -p "仓库 URL (例如: https://github.com/username/smart-flow.git): " repo_url

    echo ""
    echo "[3/5] 配置远程仓库..."
    git remote add origin $repo_url 2>/dev/null || git remote set-url origin $repo_url

    echo ""
    echo "[4/5] 推送代码到 GitHub..."
    echo ""
    echo "即将推送到: $repo_url"
    echo ""
    echo "⚠️  注意: 推送时需要认证"
    echo "   - Username: 你的 GitHub 用户名"
    echo "   - Password: 使用 Personal Access Token (不是密码)"
    echo ""
    echo "   如果没有 Token，请访问:"
    echo "   https://github.com/settings/tokens"
    echo ""
    read -p "按 Enter 继续..."

    git push -u origin master

    if [ $? -eq 0 ]; then
        echo ""
        echo "========================================"
        echo "  ✅ 上传成功！"
        echo "========================================"
        echo ""
        echo "仓库地址: $repo_url"
        echo ""
        echo "下次更新代码，只需执行:"
        echo "  git add ."
        echo "  git commit -m 'update message'"
        echo "  git push"
        echo ""
    else
        echo ""
        echo "========================================"
        echo "  ❌ 推送失败"
        echo "========================================"
        echo ""
        echo "可能的原因:"
        echo "1. 仓库 URL 错误"
        echo "2. 需要使用 Personal Access Token"
        echo "3. 网络连接问题"
        echo ""
        echo "解决方法:"
        echo "1. 访问: https://github.com/settings/tokens"
        echo "2. 生成新的 Token (勾选 repo 权限)"
        echo "3. 推送时使用 Token 作为密码"
        echo ""
    fi
fi

if [ "$PUSH_EXISTING" = true ]; then
    echo ""
    echo "========================================"
    echo " 推送到现有仓库"
    echo "========================================"
    echo ""
    read -p "仓库 URL: " repo_url

    git remote add origin $repo_url 2>/dev/null || git remote set-url origin $repo_url
    git push -u origin master
fi

if [ "$USE_GH_CLI" = true ]; then
    echo ""
    echo "========================================"
    echo " 使用 GitHub CLI (最快)"
    echo "========================================"
    echo ""

    if ! command -v gh &> /dev/null; then
        echo "GitHub CLI 未安装"
        echo ""
        echo "安装 GitHub CLI:"
        echo "  Mac:   brew install gh"
        echo "  Linux: sudo apt install gh"
        echo ""
        echo "或访问: https://cli.github.com/"
        exit 1
    fi

    echo "检查登录状态..."
    if ! gh auth status &> /dev/null; then
        echo "需要登录 GitHub..."
        gh auth login
    fi

    echo ""
    echo "创建私有仓库并推送..."
    gh repo create smart-flow --private --source=. --push --description="Smart Flow - Claude Code 智能任务调度插件"

    if [ $? -eq 0 ]; then
        echo ""
        echo "========================================"
        echo "  ✅ 创建成功！"
        echo "========================================"
        echo ""
        gh repo view
    fi
fi

if [ "$SHOW_STATUS" = true ]; then
    echo ""
    echo "========================================"
    echo "  仓库状态"
    echo "========================================"
    echo ""
    echo "远程仓库:"
    git remote -v
    echo ""
    echo "最近提交:"
    git log --oneline -n 5
    echo ""
fi
