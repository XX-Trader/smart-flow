# 运维与部署类 Agent 输出模板

> **适用Agent**: deployment-engineer, devops-troubleshooter, cloud-architect, github-actions-runner, terraform-specialist, incident-responder, db-deploy, windows-fullstack-deploy, mcp-deployment-orchestrator, deployment-test
> **版本**: v2.1.0
> **更新**: 2025-01-07

---

## 📋 模板索引

### 快速导航
- [deployment-engineer 模板](#deployment-engineer-模板)
- [devops-troubleshooter 模板](#devops-troubleshooter-模板)
- [cloud-architect 模板](#cloud-architect-模板)
- [其他模板索引](#其他模板索引)

---

## 🚀 deployment-engineer 模板

### 基础信息
```yaml
Agent: deployment-engineer
任务类型: 自动化部署
执行时间: YYYY-MM-DD HH:mm:ss
项目上下文: [项目名称/类型]
环境: [开发/测试/预发布/生产]
```

### 1. 需求复述与确认

#### 📌 需求理解
- **部署目标**: [生产环境/测试环境/开发环境]
- **部署范围**: [前端/后端/数据库/全栈]
- **技术栈**: [Django/Vue/Node.js/Python等]
- **当前状态**: [首次部署/版本更新/回滚/扩容]
- **特殊要求**: [零停机/蓝绿部署/金丝雀发布]

#### 🔍 需求澄清
- [ ] 服务器信息已确认 (IP/配置/权限)
- [ ] 数据库迁移策略已确认
- [ ] 环境变量配置已确认
- [ ] 回滚策略已确认
- [ ] 监控与告警已配置

#### ⚠️ 风险评估
| 风险项 | 风险等级 | 应对措施 | 状态 |
|--------|----------|----------|------|
| 数据丢失 | 高 | 自动备份+验证 | 待评估 |
| 服务中断 | 中 | 蓝绿部署 | 待评估 |

### 2. 部署架构设计

#### 🏗️ 架构图
```
[用户] -> [负载均衡 Nginx] -> [应用服务器集群]
                                ├─ [App Server 1]
                                ├─ [App Server 2]
                                └─ [App Server N]
                                      ↓
                                [数据层]
                                ├─ [MySQL Master]
                                ├─ [MySQL Slave]
                                └─ [Redis Cache]
```

#### 📦 组件清单
| 组件 | 版本 | 实例数 | 资源配置 | 部署方式 |
|------|------|--------|----------|----------|
| Nginx | 1.24+ | 2 | 2C4G | Docker |
| Django | 4.2+ | 3 | 4C8G | Gunicorn |
| MySQL | 8.0+ | 1主1从 | 8C16G | Docker |
| Redis | 7.0+ | 1 | 4C8G | Docker |

#### 🔗 端口规划
| 服务 | 内部端口 | 外部端口 | 协议 | 备注 |
|------|----------|----------|------|------|
| Nginx | 80 | 80/443 | HTTP/HTTPS | 对外 |
| Django | 8000 | - | HTTP | 内部 |
| MySQL | 3306 | - | TCP | 内部 |

### 3. CI/CD 流程设计

#### 🔄 流程图
```
[代码提交] -> [Git Push] -> [GitHub Actions触发]
                                ↓
                            [代码检出]
                                ↓
                            [依赖安装]
                                ↓
                            [代码检查]
                            ├─ [Lint检查]
                            ├─ [单元测试]
                            └─ [安全扫描]
                                ↓
                            [构建镜像]
                                ↓
                            [推送镜像]
                                ↓
                            [部署到环境]
                            ├─ [开发环境] (自动)
                            ├─ [测试环境] (自动)
                            └─ [生产环境] (手动审批)
                                ↓
                            [健康检查]
                                ↓
                            [部署成功/失败通知]
```

#### 📋 工作流配置
```yaml
# .github/workflows/deploy.yml
name: Deploy to Production

on:
  push:
    branches: [main]
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'

      - name: Install dependencies
        run: |
          pip install -r requirements.txt

      - name: Run tests
        run: |
          pytest

      - name: Build Docker image
        run: |
          docker build -t myapp:${{ github.sha }} .

      - name: Deploy to server
        run: |
          # 部署命令
```

### 4. 监控方案

#### 📊 监控层级
```yaml
应用层监控:
  - 指标: QPS, 响应时间, 错误率
  - 工具: Prometheus + Grafana
  - 采样: 每15秒

系统层监控:
  - 指标: CPU, 内存, 磁盘, 网络
  - 工具: Node Exporter + Prometheus
  - 采样: 每分钟

业务层监控:
  - 指标: 订单量, 注册用户
  - 工具: 自定义埋点
  - 采样: 实时
```

#### 🚨 告警规则
| 告警项 | 触发条件 | 级别 | 通知方式 |
|--------|----------|------|----------|
| 服务宕机 | HTTP 200 < 90% | 严重 | 电话+短信 |
| 响应慢 | P95 > 3s | 警告 | 邮件+钉钉 |
| 错误率高 | 5xx > 5% | 严重 | 电话+短信 |

### 5. 回滚策略

#### 🔄 回滚方案
```yaml
回滚类型:
  即时回滚:
    触发条件: 严重Bug/服务不可用
    执行时间: < 5分钟
    操作: 切换流量到旧版本

回滚步骤:
  1. 停止新版本服务
  2. 恢复数据库备份 (如需要)
  3. 启动旧版本服务
  4. 验证服务健康
  5. 切换流量
  6. 监控运行状态
```

### 6. 环境配置

#### 🔧 环境变量清单
```bash
# .env.production
APP_ENV=production
DEBUG=False
SECRET_KEY=[your-secret-key]
ALLOWED_HOSTS=example.com,www.example.com

# 数据库配置
DB_ENGINE=django.db.backends.postgresql
DB_NAME=myapp_prod
DB_USER=prod_user
DB_PASSWORD=[strong-password]
DB_HOST=db.production.internal
DB_PORT=5432

# Redis配置
REDIS_HOST=redis.production.internal
REDIS_PORT=6379
REDIS_PASSWORD=[redis-password]
```

#### 🐳 Docker Compose 配置
```yaml
version: '3.8'

services:
  nginx:
    image: nginx:1.24-alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf
    depends_on:
      - web
    restart: always

  web:
    build: .
    command: gunicorn config.wsgi:application --bind 0.0.0.0:8000
    env_file:
      - .env.production
    depends_on:
      - db
      - redis
    restart: always

  db:
    image: postgres:15-alpine
    volumes:
      - postgres_data:/var/lib/postgresql/data
    restart: always

  redis:
    image: redis:7-alpine
    command: redis-server --requirepass ${REDIS_PASSWORD}
    restart: always

volumes:
  postgres_data:
```

### 7. 部署执行记录

#### 📅 执行时间线
| 时间 | 操作 | 执行人 | 状态 | 备注 |
|------|------|--------|------|------|
| 2024-01-07 10:00 | 创建部署计划 | Claude | ✅ | - |
| 2024-01-07 10:30 | 配置服务器 | DevOps | ⏳ | 进行中 |

#### 📝 部署步骤
```bash
# 1. 备份当前版本
ssh server "cp -r /var/www/myapp /var/www/myapp.backup.$(date +%Y%m%d_%H%M%S)"

# 2. 拉取最新代码
git pull origin main

# 3. 安装依赖
pip install -r requirements.txt

# 4. 数据库迁移
python manage.py migrate

# 5. 收集静态文件
python manage.py collectstatic --noinput

# 6. 重启服务
sudo systemctl restart gunicorn
sudo systemctl restart nginx

# 7. 健康检查
curl -f http://localhost:8000/health/ || exit 1
```

### 8. 部署验证

#### ✅ 验证清单
- [ ] 服务启动成功 (systemctl status)
- [ ] 健康检查接口返回200
- [ ] 核心功能可正常使用
- [ ] 数据库连接正常
- [ ] Redis连接正常
- [ ] 静态资源加载正常
- [ ] 日志无ERROR级别
- [ ] 监控指标正常

#### 🧪 测试结果
```yaml
单元测试:
  框架: pytest
  覆盖率: 85%+
  结果: 120 passed, 0 failed

集成测试:
  场景数: 15
  通过率: 100%

性能测试:
  工具: Apache Bench
  并发: 100
  QPS: 500+
  P95延迟: < 500ms
```

### 9. 部署后监控

#### 📈 部署后24小时监控数据
```
[2024-01-07 12:00] 部署完成
[2024-01-07 12:05] 服务稳定运行
[2024-01-07 12:30] QPS: 450 (预期: 500)
[2024-01-07 13:00] 错误率: 0.1% (预期: < 0.5%)
[2024-01-07 18:00] 无告警产生
[2024-01-08 12:00] 24小时稳定运行 ✅
```

### 10. 问题与解决方案

#### ❌ 遇到的问题
```yaml
问题1: 数据库迁移失败
  时间: 2024-01-07 11:15
  错误: InconsistentMigrationHistory
  解决:
    - 回滚到上一版本数据库
    - 重建迁移记录
  状态: ✅ 已解决
```

### 11. 优化建议

#### 💡 短期优化 (1-2周)
1. **引入蓝绿部署**
   - 优势: 零停机部署
   - 工作量: 2人天
   - 优先级: 高

2. **优化CI/CD流程**
   - 当前耗时: 15分钟
   - 目标: 10分钟

#### 🚀 长期优化 (1-3个月)
1. **引入Service Mesh**
   - 技术: Istio / Linkerd
   - 优势: 流量管理, 服务治理

2. **实施GitOps**
   - 工具: ArgoCD / Flux
   - 优势: 声明式部署

### 12. 文档与知识沉淀

#### 📚 相关文档
- **部署手册**: `/docs/deployment/manual.md`
- **架构文档**: `/docs/architecture/overview.md`
- **运维手册**: `/docs/operations/runbook.md`
- **应急预案**: `/docs/operations/emergency.md`

#### 🎓 经验总结
1. **最佳实践**
   - 部署前完整备份
   - 使用蓝绿部署减少风险
   - 健康检查必须完善

2. **避坑指南**
   - 不要在部署窗口修改配置
   - 不要跳过测试直接部署

---

## 🔧 devops-troubleshooter 模板

### 基础信息
```yaml
Agent: devops-troubleshooter
任务类型: 生产问题排查
严重级别: [P0-紧急/P1-高/P2-中/P3-低]
影响范围: [全部用户/部分用户/内部用户]
```

### 1. 问题概述
```yaml
问题标题: [简短描述问题]
发生时间: YYYY-MM-DD HH:mm:ss
影响系统: [受影响的系统/模块]
当前状态: [排查中/已定位/已修复/待验证]
负责人: [负责人姓名]
```

### 2. 症状描述
#### 📊 监控数据
```
错误率突增:
  时间: 2024-01-07 10:30
  错误率: 15% (基线: 0.5%)
  影响: 所有API接口

响应时间变慢:
  P95延迟: 8s (基线: 500ms)
```

#### 📝 用户反馈
```
报错信息: "502 Bad Gateway"
影响用户: 全部用户
首次报告: 2024-01-07 10:32
```

### 3. 初步排查
#### 🔍 环境检查
```bash
# 服务状态
$ systemctl status gunicorn
● gunicorn.service - Gunicorn Daemon
   Active: active (running)

# 进程检查
$ ps aux | grep gunicorn
user  1235  95.0  3.5  800000 280000 ?  R  10:30  5:23 gunicorn: worker
```

#### 📊 资源使用
```
CPU:
  使用率: 95%+ (持续)
  核心: 全部满载

内存:
  使用率: 75%
  可用: 4GB / 16GB
```

### 4. 日志分析
#### 📋 应用日志
```
[2024-01-07 10:30:15] ERROR: DatabaseError: lock timeout
    at /app/orders/views.py:145

[2024-01-07 10:30:17] WARNING: Slow request: 8.5s
    Path: /api/orders/list/
```

### 5. 根因分析
#### 🎯 问题定位
```yaml
问题根源: 数据库锁竞争导致请求堆积

分析过程:
  1. 应用日志显示大量 lock timeout
  2. 慢查询日志发现 orders 表被锁
  3. 监控显示订单接口QPS突增 10x

触发条件:
  1. 订单接口流量突增
  2. 数据库连接池耗尽
  3. 无熔断机制
```

### 6. 解决方案
#### ⚡ 紧急修复 (5分钟内)
```bash
# 1. 重启应用服务,释放锁
sudo systemctl restart gunicorn

# 2. 数据库 kill 锁等待进程
mysql> KILL 12345;

# 3. 临时限流
# Nginx配置 limit_req
```

#### 🔧 临时方案 (1小时内)
```python
# 1. 添加数据库锁超时
DATABASES = {
    'default': {
        'OPTIONS': {
            'lock_timeout': 5,  # 5秒超时
        }
    }
}

# 2. 添加熔断器
from circuitbreaker import circuit

@circuit(failure_threshold=10, recovery_timeout=30)
def process_order():
    ...
```

#### 🏗️ 长期方案 (1-2周)
```yaml
1. 数据库优化:
   - 添加索引
   - 读写分离

2. 应用优化:
   - 引入消息队列削峰
   - 实施缓存策略
```

### 7. 验证与监控
#### ✅ 修复验证
```yaml
步骤1: 重启服务
  时间: 10:35
  结果: ✅ 服务启动成功

步骤2: 检查日志
  时间: 10:36
  结果: ✅ 无 lock timeout

步骤3: 监控指标
  错误率: 0.2% (恢复正常)
```

#### 📊 恢复后监控
```
[10:35] 服务重启完成
[10:36] 错误率下降到 0.2%
[11:00] 稳定运行 25分钟 ✅
```

### 8. 复盘总结
#### 📝 问题总结
```yaml
问题类型: 性能问题 / 数据库问题

严重程度: P0 (紧急)

影响时间: 2024-01-07 10:30 - 10:35 (5分钟)

影响范围: 全部用户

损失评估:
  - 订单量下降: 80%
  - 影响用户: ~5000人
```

#### 💡 经验教训
```yaml
做得好的:
  1. 监控及时发现问题
  2. 5分钟内恢复服务

需要改进:
  1. 缺少熔断机制
  2. 数据库锁未设置超时
```

#### 📋 改进计划
```yaml
短期 (1周):
  - [ ] 添加熔断器
  - [ ] 设置数据库锁超时

中期 (1月):
  - [ ] 引入消息队列
  - [ ] 实施缓存策略
```

---

## ☁️ cloud-architect 模板

### 基础信息
```yaml
Agent: cloud-architect
任务类型: 云架构设计
云服务商: [AWS/Azure/GCP/阿里云/混合云]
项目规模: [初创/中型/大型/企业级]
预算范围: [¥/月]
```

### 1. 需求分析
#### 📋 业务需求
```yaml
业务类型: [电商/SaaS/金融/游戏]

用户规模:
  当前: 10,000 DAU
  预期1年: 100,000 DAU
  预期3年: 1,000,000 DAU

流量特征:
  峰值流量: 平均的 5x
  高峰时段: 工作日 9:00-18:00

技术要求:
  可用性: 99.9% (年停机 < 8.76小时)
  性能: P95延迟 < 500ms
  扩展性: 支持 10x 流量增长

合规要求:
  数据本地化: 是/否
  数据备份: 保留3年
```

### 2. 架构设计
#### 🏗️ 云架构图 (AWS示例)
```
                     [Internet]
                          ↓
                  [Route53 DNS]
                          ↓
              [CloudFront CDN]
                    (全球加速)
                          ↓
            [Application Load Balancer]
                  (跨可用区)
                    ↓         ↓
              [AZ1]        [AZ2]
                 ↓            ↓
        [EC2 Auto Scaling] [EC2 Auto Scaling]
                 ↓            ↓
              [ElastiCache] [ElastiCache]
                 ↓            ↓
                 └───→ [RDS Multi-AZ]
                      (PostgreSQL)
                         ↓
                    [S3 Storage]
```

#### 📦 服务选型
| 服务 | 选型 | 规格 | 数量 | 月成本(¥) | 说明 |
|------|------|------|------|-----------|------|
| 计算 | EC2 | c5.xlarge (4C8G) | 2-20 | 1,200 | 自动扩缩容 |
| 数据库 | RDS | db.m5.large (2C8G) | 1主1从 | 1,500 | Multi-AZ |
| 缓存 | ElastiCache | cache.m5.large | 2 | 800 | Redis集群 |
| 存储 | S3 | Standard | - | 300 | 静态资源 |
| CDN | CloudFront | - | - | 500 | 全球加速 |
| **总计** | - | - | - | **4,550** | 月成本 |

### 3. 高可用设计
#### 🔁 多可用区架构
```yaml
计算层:
  部署: 2个AZ (可用区)
  实例: 每个AZ最少2个实例
  负载均衡: 跨AZ流量分发
  自动扩容: CPU > 70% 触发

数据库层:
  架构: RDS Multi-AZ
  主库: AZ1
  从库: AZ2
  自动故障转移: < 60秒

可用性目标:
  单AZ故障: 不影响服务
  年可用性: 99.95% (停机 < 4.38小时)
```

### 4. 弹性伸缩
#### 📈 自动扩缩容策略
```yaml
扩容指标:
  CPU使用率: > 70% 持续5分钟
  请求数: > 1000 QPS 持续3分钟

扩容策略:
  最小实例: 2个
  最大实例: 20个
  扩容步长: +2个实例
  冷却时间: 5分钟

缩容策略:
  CPU使用率: < 30% 持续15分钟
  缩容步长: -1个实例
```

### 5. 安全设计
#### 🔐 安全架构
```yaml
网络安全:
  VPC: 10.0.0.0/16
  公有子网: 10.0.1.0/24 (ALB, NAT)
  私有子网: 10.0.2.0/24 (EC2, RDS, Redis)
  安全组: 最小权限原则

访问控制:
  IAM角色: 服务间访问
  IAM策略: 最小权限
  密钥轮换: 90天
  MFA: 强制开启

数据安全:
  传输加密: TLS 1.2+
  静态加密: AES-256
  密钥管理: KMS

DDoS防护:
  AWS Shield: Standard (免费)
  CloudFront: CDN加速 + 缓存
  WAF: Web应用防火墙
```

### 6. 成本优化
#### 💰 成本分析
```yaml
当前成本: ¥4,550/月

优化方案:
1. 使用预留实例
   - 基础负载: 4个EC2实例
   - 按需成本: ¥1,200/月
   - 预留成本: ¥600/月 (1年期)
   - 节省: ¥600/月 (50%)

优化后成本: ¥3,650/月
节省比例: 20% (¥900/月)
年节省: ¥10,800
```

### 7. 容灾设计
#### 🌍 灾难恢复
```yaml
备份策略:
  数据库: 每日自动备份
  静态资源: S3版本控制

RTO/RPO:
  RTO (恢复时间目标): 1小时
  RPO (恢复点目标): 5分钟

灾难场景:
  1. 单实例故障
     检测时间: 30秒
     恢复时间: 自动, < 2分钟

  2. 单AZ故障
     检测时间: 1分钟
     恢复时间: 自动, < 5分钟

  3. 整个Region故障
     检测时间: 5分钟
     恢复时间: 手动, < 1小时
```

---

## 📦 其他模板索引

### github-actions-runner 模板
- **重点**: GitHub Actions 自托管 Runner 部署与配置
- **内容**: Runner安装、注册、监控、维护

### terraform-specialist 模板
- **重点**: 基础设施即代码(IaC)设计
- **内容**: Terraform模块、状态管理、版本控制

### incident-responder 模板
- **重点**: 生产事故应急响应
- **内容**: 事故分级、响应流程、沟通机制

### db-deploy 模板
- **重点**: 数据库自动化部署
- **内容**: 数据库迁移、备份恢复、版本升级

### windows-fullstack-deploy 模板
- **重点**: Windows本地开发环境搭建
- **内容**: 环境配置、服务启动、开发工具

### mcp-deployment-orchestrator 模板
- **重点**: MCP服务器部署编排
- **内容**: 多服务器协调、配置管理、批量部署

### deployment-test 模板
- **重点**: 部署后自动化测试
- **内容**: 健康检查、接口测试、UI测试

---

## 📝 使用说明

### 模板使用流程
1. **选择合适的模板**: 根据Agent类型选择对应模板
2. **填写基础信息**: 项目名称、环境、时间等
3. **复述与确认**: 确保理解用户需求
4. **填写各章节**: 按照模板结构填写内容
5. **验证与交付**: 检查完整性后交付

### 定制化原则
- **保留核心结构**: 不要删除主要章节
- **灵活调整内容**: 根据实际情况增删子章节
- **保持简洁**: 避免冗余,聚焦关键信息
- **图文并茂**: 使用ASCII图、表格增强可读性

### 质量标准
- **完整性**: 所有必填章节已完成
- **准确性**: 技术细节准确无误
- **可执行**: 提供的方案可直接执行
- **可追溯**: 记录关键决策和变更历史

---

**模板维护**: 本模板会根据实践反馈持续优化

**版本历史**:
- v2.1.0 (2025-01-07): 新增10个运维部署类Agent模板
- v2.0.0 (2024-01-06): 重构模板体系
- v1.0.0 (2024-01-01): 初始版本

**反馈与建议**: 如有问题或改进建议,请联系维护团队
