@echo off
REM Smart Flow - GitHub 私有仓库一键上传脚本
REM 使用方法:
REM 1. 双击运行此脚本
REM 2. 按照提示操作

echo ========================================
echo  Smart Flow - GitHub 私有仓库上传工具
echo ========================================
echo.

REM 检查 Git 是否安装
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到 Git
    echo 请先安装 Git: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [1/5] Git 已安装
echo.

REM 检查是否在正确的目录
if not exist "skills\smart-workflow\SKILL.md" (
    echo [错误] 请在 smart-flow 根目录运行此脚本
    echo 当前目录: %CD%
    pause
    exit /b 1
)

echo [2/5] 目录检查通过
echo.

REM 显示菜单
echo ========================================
echo  请选择操作:
echo ========================================
echo.
echo 1. 创建新的私有仓库 (推荐)
echo 2. 推送到现有仓库
echo 3. 查看仓库状态
echo.
set /p choice=请输入选项 (1-3):

if "%choice%"=="1" goto NEW_REPO
if "%choice%"=="2" goto PUSH_EXISTING
if "%choice%"=="3" goto STATUS
echo 无效选项
pause
exit /b 1

:NEW_REPO
echo.
echo ========================================
echo  创建新的私有仓库
echo ========================================
echo.
echo [步骤指南]
echo.
echo 1. 脚本将为你生成 GitHub CLI 命令
echo 2. 请按以下步骤操作:
echo.
echo   a) 打开浏览器访问: https://github.com/new
echo   b) 创建仓库:
echo      - Repository name: smart-flow
echo      - 选择: Private (私有)
echo      - 不要勾选任何其他选项
echo   c) 点击 "Create repository"
echo   d) 复制仓库 URL
echo.
set /p repo_url=仓库 URL (例如: https://github.com/username/smart-flow.git):

echo.
echo [3/5] 配置远程仓库...
git remote add origin %repo_url% 2>nul
if %errorlevel% neq 0 (
    echo 远程仓库已存在，更新中...
    git remote set-url origin %repo_url%
)

echo.
echo [4/5] 推送代码到 GitHub...
echo.
echo 即将推送到: %repo_url%
echo.
echo ⚠️  注意: 推送时需要认证
echo    - Username: 你的 GitHub 用户名
echo    - Password: 使用 Personal Access Token (不是密码)
echo.
echo    如果没有 Token，请访问:
echo    https://github.com/settings/tokens
echo.
pause

git push -u origin master
if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo  ✅ 上传成功！
    echo ========================================
    echo.
    echo 仓库地址: %repo_url%
    echo.
    echo 下次更新代码，只需执行:
    echo   git add .
    echo   git commit -m "update message"
    echo   git push
    echo.
) else (
    echo.
    echo ========================================
    echo  ❌ 推送失败
    echo ========================================
    echo.
    echo 可能的原因:
    echo 1. 仓库 URL 错误
    echo 2. 需要使用 Personal Access Token
    echo 3. 网络连接问题
    echo.
    echo 解决方法:
    echo 1. 访问: https://github.com/settings/tokens
    echo 2. 生成新的 Token (勾选 repo 权限)
    echo 3. 推送时使用 Token 作为密码
    echo.
)
pause
exit /b 0

:PUSH_EXISTING
echo.
echo ========================================
echo  推送到现有仓库
echo ========================================
echo.
set /p repo_url=仓库 URL:

git remote add origin %repo_url% 2>nul
git remote set-url origin %repo_url%

git push -u origin master
pause
exit /b 0

:STATUS
echo.
echo ========================================
echo  仓库状态
echo ========================================
echo.
echo 远程仓库:
git remote -v
echo.
echo 最近提交:
git log --oneline -n 5
echo.
pause
exit /b 0
