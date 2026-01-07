#!/bin/bash
# Smart Flow - 一键推送到 GitHub
# 使用方法：网络恢复后执行 bash push.sh

set -e

echo "========================================"
echo " Smart Flow - Git 推送脚本"
echo "========================================"
echo ""

cd "$(dirname "$0")"

echo "[1/3] 检查 Git 状态..."
git status
echo ""

echo "[2/3] 推送到 GitHub..."
echo ""
echo "如果提示输入用户名和密码："
echo "  Username: XX-Trader"
echo "  Password: 粘贴你的 GitHub Personal Access Token"
echo ""
echo "Token 生成地址：https://github.com/settings/tokens"
echo ""

git push origin master

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "  ✅ 推送成功！"
    echo "========================================"
    echo ""
    echo "访问：https://github.com/XX-Trader/smart-flow"
    echo ""
else
    echo ""
    echo "========================================"
    echo "  ❌ 推送失败"
    echo "========================================"
    echo ""
    echo "可能的原因："
    echo "1. 网络连接问题"
    echo "2. 需要使用 Personal Access Token"
    echo "3. Token 权限不足（需要 repo 权限）"
    echo ""
    echo "解决方法："
    echo "1. 访问 https://github.com/settings/tokens"
    echo "2. 生成新 Token（勾选 repo 权限）"
    echo "3. 推送时使用 Token 作为密码"
    echo ""
fi
