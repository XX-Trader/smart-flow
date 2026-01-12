#!/usr/bin/env node

/**
 * 批量升级 Agent 配置文件到 2026 规范
 */

const fs = require('fs');
const path = require('path');

const agentsDir = './agents';
const backupDir = './agents.backup';

// Agent 分类映射
const categoryMap = {
  // 产品 & 设计
  'product-manager': 'product-design',
  'business-analyst': 'product-design',
  'ui-ux-designer': 'product-design',

  // 架构 & 后端
  'backend-architect': 'architecture-backend',
  'backend-developer': 'development-backend',
  'database-architect': 'database',
  'database-optimizer': 'database',
  'database-admin': 'database',
  'api-documenter': 'api-documentation',
  'graphql-architect': 'architecture-backend',
  'api-documenter': 'api-documentation',

  // 前端
  'frontend-developer': 'development-frontend',
  'nextjs-developer': 'development-frontend',
  'react-performance-optimization': 'development-frontend',
  'ios-developer': 'mobile',
  'mobile-developer': 'mobile',

  // DevOps & 部署
  'deployment-engineer': 'devops-deployment',
  'devops-troubleshooter': 'devops-deployment',
  'cloud-architect': 'devops-deployment',
  'windows-fullstack-deploy': 'devops-deployment',
  'db-deploy': 'devops-deployment',
  'github-actions-runner': 'devops-deployment',
  'terraform-specialist': 'devops-deployment',
  'incident-responder': 'devops-deployment',

  // 测试 & 质量
  'test-automator': 'testing-quality',
  'security-auditor': 'testing-quality',
  'code-reviewer': 'testing-quality',
  'architect-review': 'testing-quality',
  'performance-engineer': 'testing-quality',
  'legacy-modernizer': 'testing-quality',

  // 编程语言
  'python-expert': 'programming-language',
  'typescript-expert': 'programming-language',
  'javascript-developer': 'programming-language',
  'golang-expert': 'programming-language',
  'java-developer': 'programming-language',
  'cpp-engineer': 'programming-language',
  'rust-expert': 'programming-language',
  'c-developer': 'programming-language',
  'php-developer': 'programming-language',
  'ruby-expert': 'programming-language',
  'sql-expert': 'programming-language',

  // AI & 数据
  'ai-engineer': 'ai-data',
  'data-engineer': 'ai-data',
  'ml-engineer': 'ai-data',
  'mlops-engineer': 'ai-data',
  'data-scientist': 'ai-data',
  'data-analyst': 'ai-data',
  'prompt-engineer': 'ai-data',

  // 研究 & 分析
  'research-orchestrator': 'research-analysis',
  'comprehensive-researcher': 'research-analysis',
  'technical-researcher': 'research-analysis',
  'academic-researcher': 'research-analysis',
  'market-research-analyst': 'research-analysis',
  'search-specialist': 'research-analysis',

  // 默认
  'default': 'other'
};

// 生成 2026 规范的 YAML front matter
function generate2026YAML(name, description, category) {
  return `---
name: ${name}
displayName: "${getDisplayName(name)}"
version: "1.0.0"
description: ${description}

triggers:
  keywords:
    ${generateKeywords(name)}
  auto_trigger: false
  confidence_threshold: 0.7

tools:
  required:
    - Read
    - Write
  optional:
    - Bash
    - Edit

permissions:
  level: "write"
  scope:
    - "file:read"
    - "file:write"

context:
  mode: fork
  isolation: true
  max_context_tokens: 50000

hot_reload: true
progressive_load: true

metadata:
  category: "${category || 'other'}"
  tags:
    ${generateTags(name)}
  author: "Smart Flow Team"
  license: "MIT"
  created_at: "2024-01-07"
  updated_at: "2026-01-12"

scope:
  level: "project"
  priority: 50

compatibility:
  claude_code_min_version: "2026.01.0"
  requires_restart: false
---`;
}

// 获取中文显示名称
function getDisplayName(name) {
  const displayNames = {
    'product-manager': '产品经理',
    'ui-ux-designer': 'UI/UX 设计师',
    'backend-architect': '后端架构师',
    'backend-developer': '后端开发',
    'frontend-developer': '前端开发',
    'database-architect': '数据库架构师',
    'test-automator': '测试工程师',
    'security-auditor': '安全专家',
    'deployment-engineer': '部署工程师',
    'api-documenter': 'API 文档工程师',
    'code-reviewer': '代码审查工程师',
    'performance-engineer': '性能工程师',
    'python-expert': 'Python 专家',
    'typescript-expert': 'TypeScript 专家',
    'javascript-developer': 'JavaScript 开发',
    'golang-expert': 'Go 专家',
    'java-developer': 'Java 开发',
    'ai-engineer': 'AI 工程师',
    'data-engineer': '数据工程师',
    'research-orchestrator': '研究协调器',
    'academic-researcher': '学术研究员',
    'mobile-developer': '移动开发',
    'ios-developer': 'iOS 开发',
    'database-optimizer': '数据库优化专家',
    'sql-expert': 'SQL 专家',
    'architect-review': '架构审查',
    'legacy-modernizer': '遗留代码现代化',
    'devops-troubleshooter': 'DevOps 故障排查',
    'cloud-architect': '云架构师',
    'incident-responder': '生产事故处理',
    'ml-engineer': '机器学习工程师',
    'mlops-engineer': 'MLOps 工程师',
    'data-scientist': '数据科学家',
    'data-analyst': '数据分析师',
    'comprehensive-researcher': '综合研究员',
    'technical-researcher': '技术研究员',
    'market-research-analyst': '市场研究分析师',
    'search-specialist': '搜索专家',
    'network-engineer': '网络工程师',
    'debugger': '调试专家',
    'error-detective': '错误侦探',
    'directus-developer': 'Directus 开发',
    'drupal-developer': 'Drupal 开发',
    'wordpress-developer': 'WordPress 开发',
    'command-expert': 'CLI 专家',
    'blockchain-developer': '区块链开发',
    'crypto-trader': '加密货币交易系统',
    'arbitrage-bot': '套利机器人',
    'cpp-engineer': 'C++ 工程师',
    'c-developer': 'C 语言专家',
    'php-developer': 'PHP 开发',
    'ruby-expert': 'Ruby 专家',
    'rust-expert': 'Rust 专家',
    'graphql-architect': 'GraphQL 架构师',
    'database-admin': '数据库管理员',
    'nextjs-developer': 'Next.js 开发',
    'react-performance-optimization': 'React 性能优化',
    'accessibility-specialist': '无障碍专家',
    'agent-expert': 'Agent 专家',
    'audio-quality-controller': '音频质量控制',
    'business-analyst': '业务分析师',
    'github-actions-runner': 'GitHub Actions 专家',
    'terraform-specialist': 'Terraform 专家',
    'windows-fullstack-deploy': 'Windows 全栈部署',
    'db-deploy': '数据库部署专家',
    'deployment-test': '部署测试',
    'auto-error-resolver': '自动错误解析器',
    'code-architecture-reviewer': '代码架构审查',
    'code-refactor-master': '代码重构大师',
    'web-research-specialist': '网络搜索专家',
    'documentation-architect': '文档架构师',
    'frontend-error-fixer': '前端错误修复',
    'plan-reviewer': '计划审查员',
    'refactor-planner': '重构规划师',
    'prompt-engineer': 'Prompt 优化专家'
  };
  return displayNames[name] || name;
}

