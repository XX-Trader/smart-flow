import os
import re
from pathlib import Path

agents_dir = Path(r"d:\学习资料\量化交易\my-plugins\smart-flow\agents")
agent_files = list(agents_dir.rglob("*.md"))

agents_info = []

for file_path in agent_files:
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()

        # 提取标题 (第一个 # 开头的行)
        title_match = re.search(r'^# (.+)', content, re.MULTILINE)
        title = title_match.group(1) if title_match else "无标题"

        # 提取描述 (在 ** 之后的内容)
        desc_match = re.search(r'\*\*(.+?)\*\*', content)
        description = desc_match.group(1) if desc_match else "无描述"

        # 提取关键词/角色
        role_match = re.search(r'作为(.+?)，', content)
        role = role_match.group(1) if role_match else ""

        agents_info.append({
            'file': file_path.name,
            'relative_path': str(file_path.relative_to(agents_dir)),
            'title': title.strip(),
            'description': description.strip(),
            'role': role.strip(),
            'content_length': len(content)
        })
    except Exception as e:
        print(f"Error reading {file_path}: {e}")

# 按文件名排序
agents_info.sort(key=lambda x: x['file'])

# 输出结果
print(f"总共读取了 {len(agents_info)} 个 agent 文件\n")
print("="*100)

for agent in agents_info:
    print(f"\n文件: {agent['file']}")
    print(f"标题: {agent['title']}")
    print(f"描述: {agent['description'][:100]}..." if len(agent['description']) > 100 else f"描述: {agent['description']}")
    if agent['role']:
        print(f"角色: {agent['role']}")
    print("-"*100)
