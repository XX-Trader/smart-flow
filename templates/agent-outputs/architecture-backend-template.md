# 架构与后端类 Agent 输出模板

> **适用Agent**: backend-architect, database-architect, backend-developer, php-developer, ruby-expert, rails-expert, graphql-architect, database-optimizer, database-optimization, database-admin, sql-expert, laravel-vue-developer, directus-developer, drupal-developer, wordpress-developer（15个）
> **版本**: v2.1.0
> **更新**: 2025-01-07

---

## 模板说明

本模板适用于所有**架构与后端类** Agent，包括：
- 后端架构师
- 数据库架构师
- 后端开发工程师
- 数据库优化专家
- 各语言后端专家（PHP、Ruby、Laravel、Rails等）
- CMS后端开发（WordPress、Drupal、Directus）
- GraphQL架构师

---

## 通用输出模板

### 1. 任务概述
```markdown
## 任务概述

**任务目标**: [清晰描述要达成的技术目标]

**任务范围**:
- 包含: [明确包含的技术内容]
- 不包含: [明确不包含的内容]

**技术约束**:
- 技术栈: [列出技术栈]
- 性能要求: [性能指标]
- 安全要求: [安全标准]

**成功标准**:
- [ ] [可衡量的技术标准1]
- [ ] [可衡量的技术标准2]
- [ ] [可衡量的技术标准3]
```

### 2. 分析过程
```markdown
## 分析过程

### 2.1 现状分析
**当前架构**: [描述当前架构]

**技术债务**:
1. **[债务1]**: [描述] - [影响]
2. **[债务2]**: [描述] - [影响]

**性能瓶颈**:
- [瓶颈1]: [描述和影响]
- [瓶颈2]: [描述和影响]

### 2.2 方案探索
**技术选型**:
1. **方案A**: [技术栈/架构]
   - 优点: [列出优点]
   - 缺点: [列出缺点]
   - 适用场景: [说明]
   - 成本评估: [开发成本、运维成本]

2. **方案B**: [技术栈/架构]
   - 优点: [列出优点]
   - 缺点: [列出缺点]
   - 适用场景: [说明]
   - 成本评估: [开发成本、运维成本]

### 2.3 方案选择
**推荐方案**: [方案A/B/混合方案]

**选择理由**:
1. [技术理由1]
2. [业务理由2]
3. [成本理由3]

**风险评估**:
- [风险1]: [风险描述] - [缓解措施]
- [风险2]: [风险描述] - [缓解措施]

**迁移策略**:
- [步骤1]: [描述]
- [步骤2]: [描述]
- [步骤3]: [描述]
```

### 3. 详细方案
```markdown
## 详细方案

### 3.1 系统架构设计
#### 3.1.1 架构概览
```
[架构图 - 文字描述或ASCII图]
客户端 → [负载均衡] → [API网关] → [服务层] → [数据层]
```

#### 3.1.2 架构分层
- **接入层**: [职责和技术选型]
- **网关层**: [职责和技术选型]
- **服务层**: [职责和技术选型]
- **数据层**: [职责和技术选型]

#### 3.1.3 核心组件
1. **[组件名1]**
   - 职责: [描述职责]
   - 技术栈: [列出技术]
   - 接口: [主要接口]

2. **[组件名2]**
   - 职责: [描述职责]
   - 技术栈: [列出技术]
   - 接口: [主要接口]

### 3.2 API设计
#### 3.2.1 REST API设计
**资源命名**:
- GET /api/resources - [获取列表]
- GET /api/resources/:id - [获取详情]
- POST /api/resources - [创建资源]
- PUT /api/resources/:id - [更新资源]
- DELETE /api/resources/:id - [删除资源]

**请求/响应格式**:
```json
// 请求示例
{
  "field1": "value1",
  "field2": "value2"
}

// 响应示例
{
  "code": 200,
  "message": "success",
  "data": {
    "id": "123",
    "field1": "value1"
  }
}
```

**错误码设计**:
- 200: 成功
- 400: 请求参数错误
- 401: 未认证
- 403: 无权限
- 404: 资源不存在
- 500: 服务器错误

#### 3.2.2 GraphQL Schema设计（如适用）
```graphql
type Query {
  getUser(id: ID!): User
  getUsers(limit: Int, offset: Int): [User!]!
}

type Mutation {
  createUser(input: CreateUserInput!): User!
  updateUser(id: ID!, input: UpdateUserInput!): User!
  deleteUser(id: ID!): Boolean!
}

type User {
  id: ID!
  name: String!
  email: String!
  createdAt: DateTime!
}
```

### 3.3 数据库设计
#### 3.3.1 数据模型
**ER关系**:
```
[用户表] ──< [订单表] ──< [订单明细表]
   │
   └──< [地址表]
