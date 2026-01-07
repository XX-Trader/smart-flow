# 其他领域类 Agent 输出模板

> **适用Agent**: network-engineer, performance-engineer, blockchain-developer, crypto-trader, arbitrage-bot, crypto-analyst, crypto-risk-manager, defi-strategist, mcp-expert, mcp-server-architect, mcp-security-auditor, mcp-testing-engineer, command-expert, dx-optimizer, legacy-modernizer, 内容管理相关, 商业分析相关, 客户支持相关, 法律顾问相关, podcast相关, OCR相关, 文本处理相关, agent-expert, task-decomposition-expert（30个）
> **版本**: v2.1.0
> **更新**: 2025-01-07

---

## 模板说明

本模板适用于**其他领域类** Agent，涵盖以下专业领域：

### 网络与性能（2个）
- network-engineer（网络工程师）
- performance-engineer（性能工程师）

### 区块链与加密货币（6个）
- blockchain-developer（区块链开发）
- crypto-trader（加密货币交易）
- arbitrage-bot（套利机器人）
- crypto-analyst（加密货币分析）
- crypto-risk-manager（加密货币风险管理）
- defi-strategist（DeFi策略）

### MCP相关（4个）
- mcp-expert（MCP专家）
- mcp-server-architect（MCP服务器架构）
- mcp-security-auditor（MCP安全审计）
- mcp-testing-engineer（MCP测试工程师）

### 开发工具与优化（3个）
- command-expert（CLI专家）
- dx-optimizer（开发者体验优化）
- legacy-modernizer（遗留代码现代化）

### 内容与媒体（8个）
- content-manager（内容管理）
- podcast-transcriber（播客转录）
- podcast-metadata-specialist（播客元数据）
- podcast-trend-scout（播客趋势侦察）
- social-media-copywriter（社交媒体文案）
- social-media-clip-creator（社交媒体剪辑）

### 文本处理与OCR（5个）
- ocr-quality-assurance（OCR质量保证）
- ocr-grammar-fixer（OCR语法修复）
- timestamp-precision-specialist（时间戳精度）
- text-comparison-validator（文本对比验证）
- visual-analysis-ocr（视觉分析OCR）

### 其他专业（2个）
- agent-expert（Agent专家）
- task-decomposition-expert（任务分解专家）

---

## 通用输出模板

### 1. 任务概述
```markdown
## 任务概述

**任务目标**: [清晰描述要达成的目标]

**任务范围**:
- 包含: [明确包含的内容]
- 不包含: [明确不包含的内容]

**成功标准**:
- [ ] [可衡量的标准1]
- [ ] [可衡量的标准2]

**约束条件**:
- 技术约束: [列出技术限制]
- 资源约束: [列出资源限制]
```

### 2. 分析与诊断
```markdown
## 分析与诊断

### 2.1 现状分析
**当前状态**: [描述当前情况]

**关键问题**:
1. [问题1]: [描述]
2. [问题2]: [描述]

### 2.2 根因分析
**根本原因**: [描述]

**影响评估**:
- 影响范围: [描述]
- 影响程度: [高/中/低]

### 2.3 方案探索
**推荐方案**: [方案A/B/混合方案]

**选择理由**:
1. [理由1]
2. [理由2]
```

### 3. 实施方案
```markdown
## 实施方案

### 3.1 技术方案
**技术栈**:
- [技术1]: [版本/说明]
- [技术2]: [版本/说明]

**架构设计**:
```
[架构图或文字描述]
```

### 3.2 实施步骤
**阶段1: [阶段名称]**
- [ ] 步骤1: [描述] - 预估: [Xh]
- [ ] 步骤2: [描述] - 预估: [Xh]

**阶段2: [阶段名称]**
- [ ] 步骤1: [描述] - 预估: [Xh]
```

### 4. 验证与测试
```markdown
## 验证与测试

### 4.1 验证方法
**测试用例**:
1. **[测试用例1]**
   - 测试目标: [描述]
   - 预期结果: [描述]
   - 实际结果: [描述]
   - 状态: [通过/失败]

### 4.2 性能验证
**性能指标**:
- [指标1]: [目标值] - [实际值] - [状态]
```

