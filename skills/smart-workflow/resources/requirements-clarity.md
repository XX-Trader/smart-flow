# 需求澄清详细说明

## 执行步骤详解

### 1. 使用 AskUserQuestion 工具

**工具调用示例**:
```
AskUserQuestion({
  questions: [
    {
      question: "这个功能的主要目标是什么？",
      header: "功能目标",
      options: [
        { label: "提高用户效率", description: "帮助用户更快完成任务" },
        { label: "解决特定问题", description: "解决现有系统的痛点" },
        { label: "新增业务能力", description: "扩展系统功能范围" }
      ],
      multiSelect: false
    },
    {
      question: "哪些是必须功能？",
      header: "核心功能",
      options: [
        { label: "基础 CRUD", description: "增删改查操作" },
        { label: "数据验证", description: "输入验证和错误提示" },
        { label: "权限控制", description: "用户权限管理" }
      ],
      multiSelect: true
    }
  ]
})
```

### 2. 等待用户回答

**重要原则**:
- ✅ 必须等待用户明确回答
- ❌ 不要假设或猜测用户需求
- ❌ 不要自己编造功能细节

### 3. 生成结构化需求文档

**输出格式**:
```json
{
  "goal": "功能目标描述",
  "targetUsers": ["用户类型1", "用户类型2"],
  "coreFeatures": ["功能1", "功能2"],
  "optionalFeatures": ["功能A", "功能B"],
  "techStack": {
    "frontend": "React/Vue/无偏好",
    "backend": "Django/FastAPI/Node.js",
    "database": "MySQL/PostgreSQL/无偏好"
  },
  "constraints": {
    "performance": "性能要求",
    "security": "安全要求",
    "compatibility": "兼容性要求"
  },
  "references": ["参考链接1", "参考链接2"]
}
```

## 核心问题模板

1. **功能目标**: 这个功能要解决什么问题？达到什么效果？
2. **目标用户**: 谁会使用这个功能？（普通用户/管理员/开发者）
3. **核心功能**: 哪些是必须的？哪些是可选的？
4. **技术栈**: 前端/后端/数据库有特定要求吗？
5. **约束条件**: 时间/性能/安全/兼容性方面有什么要求？
6. **参考资料**: 有类似的实现可以参考吗？

## 常见场景

### 场景 1: 用户需求模糊
```
用户: "帮我做一个登录功能"

→ 澄清问题:
1. 登录方式？（密码/第三方/短信）
2. 是否需要记住密码？
3. 是否需要验证码？
4. 找回密码方式？
```

### 场景 2: 技术栈不确定
```
用户: "做一个数据展示页面"

→ 澄清问题:
1. 数据实时性要求？（实时更新/定时刷新）
2. 数据量大小？（少量数据/大数据可视化）
3. 交互需求？（简单展示/复杂交互）
```

## 相关资源

- **主技能**: [../SKILL.md](../SKILL.md)
- **子技能**: [requirements-clarity/SKILL.md](../../requirements-clarity/SKILL.md)