```

#### 3.3.2 表结构设计
**表名**: users
| 字段名 | 类型 | 约束 | 索引 | 说明 |
|--------|------|------|------|------|
| id | BIGINT | PK, AI | PRIMARY | 主键 |
| username | VARCHAR(50) | NOT NULL, UNIQUE | INDEX | 用户名 |
| email | VARCHAR(100) | NOT NULL, UNIQUE | INDEX | 邮箱 |
| created_at | TIMESTAMP | NOT NULL | - | 创建时间 |
| updated_at | TIMESTAMP | NOT NULL | - | 更新时间 |

**表名**: orders
| 字段名 | 类型 | 约束 | 索引 | 说明 |
|--------|------|------|------|------|
| id | BIGINT | PK, AI | PRIMARY | 主键 |
| user_id | BIGINT | NOT NULL, FK | INDEX | 用户ID |
| total_amount | DECIMAL(10,2) | NOT NULL | - | 总金额 |
| status | TINYINT | NOT NULL | INDEX | 状态 |
| created_at | TIMESTAMP | NOT NULL | INDEX | 创建时间 |

#### 3.3.3 索引策略
- **主键索引**: [所有主键]
- **唯一索引**: [需要唯一的字段]
- **普通索引**: [频繁查询的字段]
- **复合索引**: [多字段组合查询]

#### 3.3.4 分库分表策略（如需要）
- **分片键**: [选择分片键]
- **分片算法**: [分片算法]
- **分片数量**: [分片数量]

### 3.4 缓存设计
#### 3.4.1 缓存策略
- **缓存类型**: [Redis/Memcached/本地缓存]
- **缓存模式**: [Cache-Aside/Read-Through/Write-Through]

#### 3.4.2 缓存Key设计
```
user:{id}           - 用户信息
user:list:{page}    - 用户列表
order:{id}          - 订单信息
order:user:{userId} - 用户订单列表
```

#### 3.4.3 缓存过期策略
- **热数据**: [过期时间]
- **温数据**: [过期时间]
- **冷数据**: [过期时间]

### 3.5 消息队列设计（如需要）
#### 3.5.1 消息队列选型
- **技术**: [RabbitMQ/Kafka/RocketMQ]
- **原因**: [选择理由]

#### 3.5.2 消息定义
**Topic/Exchange**: [名称]
**消息格式**:
```json
{
  "eventType": "UserCreated",
  "eventId": "uuid",
  "timestamp": 1234567890,
  "data": {
    "userId": "123",
    "username": "john"
  }
}
```

### 3.6 安全设计
#### 3.6.1 认证授权
- **认证方式**: [JWT/Session/OAuth2]
- **权限模型**: [RBAC/ABAC]
- **Token设计**: [Token结构]

#### 3.6.2 数据加密
- **传输加密**: [HTTPS/TLS]
- **存储加密**: [字段加密方案]
- **敏感数据**: [加密策略]

#### 3.6.3 防护措施
- SQL注入防护: [参数化查询]
- XSS防护: [输入过滤/输出编码]
- CSRF防护: [Token验证]
- 限流熔断: [限流策略]

### 3.7 代码实现
#### 3.7.1 项目结构
```
project/
├── src/
│   ├── controllers/     # 控制器层
│   ├── services/        # 业务逻辑层
│   ├── repositories/    # 数据访问层
│   ├── models/          # 数据模型
│   ├── middlewares/     # 中间件
│   ├── utils/           # 工具函数
│   └── config/          # 配置文件
├── tests/               # 测试文件
└── docs/                # 文档
```

#### 3.7.2 核心代码示例
```python
# 示例：用户服务
class UserService:
    def __init__(self, user_repo, cache):
        self.user_repo = user_repo
        self.cache = cache

    async def get_user(self, user_id: int) -> User:
        # 先查缓存
        cached = await self.cache.get(f"user:{user_id}")
        if cached:
            return User.parse_raw(cached)

        # 查数据库
        user = await self.user_repo.find_by_id(user_id)
        if not user:
            raise UserNotFoundError()

        # 写缓存
        await self.cache.set(
            f"user:{user_id}",
            user.json(),
            expire=3600
        )

        return user
```

### 3.8 性能优化
#### 3.8.1 查询优化
- **慢查询优化**: [优化方案]
- **N+1问题**: [解决方案]
- **批量操作**: [批量策略]

#### 3.8.2 并发优化
- **连接池**: [连接池配置]
- **异步处理**: [异步策略]
- **锁机制**: [锁策略]

### 3.9 监控与日志
#### 3.9.1 监控指标
- **应用指标**: [QPS、响应时间、错误率]
- **系统指标**: [CPU、内存、磁盘、网络]
- **业务指标**: [订单量、用户活跃度]

#### 3.9.2 日志规范
```json
{
  "level": "info",
  "timestamp": "2025-01-07T10:00:00Z",
  "service": "user-service",
  "trace_id": "abc123",
  "message": "User created",
  "context": {
    "user_id": 123,
    "action": "create"
  }
}
```
```