### 5. 部署与交付
```markdown
## 部署与交付

### 5.1 部署方案
**部署步骤**:
1. [步骤1]: [描述]
2. [步骤2]: [描述]

**回滚方案**:
- [步骤1]: [描述]

### 5.2 监控与维护
**监控指标**:
- [指标1]: [阈值]

**告警机制**:
- [告警条件]: [描述]

### 5.3 交付清单
**代码交付**:
- [ ] 源代码: [仓库地址]
- [ ] 文档: [文档地址]
```

### 6. 建议与后续
```markdown
## 建议与后续

### 6.1 优化建议
**短期优化**（1-2周）:
- [ ] [优化项1]

**中期优化**（1-2月）:
- [ ] [优化项1]

### 6.2 后续步骤
1. **[步骤1]**: [描述] - 时间: [日期]

### 6.3 风险提示
- **风险1**: [描述风险及应对措施]

### 6.4 经验总结
**成功经验**:
1. [经验1]
```

---

## 🔧 重点定制模板

### Template A: Network Engineer（网络工程师）

**适用场景**: 网络架构设计、网络故障排查、网络性能优化、网络安全配置

```markdown
# 🌐 网络工程方案

## 1. 需求分析
### 1.1 业务需求
**应用场景**: [描述业务场景]
**用户规模**: [数量/增长趋势]
**性能要求**: [延迟/带宽/可用性]

### 1.2 技术需求
**网络规模**: [节点数/子网数]
**连接类型**: [LAN/WAN/VPN/互联网]
**安全要求**: [防火墙/加密/隔离]

## 2. 网络设计
### 2.1 拓扑设计
```
[网络拓扑图]
[互联网] ↔ [防火墙] ↔ [DMZ] ↔ [核心交换机] ↔ [接入交换机] ↔ [终端]
```

**拓扑说明**:
- 核心层: [功能说明]
- 汇聚层: [功能说明]
- 接入层: [功能说明]

### 2.2 IP地址规划
**VLAN划分**:
| VLAN | 名称 | IP段 | 用途 |
|------|------|------|------|
| VLAN 10 | [名称] | [X.X.X.X/X] | [用途] |

### 2.3 路由设计
**路由协议**:
- 内部路由: [OSPF/静态]
- 外部路由: [BGP/静态]

### 2.4 网络服务配置
**DHCP**:
- 服务器: [主/备]
- 作用域: [范围]

**DNS**:
- 服务器: [主/备]

**NAT**:
- 类型: [PAT/NAT]
- 规则: [描述]

## 3. 网络安全
### 3.1 安全架构
**安全分区**:
- [DMZ区]: [可访问服务]
- [内部区]: [隔离策略]

### 3.2 防火墙配置
**规则策略**:
| 源 | 目标 | 服务 | 动作 | 说明 |
|-----|------|------|------|------|
| [源] | [目标] | [服务] | [允许/拒绝] | [说明] |

**VPN配置**:
- 类型: [IPsec/SSL]
- 认证: [方式]

### 3.3 入侵检测/防御
- IDS/IPS: [部署位置]
- 规则集: [描述]

## 4. 网络优化
### 4.1 性能优化
**QoS策略**:
- [业务1]: [优先级]

**负载均衡**:
- 算法: [轮询/最小连接]
- 健康检查: [方法]

### 4.2 高可用设计
**设备冗余**:
- [设备类型]: [主备] - [切换时间]

**链路冗余**:
- [链路类型]: [主备] - [切换协议]

## 5. 监控与运维
### 5.1 监控方案
**监控工具**: [Zabbix/Nagios/Prometheus]

**监控指标**:
- 设备状态: [CPU/内存/流量]
- 接口状态: [up/down/错误率]

### 5.2 告警配置
| 告警项 | 阈值 | 级别 | 通知方式 |
|--------|------|------|----------|
| [指标] | [值] | [严重/警告] | [邮件/短信] |

### 5.3 日志管理
- 日志收集: [Syslog/SNMP]
- 存储位置: [路径]
- 保留时间: [天数]

## 6. 故障排查（如适用）
### 6.1 问题描述
**故障现象**: [描述]
**影响范围**: [描述]
**发生时间**: [时间]

### 6.2 排查过程
**排查步骤**:
1. [步骤1]: [操作] - [结果]

**诊断工具**:
- ping: [结果]
- traceroute: [结果]

### 6.3 根因分析
**根本原因**: [描述]

### 6.4 解决方案
**临时方案**: [描述]
**永久方案**: [描述]

**预防措施**:
- [措施1]

## 7. 实施计划
### 7.1 实施阶段
**阶段1: 准备**（X天）
- [ ] 任务1: [描述]

**阶段2: 配置**（X天）
- [ ] 任务1: [描述]

### 7.2 回滚方案
**回滚触发条件**: [描述]
**回滚步骤**: [描述]

## 8. 交付物
- [ ] 网络拓扑图
- [ ] 配置文档
- [ ] IP地址表
- [ ] 防火墙规则表
- [ ] 运维手册

---
**质量评分**: [X]/100
**生成时间**: [timestamp]
**Agent**: network-engineer
```