// 生成关键词
function generateKeywords(name) {
  const keywords = [];
  const parts = name.split('-');
  keywords.push(...parts);

  // 添加相关关键词
  if (name.includes('architect')) {
    keywords.push('架构', '设计', '技术选型');
  }
  if (name.includes('developer')) {
    keywords.push('开发', '实现', '代码');
  }
  if (name.includes('test')) {
    keywords.push('测试', '质量', '验证');
  }

  return keywords.map(k => `"${k}"`).join('\n    ');
}

// 生成标签
function generateTags(name) {
  const tags = [];
  const parts = name.split('-');
  tags.push(...parts);

  // 添加类别标签
  if (name.includes('architect')) tags.push('架构');
  if (name.includes('developer')) tags.push('开发');
  if (name.includes('test')) tags.push('测试');
  if (name.includes('database')) tags.push('数据库');
  if (name.includes('ai') || name.includes('ml') || name.includes('data')) tags.push('AI');
  if (name.includes('security')) tags.push('安全');
  if (name.includes('deploy')) tags.push('部署');

  return tags.map(t => `"${t}"`).join('\n    ');
}

// 升级单个 Agent 文件
function upgradeAgentFile(filePath) {
  const content = fs.readFileSync(filePath, 'utf8');
  const lines = content.split('\n');

  // 找到第二个 --- （YAML 结束）
  let yamlEnd = -1;
  for (let i = 1; i < lines.length; i++) {
    if (lines[i].trim() === '---') {
      yamlEnd = i;
      break;
    }
  }

  if (yamlEnd === -1) {
    console.log(`⚠️  跳过（无 YAML）: ${filePath}`);
    return false;
  }

  // 解析现有 YAML
  const existingYAML = lines.slice(0, yamlEnd).join('\n');
  const nameMatch = existingYAML.match(/name:\s*(.+)/);
  const descMatch = existingYAML.match(/description:\s*(.+)/);
  const categoryMatch = existingYAML.match(/category:\s*(.+)/);

  const name = nameMatch ? nameMatch[1].trim() : path.basename(filePath, '.md');
  const description = descMatch ? descMatch[1].trim() : `Specialist agent for ${name}`;
  const category = categoryMatch ? categoryMatch[1].trim() : categoryMap[name] || 'other';

  // 生成新的 YAML
  const newYAML = generate2026YAML(name, description, category);

  // 组合新文件
  const newContent = newYAML + '\n' + lines.slice(yamlEnd + 1).join('\n');

  // 写入文件
  fs.writeFileSync(filePath, newContent, 'utf8');
  console.log(`✅ 升级完成: ${filePath}`);
  return true;
}

// 主函数
function main() {
  console.log('🚀 开始批量升级 Agent 配置文件...\n');

  // 创建备份目录
  if (!fs.existsSync(backupDir)) {
    fs.mkdirSync(backupDir, { recursive: true });
  }

  // 备份 agents 目录
  console.log('📦 备份现有文件...');
  const { execSync } = require('child_process');
  try {
    execSync(`xcopy "${agentsDir}" "${backupDir}" /E /I /Y`, { windows: true });
    console.log('✅ 备份完成\n');
  } catch (e) {
    console.log('⚠️  备份失败，继续执行...\n');
  }

  // 获取所有 agent 文件
  const files = fs.readdirSync(agentsDir).filter(f => f.endsWith('.md'));

  console.log(`📝 找到 ${files.length} 个 Agent 文件\n`);

  // 升级每个文件
  let successCount = 0;
  let skipCount = 0;

  for (const file of files) {
    const filePath = path.join(agentsDir, file);
    const result = upgradeAgentFile(filePath);
    if (result) {
      successCount++;
    } else {
      skipCount++;
    }
  }

  console.log(`\n✨ 升级完成！`);
  console.log(`   成功: ${successCount}`);
  console.log(`   跳过: ${skipCount}`);
  console.log(`   总计: ${files.length}`);
}

// 运行
if (require.main === module) {
  main();
}

module.exports = { upgradeAgentFile, generate2026YAML };