### 4. 验证与测试
```markdown
## 验证与测试

### 4.1 单元测试
**测试覆盖**: [目标覆盖率]

**测试示例**:
```python
def test_get_user_cache_hit():
    # Given
    user = User(id=1, name="John")
    cache.set("user:1", user.json())

    # When
    result = userService.get_user(1)

    # Then
    assert result.id == 1
    assert result.name == "John"
```

### 4.2 集成测试
**测试场景**:
1. API端到端测试
2. 数据库集成测试
3. 缓存集成测试
4. 消息队列集成测试

### 4.3 性能测试
**压测工具**: [JMeter/Locust/k6]

**压测场景**:
- QPS: [目标QPS]
- 并发用户: [目标并发]
- 响应时间: [P50 < Xms, P99 < Yms]

### 4.4 安全测试
- [ ] SQL注入测试
- [ ] XSS测试
- [ ] CSRF测试
- [ ] 权限测试
- [ ] 渗透测试
```

### 5. 建议与后续
```markdown
## 建议与后续

### 5.1 优化建议
**短期优化**（1-2周）:
- [ ] [优化项1]
- [ ] [优化项2]

**中期优化**（1-2月）:
- [ ] [优化项1]
- [ ] [优化项2]

**长期规划**（3月+）:
- [ ] [优化项1]
- [ ] [优化项2]

### 5.2 技术债务
**已知债务**:
1. **[债务1]**: [描述] - [优先级] - [建议解决时间]
2. **[债务2]**: [描述] - [优先级] - [建议解决时间]

### 5.3 后续步骤
1. **[步骤1]**: [描述] - [负责人] - [时间]
2. **[步骤2]**: [描述] - [负责人] - [时间]
3. **[步骤3]**: [描述] - [负责人] - [时间]

### 5.4 风险与缓解
| 风险 | 影响 | 概率 | 缓解措施 |
|------|------|------|---------|
| [风险1] | [高/中/低] | [高/中/低] | [措施] |
| [风险2] | [高/中/低] | [高/中/低] | [措施] |
```

---

## 特殊 Agent 定制

### backend-architect 模板增强
```markdown
# 后端架构设计方案

## 1. 架构目标
### 1.1 业务目标
- **支持用户量**: [X万用户]
- **并发量**: [X QPS]
- **数据量**: [X TB数据]

### 1.2 技术目标
- **高可用性**: [99.9%]
- **可扩展性**: [水平扩展能力]
- **性能**: [响应时间 < Xms]

### 1.3 约束条件
- **预算**: [硬件/云服务预算]
- **团队**: [团队规模和技能]
- **时间**: [开发周期]

## 2. 架构设计
### 2.1 架构选型
**架构模式**: [单体/微服务/Serverless/事件驱动]

**选择理由**:
1. [理由1]
2. [理由2]
3. [理由3]

### 2.2 架构图
```
                    [负载均衡: Nginx]
                           |
                    [API网关: Kong]
                           |
          +----------------+----------------+
          |                |                |
    [用户服务]        [订单服务]        [支付服务]
          |                |                |
          +----------------+----------------+
                           |
                    [数据访问层]
                           |
          +----------------+----------------+
          |                |                |
   [MySQL主从]       [Redis集群]     [MongoDB分片]