---

### Template B: Blockchain Developer（区块链开发）

**适用场景**: 智能合约开发、DApp开发、区块链集成、Web3应用

```markdown
# 🔗 区块链开发方案

## 1. 需求分析
### 1.1 业务需求
**应用场景**: [DeFi/NFT/游戏/供应链]
**核心功能**: [列出核心功能]
**交易频率**: [预估TPS]

### 1.2 技术需求
**区块链选择**: [Ethereum/Polygon/BSC/Solana]
**智能合约语言**: [Solidity/Rust/Vyper]
**前端框架**: [React/Vue]

## 2. 系统架构
### 2.1 整体架构
```
[用户] ↔ [Web前端] ↔ [智能合约] ↔ [区块链网络]
              ↓
         [后端服务] ↔ [IPFS/数据库]
```

### 2.2 智能合约架构
**合约清单**:
| 合约名称 | 功能 | 状态 | 说明 |
|---------|------|------|------|
| [合约1] | [功能] | [开发/测试/部署] | [说明] |

## 3. 智能合约设计
### 3.1 核心合约
**合约名称**: [名称]

**功能**:
- [功能1]: [描述]

**状态变量**:
```solidity
// [变量名]: [类型] - [说明]
```

**核心函数**:
```solidity
// [函数名]: [功能说明]
function function_name() public {
    // 实现
}
```

**事件**:
```solidity
event EventName(address indexed user, uint256 value);
```

### 3.2 安全设计
**访问控制**:
- [ ] onlyOwner: [说明]

**重入攻击防护**:
- [ ] Checks-Effects-Interactions
- [ ] ReentrancyGuard

**溢出防护**:
- [ ] Solidity 0.8+ 自动检查

### 3.3 Gas优化
**优化策略**:
- [ ] 循环优化: [描述]
- [ ] 存储优化: [描述]

**预估Gas消耗**:
- [函数1]: [预估Gas]

## 4. 前端集成
### 4.1 Web3集成
**钱包连接**:
- 支持钱包: [MetaMask/WalletConnect]
- 连接库: [Web3.js/Ethers.js]

**合约交互**:
```javascript
// 示例: 调用合约函数
const contract = new ethers.Contract(address, abi, signer);
const result = await contract.function_name(params);
```

### 4.2 用户体验
**交易流程**:
1. 用户触发: [描述]
2. 签名确认: [描述]
3. 交易提交: [描述]

**错误处理**:
- 用户拒绝: [处理方式]

## 5. 测试策略
### 5.1 单元测试
**测试框架**: [Hardhat/Foundry]

**测试覆盖**:
- [ ] 正常流程
- [ ] 边界条件
- [ ] 异常情况

### 5.2 安全审计
**审计工具**:
- [ ] Slither
- [ ] Mythril

**第三方审计**: [公司/日期]

## 6. 部署方案
### 6.1 部署网络
**测试网**:
- 网络: [Goerli/Sepolia]

**主网**:
- 网络: [名称]

### 6.2 部署流程
**部署脚本**:
```javascript
// 部署脚本示例
```

**合约验证**:
- 验证工具: [Etherscan]
- 验证状态: [已验证]

## 7. 运维与监控
### 7.1 监控方案
**链上监控**:
- 交易监控: [工具/方法]
- 事件监听: [工具/方法]

### 7.2 升级策略
**代理合约**:
- 使用: [是/否]
- 模式: [Transparent/UUPS]

## 8. 成本估算
### 8.1 开发成本
- 智能合约开发: [X人天]
- 前端开发: [X人天]
- 测试: [X人天]
- 审计: [X ETH/USD]

### 8.2 部署成本
- 合约部署Gas: [预估ETH]

### 8.3 运营成本
- 节点费用: [月/年]

## 9. 风险管理
### 9.1 技术风险
| 风险 | 概率 | 影响 | 缓解措施 |
|-----|------|------|----------|
| [风险] | [高/中/低] | [高/中/低] | [措施] |

### 9.2 业务风险
- 监管风险: [描述]
- 市场风险: [描述]

## 10. 交付物
- [ ] 智能合约源码
- [ ] 技术文档
- [ ] 用户手册
- [ ] 部署脚本
- [ ] 测试报告
- [ ] 审计报告

---
**质量评分**: [X]/100
**生成时间**: [timestamp]
**Agent**: blockchain-developer
```

