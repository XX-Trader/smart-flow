#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
技能触发关键字批量优化工具

用于批量扫描和优化 SKILL.md 文件中的触发关键字配置
"""

import os
import re
from pathlib import Path
from typing import Dict, List, Optional

class TriggerOptimizer:
    """触发关键字优化器"""

    def __init__(self, root_dir: str = "."):
        self.root_dir = Path(root_dir)
        self.results = []

    def scan_skills(self, skills_dir: str) -> List[Path]:
        """扫描所有 SKILL.md 文件"""
        skills_path = self.root_dir / skills_dir
        return list(skills_path.glob("*/SKILL.md"))

    def analyze_trigger_quality(self, skill_file: Path) -> Dict:
        """分析触发关键字质量"""
        with open(skill_file, 'r', encoding='utf-8') as f:
            content = f.read()

        # 提取 triggers 部分
        triggers_match = re.search(r'triggers:(.*?)(?=\n\w+:|\Z)', content, re.DOTALL)

        if not triggers_match:
            return {
                "file": str(skill_file),
                "has_triggers": False,
                "issue": "Missing triggers section"
            }

        triggers_content = triggers_match.group(1)

        # 提取 keywords
        keywords_match = re.search(r'keywords:\s*\n((?:\s*-\s*.+\n)+)', triggers_content)

        if not keywords_match:
            return {
                "file": str(skill_file),
                "has_triggers": True,
                "has_keywords": False,
                "issue": "Missing keywords"
            }

        keywords_text = keywords_match.group(1)
        keywords = re.findall(r'-\s*"([^"]+)"', keywords_text)

        # 提取 auto_trigger 和 confidence_threshold
        auto_trigger = re.search(r'auto_trigger:\s*(true|false)', triggers_content)
        confidence = re.search(r'confidence_threshold:\s*([\d.]+)', triggers_content)

        # 质量评分
        score = 0
        issues = []

        # 评分标准
        if len(keywords) >= 10:
            score += 3
        elif len(keywords) >= 5:
            score += 2
        elif len(keywords) >= 2:
            score += 1
        else:
            issues.append("触发关键字太少（建议至少10个）")

        # 检查中英文
        has_chinese = any(re.search(r'[\u4e00-\u9fff]', kw) for kw in keywords)
        has_english = any(re.search(r'[a-zA-Z]', kw) for kw in keywords)

        if has_chinese and has_english:
            score += 2
        elif has_chinese or has_english:
            score += 1
            issues.append("建议添加中英文双语触发词")
        else:
            issues.append("缺少中英文触发词")

        # 检查置信度
        if confidence:
            conf_value = float(confidence.group(1))
            if 0.6 <= conf_value <= 0.8:
                score += 2
            elif 0.5 <= conf_value < 0.6 or 0.8 < conf_value <= 0.9:
                score += 1
                issues.append(f"置信度阈值 {conf_value} 建议调整为 0.7")

        return {
            "file": str(skill_file),
            "has_triggers": True,
            "has_keywords": True,
            "keywords_count": len(keywords),
            "keywords": keywords,
            "has_chinese": has_chinese,
            "has_english": has_english,
            "auto_trigger": auto_trigger.group(1) if auto_trigger else None,
            "confidence": float(confidence.group(1)) if confidence else None,
            "score": score,
            "issues": issues
        }

    def generate_report(self, skills_dir: str = "skills-user") -> str:
        """生成优化报告"""
        skill_files = self.scan_skills(skills_dir)

        report_lines = [
            "# 技能触发关键字质量报告",
            f"\n> 扫描目录: {skills_dir}",
            f"> 扫描文件数: {len(skill_files)}",
            f"> 生成时间: {self._get_timestamp()}",
            "\n---\n"
        ]

        # 分析每个技能
        total_score = 0
        needs_optimization = []

        for skill_file in skill_files:
            result = self.analyze_trigger_quality(skill_file)
            self.results.append(result)
            total_score += result.get("score", 0)

            if result.get("issues"):
                needs_optimization.append(result)

        # 统计
        avg_score = total_score / len(skill_files) if skill_files else 0

        report_lines.extend([
            "## 📊 整体统计",
            f"\n- **平均质量得分**: {avg_score:.1f}/10",
            f"- **需要优化**: {len(needs_optimization)} 个技能",
            f"- **无需优化**: {len(skill_files) - len(needs_optimization)} 个技能",
            "\n---\n"
        ])

        # 详细问题列表
        if needs_optimization:
            report_lines.append("## ⚠️ 需要优化的技能\n")

            for result in needs_optimization:
                skill_name = Path(result["file"]).parent.name
                report_lines.append(f"### {skill_name}")
                report_lines.append(f"**文件**: `{result['file']}`")
                report_lines.append(f"**得分**: {result.get('score', 0)}/10")
                report_lines.append(f"\n**问题**:")

                for issue in result.get("issues", []):
                    report_lines.append(f"- ❌ {issue}")

                if result.get("keywords"):
                    report_lines.append(f"\n**当前触发关键字** ({len(result['keywords'])}个):")
                    for kw in result["keywords"]:
                        report_lines.append(f"  - `{kw}`")

                report_lines.append("\n---\n")

        # 优化建议
        report_lines.extend([
            "## 💡 优化建议",
            "\n1. **添加更多触发关键字**",
            "   - 至少 10-15 个触发关键字",
            "   - 包含中英文双语",
            "   - 添加场景化短语",
            "",
            "2. **调整置信度阈值**",
            "   - 一般技能: 0.7",
            "   - 核心技能: 0.8",
            "   - 辅助技能: 0.6",
            "",
            "3. **添加分类触发词**",
            "   - 核心关键字（2-3个）",
            "   - 动作动词（3-5个）",
            "   - 场景化短语（5-8个）",
            "   - 相关概念（3-5个）",
            "",
            "4. **参考模板**",
            "   - 查看 [TRIGGER_KEYWORDS_GUIDE.md](./TRIGGER_KEYWORDS_GUIDE.md)",
            "   - 使用标准模板进行优化",
            "\n---\n",
            "## 📚 相关资源",
            "\n- [触发关键字优化指南](./TRIGGER_KEYWORDS_GUIDE.md)",
            "- [TDD触发指南](./TDD_TRIGGER_GUIDE.md)",
            "- [CLAUDE.md](../CLAUDE.md)",
        ])

        return "\n".join(report_lines)

    def save_report(self, skills_dir: str = "skills-user", output_file: str = "docs/TRIGGER_OPTIMIZATION_REPORT.md"):
        """保存优化报告"""
        report = self.generate_report(skills_dir)

        output_path = self.root_dir / output_file
        output_path.parent.mkdir(parents=True, exist_ok=True)

        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(report)

        print(f"[OK] Report saved to: {output_path}")

        # 同时输出摘要
        print("\n[STATS] Optimization Summary:")
        needs_opt = sum(1 for r in self.results if r.get("issues"))
        print(f"  - Total skills: {len(self.results)}")
        print(f"  - Need optimization: {needs_opt}")
        print(f"  - Already good: {len(self.results) - needs_opt}")

    def _get_timestamp(self) -> str:
        """获取当前时间戳"""
        from datetime import datetime
        return datetime.now().strftime("%Y-%m-%d %H:%M:%S")


def main():
    """主函数"""
    import sys
    import io

    # 设置标准输出编码为 UTF-8
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')

    # 默认扫描用户技能目录
    skills_dir = sys.argv[1] if len(sys.argv) > 1 else "skills-user"
    output_file = sys.argv[2] if len(sys.argv) > 2 else "docs/TRIGGER_OPTIMIZATION_REPORT.md"

    print(f"[SCAN] Starting scan: {skills_dir}")

    optimizer = TriggerOptimizer()
    optimizer.save_report(skills_dir, output_file)

    print("\n[DONE] Scan complete!")


if __name__ == "__main__":
    main()