```

### 2.3 服务拆分
#### 2.3.1 服务边界
1. **用户服务**
   - 职责: 用户注册、登录、信息管理
   - 接口: [列出主要API]
   - 数据库: [独立数据库]

2. **订单服务**
   - 职责: 订单创建、查询、状态管理
   - 接口: [列出主要API]
   - 数据库: [独立数据库]

#### 2.3.2 服务通信
- **同步通信**: [REST/gRPC]
- **异步通信**: [消息队列]
- **服务发现**: [Consul/Eureka/Nacos]

### 2.4 数据架构
#### 2.4.1 数据存储选型
| 数据类型 | 存储方案 | 理由 |
|---------|---------|------|
| 用户数据 | MySQL | ACID保证 |
| 缓存数据 | Redis | 高性能 |
| 日志数据 | Elasticsearch | 全文搜索 |

#### 2.4.2 数据一致性
- **强一致性场景**: [支付等核心业务]
- **最终一致性场景**: [订单状态同步等]
- **一致性方案**: [分布式事务/事件驱动]

### 2.5 技术选型
#### 2.5.1 后端框架
- **开发语言**: [Go/Java/Python/Node.js]
- **框架**: [框架名称]
- **理由**: [选择理由]

#### 2.5.2 中间件
- **API网关**: [Kong/Traefik]
- **配置中心**: [Apollo/Nacos]
- **监控**: [Prometheus+Grafana]
- **链路追踪**: [Jaeger/Zipkin]

### 2.6 非功能设计
#### 2.6.1 高可用设计
- **服务冗余**: [多实例部署]
- **故障转移**: [自动切换机制]
- **降级熔断**: [降级策略]

#### 2.6.2 高性能设计
- **缓存策略**: [多级缓存]
- **异步处理**: [异步非阻塞]
- **数据库优化**: [读写分离/分库分表]

#### 2.6.3 安全设计
- **网络安全**: [VPC/安全组]
- **应用安全**: [认证授权]
- **数据安全**: [加密脱敏]

### 2.7 部署架构
#### 2.7.1 容器化
- **容器**: [Docker]
- **编排**: [Kubernetes]
- **CI/CD**: [Jenkins/GitLab CI]

#### 2.7.2 资源规划
| 服务 | 实例数 | CPU | 内存 | 存储 |
|------|--------|-----|------|------|
| 用户服务 | 3 | 2核 | 4GB | 20GB |
| 订单服务 | 3 | 4核 | 8GB | 50GB |

### 2.8 监控与运维
#### 2.8.1 监控体系
- **基础监控**: [CPU/内存/磁盘/网络]
- **应用监控**: [QPS/响应时间/错误率]
- **业务监控**: [订单量/交易额]

#### 2.8.2 告警策略
| 告警项 | 阈值 | 级别 | 通知方式 |
|--------|------|------|---------|
| CPU使用率 | >80% | 警告 | 邮件 |
| 响应时间 | >1s | 严重 | 短信+电话 |
| 错误率 | >5% | 严重 | 短信+电话 |

## 3. 实施计划
### 3.1 迁移路径
**阶段1**: [基础架构搭建] - [2周]
**阶段2**: [核心服务开发] - [4周]
**阶段3**: [性能优化] - [2周]
**阶段4**: [上线试运行] - [1周]

### 3.2 风险管理
| 风险 | 影响 | 概率 | 应对措施 |
|------|------|------|---------|
| [风险1] | [高] | [中] | [措施] |
| [风险2] | [中] | [高] | [措施] |

---
**质量评分**: [X]/100
**生成时间**: [timestamp]
**Agent**: backend-architect
```

### database-architect 模板增强
```markdown
# 数据库架构设计方案

## 1. 数据需求分析
### 1.1 业务数据量
| 数据类型 | 当前量 | 年增长 | 3年预估 |
|---------|--------|--------|---------|
| 用户数据 | 10万 | 50% | 34万 |
| 订单数据 | 100万 | 100% | 800万 |
| 日志数据 | 1000万/天 | 100% | 10亿/天 |

### 1.2 数据特征
- **读写比例**: [读:写 = X:1]
- **数据热度**: [热数据:温数据:冷数据 = X:Y:Z]
- **查询特点**: [高频查询/复杂查询/实时查询]

### 1.3 性能要求
- **QPS**: [X万QPS]
- **响应时间**: [P99 < Xms]
- **并发连接**: [X个连接]

## 2. 数据库选型
### 2.1 存储方案对比
| 方案 | 优点 | 缺点 | 适用场景 | 评分 |
|------|------|------|---------|------|
| MySQL | 成熟稳定/ACID | 大表性能差 | 事务性业务 | 90 |
| MongoDB | 灵活Schema | 事务支持弱 | 文档存储 | 80 |
| Redis | 高性能 | 数据有限 | 缓存/队列 | 85 |

### 2.2 推荐方案
**主数据库**: [MySQL 8.0]
**理由**:
1. ACID保证，适合事务
2. 成熟稳定，社区活跃
3. 运维成本低

**辅助数据库**: [Redis]
**理由**:
1. 高性能缓存
2. 支持多种数据结构
3. 持久化支持

## 3. 数据模型设计
### 3.1 概念模型
```
[ER图 - 文字描述]

用户 ──< 订单 ──< 订单明细
 │ │
 │ └──< 收货地址
 └──< 用户标签