---

### Template C: MCP Expert（MCP专家）

**适用场景**: MCP服务器开发、MCP集成、MCP优化、MCP部署

```markdown
# 🔌 MCP开发与集成方案

## 1. 需求分析
### 1.1 功能需求
**MCP服务器用途**: [描述具体用途]
**核心功能**:
- [功能1]: [描述]

**目标应用**: [Claude/ChatGPT/其他]

### 1.2 技术需求
**实现语言**: [Python/Node.js/TypeScript]
**MCP SDK版本**: [版本号]
**传输协议**: [STDIO/SSE]

## 2. MCP服务器设计
### 2.1 服务器架构
```
[Claude] ↔ [MCP Client] ↔ [MCP Server] ↔ [外部服务/API]
                                      ↓
                                 [数据存储]
```

### 2.2 Tools设计
**工具清单**:
| 工具名称 | 功能描述 | 输入参数 | 返回值 | 说明 |
|---------|---------|---------|--------|------|
| [tool1] | [描述] | [参数] | [返回] | [说明] |

**工具详情**:

#### Tool 1: [工具名称]
**功能**: [详细描述]

**输入Schema**:
```json
{
  "type": "object",
  "properties": {
    "param1": {
      "type": "string",
      "description": "参数说明"
    }
  },
  "required": ["param1"]
}
```

**输出Schema**:
```json
{
  "type": "object",
  "properties": {
    "result": {
      "type": "string"
    }
  }
}
```

**实现逻辑**:
```python
async def handle_tool_call(params: dict) -> dict:
    # 实现逻辑
    return {"result": "..."}
```

### 2.3 Resources设计
**资源清单**:
| 资源名称 | URI模板 | 描述 | 更新频率 |
|---------|---------|------|----------|
| [resource1] | [uri] | [描述] | [实时/定时] |

## 3. 技术实现
### 3.1 项目结构
```
mcp-server/
├── src/
│   ├── server.py          # MCP服务器主文件
│   ├── tools/             # 工具实现
│   ├── resources/         # 资源实现
│   └── utils/             # 工具函数
├── tests/                 # 测试
└── pyproject.toml         # 依赖配置
```

### 3.2 核心代码
**服务器初始化**:
```python
# Python示例（FastMCP）
from mcp import FastMCP

mcp = FastMCP("server-name")

@mcp.tool()
async def tool_name(param1: str) -> str:
    """工具描述"""
    return result

if __name__ == "__main__":
    mcp.run()
```

**工具实现**:
```python
@mcp.tool()
async def specific_tool(
    param1: str,
    param2: int
) -> dict:
    """工具详细描述"""
    try:
        result = await perform_operation(param1, param2)
        return {
            "success": True,
            "data": result
        }
    except Exception as e:
        return {
            "success": False,
            "error": str(e)
        }
