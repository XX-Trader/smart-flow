# 技能触发关键字优化指南

> **更新时间**: 2026-01-22
> **适用范围**: 所有 Claude Code 技能（Skills）
> **目标**: 让用户可以方便地触发任何技能

---

## 📋 目录

1. [触发关键字设计原则](#触发关键字设计原则)
2. [标准触发关键字模板](#标准触发关键字模板)
3. [分类触发关键字库](#分类触发关键字库)
4. [最佳实践案例](#最佳实践案例)
5. [自动化工具](#自动化工具)

---

## 触发关键字设计原则

### 🎯 核心原则

1. **全面覆盖**: 至少 10-15 个触发关键字
2. **多语言支持**: 中文 + 英文双语
3. **场景化**: 包含用户真实使用的短语
4. **层级化**: 从简短到详细，覆盖不同表达习惯

### ✅ 好的触发关键字

```yaml
# ✅ 好的例子 - 覆盖全面
triggers:
  keywords:
    # 直接触发
    - "TDD"
    - "测试驱动"
    - "先写测试"

    # 场景化触发
    - "用 TDD 开发"
    - "测试驱动开发"
    - "写测试用例"

    # 功能描述
    - "覆盖率检查"
    - "测试覆盖率"
    - "代码质量"

  auto_trigger: false
  confidence_threshold: 0.7
```

### ❌ 不好的触发关键字

```yaml
# ❌ 不好的例子 - 太少太简
triggers:
  keywords:
    - "TDD"
    - "test"

  auto_trigger: false
```

**问题**:
- 只有 2 个关键字
- 缺少中文触发词
- 缺少场景化短语
- 用户难以主动触发

---

## 标准触发关键字模板

### 📦 通用技能模板

适用于大多数技能的触发关键字结构：

```yaml
triggers:
  keywords:
    # ===== 层级 1: 核心关键字（2-3个）=====
    - "技能英文名"
    - "技能中文名"
    - "缩写或简称"

    # ===== 层级 2: 动作动词（3-5个）=====
    - "使用[技能名]"
    - "用[技能名]"
    - "[技能名]开发"
    - "[技能名]实现"
    - "应用[技能名]"

    # ===== 层级 3: 场景化短语（5-8个）=====
    - "[场景描述1]"
    - "[场景描述2]"
    - "[场景描述3]"

    # ===== 层级 4: 相关概念（3-5个）=====
    - "[相关概念1]"
    - "[相关概念2]"
    - "[相关概念3]"

  auto_trigger: false              # 手动触发
  confidence_threshold: 0.7       # 触发置信度
```

---

## 分类触发关键字库

### 🎨 产品设计类

```yaml
# 产品经理 (product-manager)
triggers:
  keywords:
    # 核心
    - "product-manager"
    - "产品经理"
    - "PM"

    # 动作
    - "写PRD"
    - "产品需求"
    - "需求文档"
    - "产品设计"

    # 场景
    - "分析产品需求"
    - "设计产品功能"
    - "编写产品文档"
    - "产品规划"

    # 相关
    - "需求分析"
    - "功能设计"
    - "产品路线图"

  auto_trigger: false
  confidence_threshold: 0.7
```

### 💻 开发类

```yaml
# 前端开发 (frontend-developer)
triggers:
  keywords:
    # 核心
    - "frontend"
    - "前端开发"
    - "前端"

    # 动作
    - "开发前端"
    - "写前端代码"
    - "实现前端"
    - "前端实现"

    # 场景
    - "开发React组件"
    - "实现Vue页面"
    - "响应式开发"
    - "前端架构"

    # 技术
    - "React开发"
    - "Vue开发"
    - "TypeScript"
    - "前端框架"

  auto_trigger: false
  confidence_threshold: 0.7
```

```yaml
# 后端开发 (backend-developer)
triggers:
  keywords:
    # 核心
    - "backend"
    - "后端开发"
    - "后端"

    # 动作
    - "开发后端"
    - "写后端代码"
    - "实现API"
    - "后端接口"

    # 场景
    - "开发API接口"
    - "实现后端逻辑"
    - "数据库设计"
    - "服务端开发"

    # 技术
    - "Python开发"
    - "Node.js开发"
    - "API设计"
    - "微服务"

  auto_trigger: false
  confidence_threshold: 0.7
```

### 🧪 测试类

```yaml
# TDD (test-driven-development)
triggers:
  keywords:
    # 核心
    - "TDD"
    - "测试驱动"
    - "测试驱动开发"

    # 动作
    - "先写测试"
    - "用TDD开发"
    - "测试驱动实现"
    - "TDD开发"

    # 场景
    - "写测试用例"
    - "编写单元测试"
    - "测试覆盖率"
    - "代码质量"

    # 覆盖率
    - "覆盖率检查"
    - "测试覆盖率"
    - "代码覆盖率"
    - "coverage"

  auto_trigger: false
  confidence_threshold: 0.7
```

```yaml
# 测试自动化 (test-automator)
triggers:
  keywords:
    # 核心
    - "test-automator"
    - "测试自动化"
    - "自动化测试"

    # 动作
    - "写自动化测试"
    - "测试套件"
    - "集成测试"
    - "端到端测试"

    # 场景
    - "自动化测试脚本"
    - "CI测试"
    - "测试框架"
    - "测试工具"

  auto_trigger: false
  confidence_threshold: 0.7
```

### 🚀 部署类

```yaml
# 数据库部署 (db-deploy)
triggers:
  keywords:
    # 核心
    - "db-deploy"
    - "数据库部署"
    - "DB部署"

    # 动作
    - "部署数据库"
    - "配置数据库"
    - "数据库迁移"
    - "初始化数据库"

    # 场景
    - "部署MySQL"
    - "配置PostgreSQL"
    - "数据库优化"
    - "数据库备份"

    # 相关
    - "SQL脚本"
    - "数据库版本控制"
    - "数据迁移"

  auto_trigger: false
  confidence_threshold: 0.7
```

```yaml
# 全栈部署 (windows-fullstack-deploy)
triggers:
  keywords:
    # 核心
    - "windows-fullstack-deploy"
    - "Windows部署"
    - "本地部署"

    # 动作
    - "部署到Windows"
    - "本地环境搭建"
    - "开发环境配置"
    - "一键部署"

    # 场景
    - "搭建本地开发环境"
    - "配置Django环境"
    - "配置Vue环境"
    - "配置数据库"

  auto_trigger: false
  confidence_threshold: 0.7
```

### 🔧 修复类

```yaml
# 自动修复 (auto-fix)
triggers:
  keywords:
    # 核心
    - "auto-fix"
    - "自动修复"
    - "智能修复"

    # 动作
    - "修复测试"
    - "自动修bug"
    - "循环修复"
    - "修复失败"

    # 场景
    - "测试失败修复"
    - "自动修复代码"
    - "持续修复"
    - "测试通过"

    # 相关
    - "测试-修复循环"
    - "自动化问题修复"
    - "修复系统"

  auto_trigger: false
  confidence_threshold: 0.7
```

### 📊 数据类

```yaml
# 数据分析 (data-analyst)
triggers:
  keywords:
    # 核心
    - "data-analyst"
    - "数据分析"
    - "数据分析师"

    # 动作
    - "分析数据"
    - "数据可视化"
    - "统计"
    - "数据报告"

    # 场景
    - "数据分析报告"
    - "业务数据分析"
    - "用户行为分析"
    - "趋势分析"

  auto_trigger: false
  confidence_threshold: 0.7
```

### 🔐 安全类

```yaml
# 安全审计 (security-auditor)
triggers:
  keywords:
    # 核心
    - "security-auditor"
    - "安全审计"
    - "安全审查"

    # 动作
    - "安全检查"
    - "漏洞扫描"
    - "代码审计"
    - "安全测试"

    # 场景
    - "SQL注入检查"
    - "XSS漏洞"
    - "安全漏洞修复"
    - "代码安全"

  auto_trigger: false
  confidence_threshold: 0.7
```

---

## 最佳实践案例

### 案例 1: feature-development 技能优化

**优化前**:
```yaml
triggers:
  keywords:
    - "feature"
    - "development"
  auto_trigger: false
  confidence_threshold: 0.6
```

**优化后**:
```yaml
triggers:
  keywords:
    # ===== 核心关键字 =====
    - "feature-development"
    - "功能开发"
    - "feature开发"

    # ===== 动作动词 =====
    - "开发功能"
    - "实现功能"
    - "功能设计"
    - "需求开发"
    - "功能实现"

    # ===== 场景化短语 =====
    - "全栈开发"
    - "Django+Vue开发"
    - "前后端开发"
    - "完整功能开发"
    - "从零开发"

    # ===== 相关概念 =====
    - "PRD"
    - "技术方案"
    - "API设计"
    - "数据库设计"
    - "架构设计"

  auto_trigger: false
  confidence_threshold: 0.7
```

**改进点**:
- ✅ 从 2 个关键字增加到 20+ 个
- ✅ 添加了中文触发词
- ✅ 添加了场景化短语
- ✅ 提高了置信度阈值（0.6 → 0.7）

---

### 案例 2: db-deploy 技能优化

**优化前**:
```yaml
triggers:
  keywords:
    - "db"
    - "deploy"
  auto_trigger: false
  confidence_threshold: 0.6
```

**优化后**:
```yaml
triggers:
  keywords:
    # ===== 核心关键字 =====
    - "db-deploy"
    - "数据库部署"
    - "DB部署"

    # ===== 动作动词 =====
    - "部署数据库"
    - "配置数据库"
    - "初始化数据库"
    - "数据库迁移"

    # ===== 场景化短语 =====
    - "部署MySQL"
    - "配置PostgreSQL"
    - "数据库优化"
    - "数据库备份"
    - "数据库脚本"

    # ===== 相关概念 =====
    - "SQL脚本"
    - "数据库版本控制"
    - "数据迁移"
    - "数据库设计"

  auto_trigger: false
  confidence_threshold: 0.7
```

---

## 自动化工具

### 🔧 批量优化脚本

创建一个 Python/Node.js 脚本，批量优化触发关键字：

```python
# scripts/optimize_triggers.py
import os
import re
from pathlib import Path

def optimize_skill_triggers(skill_path):
    """优化单个技能的触发关键字"""
    # 读取 SKILL.md
    with open(skill_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # 提取技能名称
    name_match = re.search(r'name: (.+)', content)
    if not name_match:
        return

    skill_name = name_match.group(1).strip()

    # 检查是否已有 triggers
    if 'triggers:' not in content:
        # 添加基础触发配置
        triggers = f'''triggers:
  keywords:
    - "{skill_name}"
    - "{translate_to_chinese(skill_name)}"

  auto_trigger: false
  confidence_threshold: 0.7
'''
        # 在 description 后插入
        content = re.sub(
            r'(description: .+\n)',
            r'\1\n' + triggers,
            content
        )

    # 写回文件
    with open(skill_path, 'w', encoding='utf-8') as f:
        f.write(content)

    print(f"✅ 优化完成: {skill_name}")

def main():
    skills_dir = Path("skills-user")
    for skill_file in skills_dir.glob("*/SKILL.md"):
        optimize_skill_triggers(skill_file)

if __name__ == "__main__":
    main()
```

### 📝 触发关键字检查清单

使用此清单验证触发关键字质量：

```
## 触发关键字质量检查清单

### 基本要求
- [ ] 至少 10-15 个触发关键字
- [ ] 包含中文和英文触发词
- [ ] 包含技能的完整名称和简称
- [ ] 设置了合理的置信度阈值（0.6-0.8）

### 分类覆盖
- [ ] 核心关键字（2-3个）
- [ ] 动作动词（3-5个）
- [ ] 场景化短语（5-8个）
- [ ] 相关概念（3-5个）

### 实用性
- [ ] 包含用户真实使用的短语
- [ ] 覆盖不同的表达方式
- [ ] 与其他技能的触发关键字不冲突
- [ ] 容易记忆和使用

### 测试验证
- [ ] 使用每个触发关键字测试
- [ ] 确认技能能够正确触发
- [ ] 确认不会误触发其他技能
```

---

## 📚 参考资源

### 相关文档
- [SKILL.md 格式规范](https://docs.claude.com/skills/format)
- [触发机制详解](https://docs.claude.com/skills/triggers)
- [最佳实践案例](https://docs.claude.com/skills/best-practices)

### 工具
- [触发关键字生成器](../scripts/generate-triggers.py)
- [批量优化脚本](../scripts/optimize-triggers.py)
- [质量检查工具](../scripts/check-triggers.py)

---

## 🎯 快速开始

1. **阅读设计原则** → 理解好的触发关键字应该是什么样的
2. **选择分类模板** → 根据技能类型选择合适的模板
3. **自定义触发词** → 添加技能特定的触发短语
4. **测试验证** → 使用每个触发关键字测试技能
5. **文档更新** → 更新技能文档说明如何触发

---

**维护说明**:
- 本文档定期更新，添加新的触发关键字模板
- 发现好的触发关键字案例，欢迎补充
- 有问题或建议，请提交 Issue

---

**文档版本**: v1.0
**最后更新**: 2026-01-22
**维护者**: Smart Flow Team