```

### 3.2 逻辑模型
#### 3.2.1 表关系
- **1对1**: 用户 ← 用户扩展
- **1对多**: 用户 ← 订单
- **多对多**: 商品 ↔ 订单 (通过订单明细)

#### 3.2.2 表规范
- **命名规范**: [小写_下划线]
- **主键**: [BIGINT自增]
- **时间戳**: [created_at, updated_at]
- **软删除**: [deleted_at]

### 3.3 物理模型
#### 3.3.1 表结构设计

**表名**: tb_user
| 字段 | 类型 | 长度 | 允许空 | 默认值 | 索引 | 说明 |
|------|------|------|--------|--------|------|------|
| id | BIGINT | - | NO | AUTO | PK | 主键 |
| username | VARCHAR | 50 | NO | - | UK | 用户名 |
| email | VARCHAR | 100 | NO | - | UK | 邮箱 |
| password | VARCHAR | 255 | NO | - | - | 密码哈希 |
| status | TINYINT | - | NO | 1 | IDX | 状态 |
| created_at | DATETIME | - | NO | NOW | - | 创建时间 |
| updated_at | DATETIME | - | NO | NOW | - | 更新时间 |
| deleted_at | DATETIME | - | YES | NULL | IDX | 删除时间 |

**表名**: tb_order
| 字段 | 类型 | 长度 | 允许空 | 默认值 | 索引 | 说明 |
|------|------|------|--------|--------|------|------|
| id | BIGINT | - | NO | AUTO | PK | 主键 |
| user_id | BIGINT | - | NO | - | IDX | 用户ID |
| order_no | VARCHAR | 32 | NO | - | UK | 订单号 |
| total_amount | DECIMAL | 10,2 | NO | - | - | 总金额 |
| status | TINYINT | - | NO | 0 | IDX | 状态 |
| created_at | DATETIME | - | NO | NOW | IDX | 创建时间 |
| updated_at | DATETIME | - | NO | NOW | - | 更新时间 |

#### 3.3.2 索引设计
**主键索引**: 所有表的id字段

**唯一索引**:
- tb_user.username
- tb_user.email
- tb_order.order_no

**普通索引**:
- tb_user.status
- tb_order.user_id
- tb_order.status
- tb_order.created_at

**复合索引**:
- idx_order_user_status: (user_id, status)
- idx_order_created: (created_at, status)

**索引优化建议**:
- 避免过多索引，影响写入性能
- 复合索引遵循最左前缀原则
- 定期分析慢查询，优化索引

### 3.4 分库分表设计
#### 3.4.1 分片策略
**分片键**: user_id
**分片算法**: Hash取模
**分片数量**: 4库16表

**路由规则**:
```
库号 = user_id % 4
表号 = user_id % 16
```

#### 3.4.2 数据迁移
**迁移工具**: [shardingsphere/mydumper/loader]

**迁移步骤**:
1. 数据导出
2. 数据导入
3. 数据校验
4. 切换路由

### 3.5 读写分离设计
#### 3.5.1 架构
```
              [应用]
                |
          [中间件: ProxySQL]
                |
        +-------+-------+
        |               |
     [主库: Master]  [从库: Slave1]
        |               |
        +------+--------+
               |
          [从库: Slave2]
```

#### 3.5.2 路由规则
- 写操作 → 主库
- 读操作 → 从库（负载均衡）
- 强一致性读 → 主库

### 3.6 备份与恢复
#### 3.6.1 备份策略
**全量备份**: 每周日凌晨2点
**增量备份**: 每天凌晨3点
**binlog备份**: 实时

**备份保留**:
- 全量备份: 保留1个月
- 增量备份: 保留1周
- binlog: 保留3天

#### 3.6.2 恢复方案
**恢复时间目标** (RTO): < 1小时
**恢复点目标** (RPO): < 5分钟

**恢复流程**:
1. 恢复全量备份
2. 应用增量备份
3. 应用binlog
4. 验证数据
5. 切换流量

## 4. 性能优化
### 4.1 查询优化
#### 4.1.1 慢查询优化
**慢查询阈值**: 1秒

**优化方法**:
- 使用EXPLAIN分析执行计划
- 优化索引
- 优化SQL语句
- 使用查询缓存

#### 4.1.2 常见问题
**N+1查询**:
- 问题: 循环查询
- 方案: 使用JOIN或批量查询

**大表扫描**:
- 问题: 全表扫描
- 方案: 添加索引/分区

**深分页**:
- 问题: LIMIT offset, N
- 方案: 使用游标/延迟关联

### 4.2 缓存设计
#### 4.2.1 缓存策略
- **缓存模式**: Cache-Aside
- **缓存穿透**: 布隆过滤器
- **缓存击穿**: 互斥锁
- **缓存雪崩**: 过期时间随机

#### 4.2.2 缓存Key设计
```
user:{id}              # 用户信息
user:list:page:{page}  # 用户列表
order:{id}             # 订单信息
order:user:{userId}    # 用户订单
```

#### 4.2.3 缓存更新
- 写操作: 先更新DB，再删除缓存
- 读操作: 先读缓存，miss则读DB并写缓存

### 4.3 连接池优化
- **连接池**: HikariCP
- **最大连接**: 50
- **最小空闲**: 10
- **连接超时**: 30秒

## 5. 监控与运维
### 5.1 监控指标
#### 5.1.1 数据库指标
- **QPS**: [查询/秒]
- **TPS**: [事务/秒]
- **连接数**: [活跃连接/总连接]
- **慢查询**: [慢查询数量]

#### 5.1.2 系统指标
- **CPU使用率**: < 70%
- **内存使用率**: < 80%
- **磁盘IO**: < 70%
- **网络流量**: < 60%

### 5.2 告警规则
| 指标 | 阈值 | 级别 | 处理 |
|------|------|------|------|
| 慢查询 | >100/分钟 | 警告 | 优化SQL |
| CPU使用率 | >80% | 警告 | 扩容/优化 |
| 主从延迟 | >10秒 | 严重 | 检查复制 |
| 磁盘使用率 | >85% | 严重 | 扩容/清理 |

### 5.3 运维脚本
- 备份脚本
- 慢查询分析脚本
- 表空间检查脚本
- 索引优化脚本

---
**质量评分**: [X]/100
**生成时间**: [timestamp]
**Agent**: database-architect
```