```

### 3.3 错误处理
**错误类型**:
- [ ] 参数验证错误
- [ ] 网络错误

**错误处理策略**:
```python
async def handle_error(error: Exception) -> dict:
    return {
        "success": False,
        "error": str(e)
    }
```

## 4. 数据集成
### 4.1 外部API集成
**API配置**:
- 基础URL: [URL]
- 认证方式: [API Key/OAuth]

**API调用示例**:
```python
import httpx

async def call_external_api(params: dict) -> dict:
    async with httpx.AsyncClient() as client:
        response = await client.get(
            "https://api.example.com/endpoint",
            params=params
        )
        return response.json()
```

## 5. 测试
### 5.1 单元测试
**测试框架**: [pytest/jest]

**测试用例**:
```python
@pytest.mark.asyncio
async def test_tool_name():
    result = await tool_name("test_param")
    assert result["success"] is True
```

**测试覆盖**:
- [ ] 所有工具函数
- [ ] 错误处理

### 5.2 MCP协议测试
**工具调用测试**:
- 调用格式验证
- 参数验证

## 6. 部署
### 6.1 本地部署
**安装步骤**:
```bash
# 1. 克隆仓库
git clone [repo-url]

# 2. 安装依赖
pip install -r requirements.txt

# 3. 运行服务器
python src/server.py
```

**Claude Desktop配置**:
```json
{
  "mcpServers": {
    "server-name": {
      "command": "python",
      "args": ["/path/to/server.py"]
    }
  }
}
```

### 6.2 远程部署（SSE）
**部署方案**: [Docker/云服务]

**Claude Desktop配置（SSE）**:
```json
{
  "mcpServers": {
    "server-name": {
      "url": "https://your-server.com/sse"
    }
  }
}
```

## 7. 性能优化
### 7.1 缓存策略
- [ ] 内存缓存: [TTL]
- [ ] 结果缓存: [策略]

### 7.2 并发处理
- [ ] 异步I/O
- [ ] 连接池

### 7.3 性能指标
- 响应时间: [目标]
- 吞吐量: [目标]

## 8. 安全
### 8.1 认证授权
- API密钥管理: [策略]
- 访问控制: [策略]

### 8.2 数据安全
- 传输加密: [HTTPS/TLS]
- 数据脱敏: [策略]

## 9. 监控与日志
### 9.1 日志记录
**日志级别**: [DEBUG/INFO/WARNING/ERROR]

**日志内容**:
- 工具调用: [参数/结果]
- 错误信息: [详情]

### 9.2 监控指标
- 调用次数: [计数]
- 错误率: [百分比]
- 响应时间: [平均/P95]

## 10. 文档
### 10.1 技术文档
- [ ] 架构设计
- [ ] API文档

### 10.2 用户文档
- [ ] 安装指南
- [ ] 使用说明

## 11. 交付物
- [ ] 源代码
- [ ] 技术文档
- [ ] 用户文档
- [ ] 测试报告
- [ ] 部署脚本

---
**质量评分**: [X]/100
**生成时间**: [timestamp]
**Agent**: mcp-expert
```

---

## 🎨 其他领域快速模板

### Template D: Performance Engineer（性能工程师）

```markdown
# ⚡ 性能优化方案

## 1. 性能分析
### 1.1 现状评估
**当前性能指标**:
- 响应时间: [P50/P95/P99]
- 吞吐量: [QPS/TPS]

**性能瓶颈**:
- [瓶颈1]: [描述]

### 1.2 性能目标
**优化目标**:
- 响应时间: [目标值]
- 吞吐量: [目标值]

## 2. 性能剖析
### 2.1 剖析工具
- CPU: [pprof/perf]
- 内存: [valgrind/heap]

### 2.2 热点分析
**热点函数**:
| 函数名 | 耗时 | 调用次数 | 占比 |
|--------|------|----------|------|
| [func1] | [时间] | [次数] | [%] |

## 3. 优化方案
### 3.1 优化策略
**代码级优化**:
- [ ] 算法优化: [描述]
- [ ] 数据结构: [描述]

**架构级优化**:
- [ ] 异步处理: [描述]

### 3.2 实施方案
**优化清单**:
1. [优化项1]: [预估收益] - [工作量]

## 4. 验证
**对比数据**:
| 指标 | 优化前 | 优化后 | 提升 |
|-----|-------|-------|------|
| [指标] | [值] | [值] | [%] |

---
**质量评分**: [X]/100
**Agent**: performance-engineer
```

