# 任务分解详细说明

## 智能匹配规则

### 关键词 → Agent 映射表

#### 产品与设计类
| 关键词 | 匹配 Agents |
|--------|------------|
| "产品", "需求", "功能" | `product-manager` |
| "UI", "界面", "设计", "交互" | `ui-ux-designer` |
| "用户体验", "UX" | `ui-ux-designer` |

#### 后端开发类
| 关键词 | 匹配 Agents |
|--------|------------|
| "API", "接口", "后端" | `backend-architect` |
| "数据库", "数据模型", "表结构" | `database-architect` |
| "架构", "系统设计" | `backend-architect` |

#### 前端开发类
| 关键词 | 匹配 Agents |
|--------|------------|
| "前端", "页面", "组件" | `frontend-developer` |
| "React", "Vue", "界面" | `frontend-developer` |

#### 测试与质量类
| 关键词 | 匹配 Agents |
|--------|------------|
| "测试", "质量", "测试用例" | `test-automator` |
| "安全", "漏洞", "权限" | `security-auditor` |

#### 部署运维类
| 关键词 | 匹配 Agents |
|--------|------------|
| "部署", "上线", "运维" | `deployment-engineer` |
| "CI/CD", "自动化" | `deployment-engineer` |

## 依赖关系分析

### 并行执行规则

```
无依赖任务 → 并行执行
有依赖任务 → 串行执行

示例:
阶段1 (并行):
  - product-manager (PRD)
  - ui-ux-designer (UI设计)
  - database-architect (数据库设计)

阶段2 (依赖阶段1):
  - backend-architect [依赖: 数据库架构]
  - frontend-developer [依赖: UI设计]

阶段3 (依赖阶段2):
  - test-automator [依赖: 前后端代码]
  - security-auditor [依赖: 前后端代码]
```

## 输出格式

### 任务清单结构

```json
{
  "stages": [
    {
      "stage": 1,
      "parallel": true,
      "tasks": [
        {
          "agent": "product-manager",
          "task": "生成产品需求文档",
          "output": "PRD.md",
          "priority": "high"
        },
        {
          "agent": "ui-ux-designer",
          "task": "设计UI界面",
          "output": "UI-Design.md",
          "priority": "high"
        }
      ]
    }
  ],
  "dependencies": {
    "backend-architect": ["database-architect"],
    "test-automator": ["backend-architect", "frontend-developer"]
  }
}
```

## 分解示例

### 示例 1: 用户登录功能

```
输入: "开发一个用户登录功能"

→ 任务分解:
阶段1 (并行):
  - product-manager: 登录需求分析
  - ui-ux-designer: 登录页面设计

阶段2 (依赖阶段1):
  - backend-architect: 登录API设计
  - frontend-developer: 登录页面实现
  - database-architect: 用户表设计

阶段3 (依赖阶段2):
  - test-automator: 登录测试用例
  - security-auditor: 安全审查
```

### 示例 2: 数据管理功能

```
输入: "做一个商品管理功能"

→ 任务分解:
阶段1 (并行):
  - product-manager: 商品管理需求
  - ui-ux-designer: 管理界面设计
  - database-architect: 商品数据模型

阶段2 (依赖阶段1):
  - backend-architect: CRUD API设计
  - frontend-developer: 管理页面实现
  - api-documenter: API文档生成

阶段3 (依赖阶段2):
  - test-automator: 功能测试
  - security-auditor: 权限审查
  - deployment-engineer: 部署配置
```

## 相关资源

- **主技能**: [../SKILL.md](../SKILL.md)
- **子技能**: [task-decomposer/SKILL.md](../../task-decomposer/SKILL.md)