### backend-developer 模板增强
```markdown
# 后端开发实施方案

## 1. 开发任务
### 1.1 任务描述
**功能名称**: [功能名称]

**需求描述**:
[详细描述要实现的功能]

**验收标准**:
- [ ] [标准1]
- [ ] [标准2]
- [ ] [标准3]

### 1.2 技术栈
- **语言**: [Java/Go/Python/Node.js]
- **框架**: [Spring Boot/Gin/Django/Express]
- **数据库**: [MySQL/PostgreSQL/MongoDB]
- **缓存**: [Redis/Memcached]

## 2. 详细设计
### 2.1 API设计
#### 2.1.1 接口列表
**1. 创建订单**
- **路径**: POST /api/orders
- **认证**: 需要
- **请求体**:
```json
{
  "userId": 123,
  "items": [
    {"productId": 1, "quantity": 2},
    {"productId": 2, "quantity": 1}
  ],
  "addressId": 456
}
```
- **响应**: 201 Created
```json
{
  "code": 201,
  "message": "Order created",
  "data": {
    "orderId": "ORD123456",
    "totalAmount": 299.00,
    "status": "pending"
  }
}
```
- **错误响应**: 400/401/500

**2. 查询订单**
- **路径**: GET /api/orders/:orderId
- **认证**: 需要
- **响应**: 200 OK
```json
{
  "code": 200,
  "message": "Success",
  "data": {
    "orderId": "ORD123456",
    "userId": 123,
    "items": [...],
    "totalAmount": 299.00,
    "status": "pending",
    "createdAt": "2025-01-07T10:00:00Z"
  }
}
```

#### 2.1.2 数据验证
**请求参数验证**:
- userId: 必填, 整数, >0
- items: 必填, 数组, length>0
- items[].productId: 必填, 整数, >0
- items[].quantity: 必填, 整数, >0
- addressId: 必填, 整数, >0

### 2.2 数据库设计
#### 2.2.1 表结构
```sql
CREATE TABLE orders (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  order_no VARCHAR(32) NOT NULL UNIQUE,
  user_id BIGINT NOT NULL,
  total_amount DECIMAL(10,2) NOT NULL,
  status TINYINT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_user_id (user_id),
  INDEX idx_status (status),
  INDEX idx_created_at (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE order_items (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  order_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  INDEX idx_order_id (order_id),
  FOREIGN KEY (order_id) REFERENCES orders(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
```

#### 2.2.2 数据访问层
```python
# OrderRepository.py
class OrderRepository:
    def find_by_id(self, order_id: int) -> Order:
        pass

    def find_by_user_id(self, user_id: int, limit: int, offset: int) -> List[Order]:
        pass

    def create(self, order: Order) -> Order:
        pass

    def update_status(self, order_id: int, status: int) -> bool:
        pass
```

### 2.3 业务逻辑
#### 2.3.1 核心流程
```python
# OrderService.py
class OrderService:
    def create_order(self, user_id: int, items: List[OrderItem], address_id: int) -> Order:
        # 1. 参数验证
        self._validate_items(items)

        # 2. 查询商品信息
        products = self.product_service.get_products([item.product_id for item in items])

        # 3. 计算金额
        total_amount = self._calculate_amount(items, products)

        # 4. 创建订单
        order = Order(
            order_no=self._generate_order_no(),
            user_id=user_id,
            total_amount=total_amount,
            status=OrderStatus.PENDING
        )
        order = self.order_repo.create(order)

        # 5. 创建订单明细
        for item in items:
            order_item = OrderItem(
                order_id=order.id,
                product_id=item.product_id,
                quantity=item.quantity,
                price=products[item.product_id].price
            )
            self.order_item_repo.create(order_item)

        # 6. 扣减库存
        self.inventory_service.deduct_stock(items)

        # 7. 发送订单创建事件
        self.event_publisher.publish("order.created", order)

        return order
```

#### 2.3.2 异常处理
```python
# 异常定义
class OrderNotFoundError(Exception):
    pass

class ProductOutOfStockError(Exception):
    pass

# 异常处理
@app.errorhandler(OrderNotFoundError)
def handle_order_not_found(e):
    return jsonify({"code": 404, "message": "Order not found"}), 404

@app.errorhandler(ProductOutOfStockError)
def handle_out_of_stock(e):
    return jsonify({"code": 400, "message": str(e)}), 400
```

### 2.4 代码结构
```
src/
├── controllers/
│   └── order_controller.py      # 订单控制器
├── services/
│   ├── order_service.py         # 订单服务
│   ├── product_service.py       # 商品服务
│   └── inventory_service.py     # 库存服务
├── repositories/
│   ├── order_repository.py      # 订单数据访问
│   └── order_item_repository.py # 订单明细数据访问
├── models/
│   ├── order.py                 # 订单模型
│   └── order_item.py            # 订单明细模型
├── schemas/
│   └── order_schema.py          # 请求/响应模式
├── middlewares/
│   └── auth_middleware.py       # 认证中间件
├── utils/
│   └── order_no_generator.py    # 订单号生成
└── config/
    └── database.py              # 数据库配置
```

## 3. 代码实现
### 3.1 控制器层
```python
# order_controller.py
from flask import Blueprint, request, jsonify
from .services.order_service import OrderService
from .middlewares.auth_middleware import login_required

order_bp = Blueprint('orders', __name__)
order_service = OrderService()

@order_bp.route('/orders', methods=['POST'])
@login_required
def create_order():
    """创建订单"""
    data = request.get_json()
    user_id = g.user.id

    try:
        order = order_service.create_order(
            user_id=user_id,
            items=data['items'],
            address_id=data['addressId']
        )
        return jsonify({
            "code": 201,
            "message": "Order created",
            "data": order.to_dict()
        }), 201
    except Exception as e:
        return jsonify({
            "code": 500,
            "message": str(e)
        }), 500

@order_bp.route('/orders/<int:order_id>', methods=['GET'])
@login_required
def get_order(order_id: int):
    """查询订单"""
    order = order_service.get_order(order_id)

    if not order:
        return jsonify({
            "code": 404,
            "message": "Order not found"
        }), 404

    return jsonify({
        "code": 200,
        "message": "Success",
        "data": order.to_dict()
    }), 200
```

### 3.2 服务层
```python
# order_service.py
from typing import List
from .repositories.order_repository import OrderRepository
from .repositories.order_item_repository import OrderItemRepository
from .utils.order_no_generator import generate_order_no
from .exceptions import ProductNotFoundError, ProductOutOfStockError

class OrderService:
    def __init__(self):
        self.order_repo = OrderRepository()
        self.order_item_repo = OrderItemRepository()

    def create_order(self, user_id: int, items: List[dict], address_id: int) -> Order:
        """创建订单"""

        # 1. 验证商品
        product_ids = [item['productId'] for item in items]
        products = self.product_service.get_products_by_ids(product_ids)

        # 2. 检查库存
        for item in items:
            product = products.get(item['productId'])
            if not product:
                raise ProductNotFoundError(item['productId'])
            if product.stock < item['quantity']:
                raise ProductOutOfStockError(product.name)

        # 3. 创建订单
        order = Order(
            order_no=generate_order_no(),
            user_id=user_id,
            total_amount=0,
            status=0
        )

        # 4. 保存订单
        with transaction():
            order = self.order_repo.create(order)

            # 5. 保存订单明细
            total_amount = 0
            for item in items:
                product = products[item['productId']]
                order_item = OrderItem(
                    order_id=order.id,
                    product_id=item['productId'],
                    quantity=item['quantity'],
                    price=product.price
                )
                self.order_item_repo.create(order_item)
                total_amount += product.price * item['quantity']

            # 6. 更新订单总额
            order.total_amount = total_amount
            self.order_repo.update(order)

        return order

    def get_order(self, order_id: int) -> Order:
        """获取订单"""
        return self.order_repo.find_by_id(order_id)

    def get_user_orders(self, user_id: int, page: int, size: int) -> List[Order]:
        """获取用户订单列表"""
        return self.order_repo.find_by_user_id(user_id, size, (page-1)*size)
```

### 3.3 数据访问层
```python
# order_repository.py
from typing import List, Optional
from .models.order import Order
from .config.database import db

class OrderRepository:
    def find_by_id(self, order_id: int) -> Optional[Order]:
        """根据ID查询订单"""
        return db.session.query(Order).filter(Order.id == order_id).first()

    def find_by_order_no(self, order_no: str) -> Optional[Order]:
        """根据订单号查询"""
        return db.session.query(Order).filter(Order.order_no == order_no).first()

    def find_by_user_id(self, user_id: int, limit: int, offset: int) -> List[Order]:
        """查询用户订单"""
        return db.session.query(Order)\
            .filter(Order.user_id == user_id)\
            .order_by(Order.created_at.desc())\
            .limit(limit)\
            .offset(offset)\
            .all()

    def create(self, order: Order) -> Order:
        """创建订单"""
        db.session.add(order)
        db.session.commit()
        return order

    def update(self, order: Order) -> Order:
        """更新订单"""
        db.session.merge(order)
        db.session.commit()
        return order
```

### 3.4 模型定义
```python
# models/order.py
from datetime import datetime
from sqlalchemy import Column, Integer, String, Numeric, DateTime
from .config.database import Base

class Order(Base):
    __tablename__ = 'orders'

    id = Column(Integer, primary_key=True, autoincrement=True)
    order_no = Column(String(32), nullable=False, unique=True)
    user_id = Column(Integer, nullable=False, index=True)
    total_amount = Column(Numeric(10, 2), nullable=False)
    status = Column(Integer, nullable=False, default=0, index=True)
    created_at = Column(DateTime, nullable=False, default=datetime.now)
    updated_at = Column(DateTime, nullable=False, default=datetime.now, onupdate=datetime.now)

    def to_dict(self):
        return {
            'orderId': self.id,
            'orderNo': self.order_no,
            'userId': self.user_id,
            'totalAmount': float(self.total_amount),
            'status': self.status,
            'createdAt': self.created_at.isoformat()
        }
```

### 3.5 单元测试
```python
# test_order_service.py
import unittest
from services.order_service import OrderService

class TestOrderService(unittest.TestCase):
    def setUp(self):
        self.order_service = OrderService()

    def test_create_order_success(self):
        """测试成功创建订单"""
        # Given
        user_id = 123
        items = [
            {'productId': 1, 'quantity': 2}
        ]
        address_id = 456

        # When
        order = self.order_service.create_order(user_id, items, address_id)

        # Then
        self.assertIsNotNone(order)
        self.assertEqual(order.user_id, user_id)
        self.assertGreater(order.total_amount, 0)

    def test_create_order_insufficient_stock(self):
        """测试库存不足"""
        # Given
        user_id = 123
        items = [
            {'productId': 1, 'quantity': 10000}  # 超出库存
        ]

        # When & Then
        with self.assertRaises(ProductOutOfStockError):
            self.order_service.create_order(user_id, items, 456)

if __name__ == '__main__':
    unittest.main()
```

## 4. 部署与运维
### 4.1 环境配置
```bash
# .env.development
DATABASE_URL=mysql://localhost:3306/db_dev
REDIS_URL=redis://localhost:6379
LOG_LEVEL=DEBUG

# .env.production
DATABASE_URL=mysql://prod-db:3306/db_prod
REDIS_URL=redis://prod-redis:6379
LOG_LEVEL=INFO
```

### 4.2 部署步骤
1. 安装依赖
2. 运行数据库迁移
3. 配置环境变量
4. 启动服务
5. 健康检查

### 4.3 监控指标
- 接口响应时间
- 错误率
- QPS
- 数据库连接数

---
**质量评分**: [X]/100
**生成时间**: [timestamp]
**Agent**: backend-developer
```

---

## 使用说明

### 在技能中引用模板

```markdown
## Agent 调用指令

调用 `backend-architect` agent 时，请遵循以下要求：

1. **输出格式**: 使用 `templates/agent-outputs/architecture-backend-template.md`
2. **章节要求**: 包含所有必需章节
3. **质量标准**: 输出质量评分 ≥90分
4. **技术深度**: 架构设计必须包含技术选型理由
```

### 模板验证（宽松模式）

由于采用宽松验证：
- Agent 输出后**不强制检查格式**
- 建议在 Agent 提示中**明确引用模板**
- 输出结果由用户**手动检查**

---

## 版本历史

### v2.1.0 (2025-01-07)
- ✅ 创建通用模板
- ✅ 添加 backend-architect 定制模板
- ✅ 添加 database-architect 定制模板
- ✅ 添加 backend-developer 定制模板
- ✅ 支持15个架构与后端类 Agent

---

**最后更新**: 2025-01-07
**维护者**: Smart Flow Team