---

### Template E: Crypto Trader（加密货币交易）

```markdown
# 💰 加密货币交易策略

## 1. 策略概述
**策略类型**: [趋势跟踪/套利/做市]
**交易标的**: [BTC/ETH]
**时间周期**: [分钟/小时/日]
**风险等级**: [高/中/低]

## 2. 策略设计
### 2.1 入场条件
- [条件1]: [描述]

### 2.2 出场条件
- 止盈: [描述]
- 止损: [描述]

### 2.3 仓位管理
- 单笔仓位: [%]
- 最大仓位: [%]

## 3. 回测分析
### 3.1 回测结果
**收益指标**:
- 总收益率: [%]
- 最大回撤: [%]

**交易统计**:
- 交易次数: [X]
- 胜率: [%]

## 4. 风险控制
- 单笔最大亏损: [%]
- 日最大亏损: [%]

---
**质量评分**: [X]/100
**Agent**: crypto-trader
```

---

### Template F: Command Expert（CLI专家）

```markdown
# 💻 CLI工具开发方案

## 1. 需求分析
**工具用途**: [描述]
**目标用户**: [描述]
**核心功能**: [列出]

## 2. 设计
### 2.1 命令结构
```
tool [command] [subcommand] [options]

Commands:
  command1    描述
```

### 2.2 参数设计
**全局选项**:
- `--config`: 配置文件
- `--verbose`: 详细输出

## 3. 实现
### 3.1 框架选择
- Python: [Click/Cli]
- Node.js: [Commander]

### 3.2 核心功能
**示例代码**:
```python
import click

@click.command()
@click.option('--count', default=1)
def hello(count):
    click.echo(f'Hello!')

if __name__ == '__main__':
    hello()
```

## 4. 用户体验
- 颜色输出: [是/否]
- 进度条: [使用场景]
- 交互式输入: [使用场景]

## 5. 文档
- 帮助信息: [完整]
- 使用示例: [提供]

---
**质量评分**: [X]/100
**Agent**: command-expert
```

---

## 📝 通用格式规范

### 质量标准
1. **准确性**: 数据准确,结论有据
2. **完整性**: 覆盖所有关键点
3. **可读性**: 结构清晰,语言简洁
4. **可操作性**: 建议具体可执行
5. **专业性**: 术语准确,符合行业标准

### 评分系统
- **⭐⭐⭐⭐⭐**: 优秀 (90-100分)
- **⭐⭐⭐⭐**: 良好 (80-89分)
- **⭐⭐⭐**: 中等 (70-79分)
- **⭐⭐**: 较差 (60-69分)
- **⭐**: 很差 (<60分)

### 置信度标注
- **高**: 多个来源验证,数据一致
- **中**: 部分验证,存在不确定性
- **低**: 未验证,需谨慎对待

---

## 🔄 使用说明

### 在技能中引用模板

```markdown
## Agent 调用指令

调用 `network-engineer` agent 时，请遵循以下要求：

1. **输出格式**: 使用 `templates/agent-outputs/miscellaneous-template.md`
2. **重点章节**: 网络设计、安全配置、故障排查
3. **质量标准**: 输出质量评分 ≥90分
```

### 模板定制

根据具体Agent类型，选择相应的定制模板：
- **network-engineer**: 使用 Template A
- **blockchain-developer**: 使用 Template B
- **mcp-expert**: 使用 Template C
- **其他Agent**: 使用通用模板 + 快速模板

---

## 版本历史

### v2.1.0 (2025-01-07)
- ✅ 创建通用模板（覆盖30个Agent）
- ✅ 重点定制 network-engineer 模板
- ✅ 重点定制 blockchain-developer 模板
- ✅ 重点定制 mcp-expert 模板
- ✅ 提供其他领域快速模板
- ✅ 支持网络、区块链、MCP、CLI等多个专业领域

---

**最后更新**: 2025-01-07
**维护者**: Smart Flow Team
