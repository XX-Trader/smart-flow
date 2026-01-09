#!/usr/bin/env node
/**
 * Smart Flow Auto-Trigger Hook
 *
 * 自动检测用户输入，判断是否应该启动 Smart Flow 工作流
 * 当用户输入包含以下特征时自动触发：
 * 1. 关键词匹配（如"新增"、"开发"、"实现"等）
 * 2. 意图模式匹配（如"帮我做个..."）
 * 3. 需求描述不明确（字数少于50字且包含模糊词汇）
 */

import { readFileSync } from 'fs';
import { join } from 'path';

interface HookInput {
    session_id: string;
    transcript_path: string;
    cwd: string;
    permission_mode: string;
    prompt: string;
}

interface TriggerConfig {
    keywords: string[];
    intentPatterns: string[];
    vagueTerms: string[];
    minLength: number;
    skipWhenExplicit: string[];
}

async function main() {
    try {
        // Read input from stdin
        const input = readFileSync(0, 'utf-8');
        const data: HookInput = JSON.parse(input);
        const prompt = data.prompt.trim();

        // Load trigger configuration
        const projectDir = process.env.CLAUDE_PROJECT_DIR || process.cwd();
        const rulesPath = join(projectDir, 'smart-flow', '.claude', 'smart-flow-rules.json');

        let config: TriggerConfig;
        try {
            const rulesData = JSON.parse(readFileSync(rulesPath, 'utf-8'));
            config = rulesData.autoTrigger;
        } catch {
            // Default configuration if file doesn't exist
            config = {
                keywords: ['新增', '开发', '实现', '制作', '创建', '功能', 'build', 'develop', 'implement', 'create', 'feature'],
                intentPatterns: [
                    '(帮我|帮我做个|做一个|做一个功能).{0,50}',
                    '(新增|开发|实现|制作|创建).{0,30}(功能|模块|页面|接口)',
                ],
                vagueTerms: ['大概', '可能', '应该', '像', '好像'],
                minLength: 50,
                skipWhenExplicit: ['/smart-flow', '/sf', 'smart-flow']
            };
        }

        // Check if user explicitly wants to skip auto-trigger
        const shouldSkip = config.skipWhenExplicit.some(term => prompt.toLowerCase().includes(term.toLowerCase()));
        if (shouldSkip) {
            process.exit(0);
        }

        // Check trigger conditions
        let shouldTrigger = false;
        let triggerReason = '';

        const promptLower = prompt.toLowerCase();

        // 1. Keyword matching
        const keywordMatch = config.keywords.some(kw => promptLower.includes(kw.toLowerCase()));
        if (keywordMatch) {
            shouldTrigger = true;
            triggerReason = '检测到功能开发关键词';
        }

        // 2. Intent pattern matching
        if (!shouldTrigger && config.intentPatterns) {
            const intentMatch = config.intentPatterns.some(pattern => {
                const regex = new RegExp(pattern, 'i');
                return regex.test(prompt);
            });
            if (intentMatch) {
                shouldTrigger = true;
                triggerReason = '检测到功能开发意图';
            }
        }

        // 3. Vague/short prompt detection
        if (!shouldTrigger && prompt.length < config.minLength) {
            const hasVagueTerm = config.vagueTerms.some(term => prompt.includes(term));
            if (hasVagueTerm) {
                shouldTrigger = true;
                triggerReason = '需求描述不明确，建议澄清';
            }
        }

        // Generate output if trigger conditions met
        if (shouldTrigger) {
            let output = '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n';
            output += '🚀 SMART FLOW 自动触发检测\n';
            output += '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n';
            output += `检测原因: ${triggerReason}\n\n`;
            output += '建议操作: 使用 smart-workflow 技能启动完整开发流程\n';
            output += '\n';
            output += 'Smart Flow 将自动执行:\n';
            output += '  1️⃣ 需求澄清 - 明确功能目标和约束\n';
            output += '  2️⃣ 任务分解 - 识别需要的专业领域\n';
            output += '  3️⃣ 并行执行 - 同时调用多个专业 Agent\n';
            output += '  4️⃣ 结果整合 - 生成完整报告和代码\n';
            output += '  5️⃣ 测试修改 - 循环直到测试通过\n';
            output += '\n';
            output += '💡 如需手动启动: /smart-flow 或 /sf\n';
            output += '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n';

            console.log(output);
        }

        process.exit(0);
    } catch (err) {
        // Silent fail - don't block normal operation
        process.exit(0);
    }
}

main().catch(err => {
    console.error('Uncaught error:', err);
    process.exit(0);
});
