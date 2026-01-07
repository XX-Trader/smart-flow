# 编程语言专项类 Agent 输出模板

> **适用 Agents**: python-expert, golang-expert, java-developer, cpp-engineer, rust-expert, c-developer, typescript-expert, javascript-developer, php-developer, ruby-expert, sql-expert
>
> **模板版本**: v2.1.0
> **最后更新**: 2025-01-07

---

## 📋 通用输出结构

```markdown
# [语言名称] 专家分析与实施方案

## 1. 需求理解与确认
## 2. 语言特性分析
## 3. 技术方案设计
## 4. 代码实现
## 5. 最佳实践应用
## 6. 性能优化
## 7. 错误处理
## 8. 测试方案
## 9. 文档与维护
## 10. 交付清单
```

---

## 🔵 1. Python Expert（Python专家）

### 核心职责
Python专项开发,包括数据分析、Web开发、自动化脚本等

### 输出模板

```markdown
# Python Expert - Python分析与实施方案

**任务类型**: [Web/数据分析/AI/脚本]
**Python版本**: 3.11+
**执行时间**: [YYYY-MM-DD HH:MM:SS]

---

## 1. 需求理解与确认

### 核心需求
- **功能描述**: [一句话概括]
- **输入**: [数据格式、参数类型]
- **输出**: [返回格式、类型]
- **约束条件**: [性能/内存/兼容性]

### 语言特性匹配度
- **优势**: [简洁语法、丰富生态、适合快速开发]
- **劣势**: [GIL限制、性能相对较低]
- **替代方案**: [是否更适合其他语言]

---

## 2. Python特性分析

### 项目结构设计
```
project/
├── src/
│   ├── __init__.py
│   ├── core/           # 核心业务逻辑
│   ├── models/         # 数据模型（dataclass/pydantic）
│   ├── utils/          # 工具函数
│   └── config/         # 配置管理
├── tests/
│   ├── unit/
│   └── integration/
├── requirements.txt
├── pyproject.toml
└── README.md
```

### Python版本选择
- **目标版本**: Python 3.11+
- **关键特性**:
  - 类型注解（Type Hints）
  - 异步编程（asyncio）
  - 上下文管理器
  - 数据类（dataclass）

### 依赖管理
```python
# requirements.txt
pydantic>=2.0.0        # 数据验证
fastapi>=0.100.0       # Web 框架（如需要）
pytest>=7.0.0          # 测试框架
black>=23.0.0          # 代码格式化
mypy>=1.0.0            # 类型检查
```

---

## 3. 技术方案设计

### 核心架构
- **设计模式**: [工厂/单例/策略/装饰器]
- **异步策略**: [同步/异步/混合]
- **并发模型**: [threading/multiprocessing/asyncio]

### 数据结构选择
```python
from dataclasses import dataclass
from typing import Optional

@dataclass
class UserModel:
    id: int
    name: str
    email: str
    created_at: Optional[datetime] = None
```

### 类型注解策略
- **严格级别**: [strict/standard/minimal]
- **工具链**: mypy + pyright
- **覆盖率目标**: >80%

---

## 4. 代码实现

### 核心代码示例
```python
from typing import List, Dict, Optional

class DataProcessor:
    """数据处理核心类"""

    def __init__(self, config: Dict[str, Any]) -> None:
        """初始化处理器"""
        self.config = config
        self._validate_config()

    def process_batch(self, items: List[Dict]) -> List[Result]:
        """批量处理数据

        Args:
            items: 待处理数据列表

        Returns:
            处理结果列表

        Raises:
            ProcessingError: 处理失败时
        """
        results = []
        for item in items:
            try:
                result = self._process_single(item)
                results.append(result)
            except Exception as e:
                logger.error(f"处理失败: {item}", exc_info=True)
                raise ProcessingError(f"处理失败: {e}") from e
        return results
```

### Python最佳实践

#### 命名规范
- **类名**: PascalCase（`DataProcessor`）
- **函数/变量**: snake_case（`process_data`）
- **常量**: UPPER_SNAKE_CASE（`MAX_RETRIES`）
- **私有成员**: _leading_underscore（`_internal_method`）

#### 导入顺序
```python
# 1. 标准库
import os
from typing import List, Dict

# 2. 第三方库
import numpy as np
from fastapi import FastAPI

# 3. 本地模块
from .core.models import User
```

#### 异步编程示例
```python
import asyncio

async def fetch_data(url: str) -> Dict:
    """异步获取数据"""
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            return await response.json()

async def main():
    tasks = [fetch_data(url) for url in urls]
    results = await asyncio.gather(*tasks)
    return results
```

---

## 5. 性能优化

### 性能分析
- **性能瓶颈**: [定位]
- **优化方向**: [算法/数据结构/并发/缓存]

### 优化技术
```python
# 1. 使用生成器节省内存
def process_large_file(file_path):
    with open(file_path) as f:
        for line in f:  # 逐行处理，不一次性加载
            yield process_line(line)

# 2. 使用 functools.lru_cache
from functools import lru_cache

@lru_cache(maxsize=128)
def expensive_function(param):
    # 缓存计算结果
    return complex_calculation(param)

# 3. 列表推导式 vs map
# 推荐：[x*2 for x in items] 而非 map(lambda x: x*2, items)
```

---

## 6. 错误处理

### 异常处理策略
```python
# 自定义异常
class ProcessingError(Exception):
    """处理异常基类"""
    pass

class ValidationError(ProcessingError):
    """数据验证异常"""
    pass

# 异常处理示例
try:
    result = process_data(data)
except ValidationError as e:
    logger.warning(f"验证失败: {e}")
    return None
except ProcessingError as e:
    logger.error(f"处理失败: {e}")
    raise
except Exception as e:
    logger.critical(f"未知错误: {e}", exc_info=True)
    raise
```

---

## 7. 测试方案

### 测试框架选择
- **单元测试**: pytest
- **覆盖率**: pytest-cov
- **Mock**: unittest.mock

### 测试用例示例
```python
import pytest

class TestDataProcessor:
    def test_process_single(self):
        processor = DataProcessor(config={})
        result = processor.process_single({"id": 1})
        assert result.id == 1

    def test_process_batch_empty(self):
        processor = DataProcessor(config={})
        results = processor.process_batch([])
        assert results == []

    @pytest.mark.parametrize("input,expected", [
        ({"value": 1}, 1),
        ({"value": 2}, 2),
    ])
    def test_process_various_inputs(self, input, expected):
        processor = DataProcessor(config={})
        assert processor.process(input) == expected
```

---

## 8. 文档与维护

### 文档要求
- [ ] 函数文档字符串（Google/NumPy风格）
- [ ] 模块级docstring
- [ ] README.md（安装、使用、示例）
- [ ] 类型注解覆盖率>80%

### 代码质量工具
```bash
# 格式化
black .

# 类型检查
mypy src/

# 导入排序
isort .

# linting
pylint src/
```

---

## 9. 交付清单

### 交付物
- [ ] 源代码（符合PEP 8规范）
- [ ] 单元测试（覆盖率>80%）
- [ ] requirements.txt
- [ ] README.md
- [ ] API文档（如适用）
- [ ] 示例代码

### 部署指南
```bash
# 开发环境
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# 运行测试
pytest tests/

# 代码格式化
black src/ tests/
```
```

---

## 🟡 2. Golang Expert（Go专家）

### 核心职责
Go语言专项开发,包括高并发服务、微服务、CLI工具等

### 输出模板

```markdown
# Golang Expert - Go分析与实施方案

**任务类型**: [微服务/CLI/并发处理]
**Go版本**: 1.21+

---

## 1. 需求理解与确认

### 核心需求
- **功能描述**: [一句话概括]
- **并发需求**: [高并发/普通]
- **性能要求**: [响应时间/吞吐量]

### Go特性匹配度
- **优势**: [原生并发、高性能、编译型]
- **劣势**: [生态相对较小、学习曲线]

---

## 2. Go特性分析

### 项目结构设计
```
project/
├── cmd/
│   └── app/
│       └── main.go        # 入口
├── internal/
│   ├── handler/           # HTTP处理器
│   ├── service/           # 业务逻辑
│   ├── repository/        # 数据访问
│   └── model/             # 数据模型
├── pkg/                   # 公共库
├── go.mod
├── go.sum
├── Makefile
└── README.md
```

### Go版本选择
- **目标版本**: Go 1.21+
- **关键特性**:
  - Goroutines
  - Channels
  - Context
  - Generics (1.18+)

### 依赖管理
```go
// go.mod
module github.com/user/project

go 1.21

require (
    github.com/gin-gonic/gin v1.9.1
    github.com/stretchr/testify v1.8.4
)
```

---

## 3. 技术方案设计

### 核心架构
- **设计模式**: [Facade/Repository/Factory]
- **并发模型**: [Goroutine Pool/Channel/Fan-out]
- **错误处理**: [error wrapping/sentinel errors]

### 并发模式示例
```go
// Worker Pool模式
func worker(id int, jobs <-chan Task, results chan<- Result) {
    for j := range jobs {
        results <- process(j)
    }
}

func main() {
    jobs := make(chan Task, 100)
    results := make(chan Result, 100)

    // 启动worker
    for w := 1; w <= 5; w++ {
        go worker(w, jobs, results)
    }

    // 分发任务
    for _, j := range tasks {
        jobs <- j
    }
    close(jobs)

    // 收集结果
    for i := 1; i <= len(tasks); i++ {
        <-results
    }
}
```

---

## 4. 代码实现

### 核心代码示例
```go
package service

import (
    "context"
    "fmt"
)

type UserService struct {
    repo Repository
}

func NewUserService(repo Repository) *UserService {
    return &UserService{repo: repo}
}

func (s *UserService) GetUser(ctx context.Context, id int64) (*User, error) {
    if id <= 0 {
        return nil, fmt.Errorf("invalid id: %d", id)
    }

    user, err := s.repo.FindByID(ctx, id)
    if err != nil {
        return nil, fmt.Errorf("failed to find user: %w", err)
    }

    return user, nil
}
```

### Go最佳实践

#### 命名规范
- **包名**: 小写单词（`user`）
- **接口**: er结尾（`Reader`, `Writer`）
- **导出**: PascalCase（`UserData`）
- **私有**: camelCase（`internalData`）

#### 错误处理
```go
// 错误包装
if err != nil {
    return fmt.Errorf("failed to process: %w", err)
}

// 自定义错误
var ErrNotFound = errors.New("user not found")

// 错误判断
if errors.Is(err, ErrNotFound) {
    // 处理not found
}
```

---

## 5. 性能优化

### 性能分析
- **工具**: pprof, go test -bench
- **优化方向**: [减少内存分配/优化算法/并发]

### 优化技术
```go
// 1. 使用缓冲channel
ch := make(chan Result, 100)

// 2. 复用对象（sync.Pool）
var bufPool = sync.Pool{
    New: func() interface{} {
        return new(bytes.Buffer)
    },
}

// 3. 避免不必要的指针
// 使用值类型而非指针（除非很大）
```

---

## 6. 测试方案

### 测试示例
```go
func TestGetUser(t *testing.T) {
    tests := []struct {
        name    string
        id      int64
        want    *User
        wantErr bool
    }{
        {"valid", 1, &User{ID: 1}, false},
        {"invalid", -1, nil, true},
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            got, err := service.GetUser(context.Background(), tt.id)
            if (err != nil) != tt.wantErr {
                t.Errorf("GetUser() error = %v, wantErr %v", err, tt.wantErr)
            }
        })
    }
}
```

---

## 7. 交付清单

### 交付物
- [ ] 源代码（符合gofmt规范）
- [ ] 单元测试（go test）
- [ ] go.mod/go.sum
- [ ] README.md
- [ ] Makefile（build/test/lint）

### 构建与测试
```bash
# 格式化
go fmt ./...

# 测试
go test -v -race -cover ./...

# 构建
go build -o bin/app cmd/app/main.go

# 运行
./bin/app
```
```

---

## 🟠 3. Java Developer（Java开发专家）

### 核心职责
Java应用开发,包括企业级应用、Spring Boot、微服务等

### 输出模板（简化版）

```markdown
# Java Developer - Java分析与实施方案

**任务类型**: [Spring Boot/企业应用/微服务]
**Java版本**: 17+

---

## 1. 需求理解与确认

### 核心需求
- **功能描述**: [一句话概括]
- **应用类型**: [Web/API/批处理]
- **性能要求**: [TPS/响应时间]

---

## 2. Java特性分析

### 项目结构设计
```
project/
├── src/main/java/com/example/
│   ├── controller/        # 控制器
│   ├── service/           # 业务逻辑
│   ├── repository/        # 数据访问
│   ├── model/             # 数据模型
│   ├── config/            # 配置
│   └── Application.java   # 入口
├── src/test/java/
├── pom.xml / build.gradle
└── README.md
```

### 技术栈
- **框架**: Spring Boot 3.x
- **Java版本**: 17+
- **构建工具**: Maven/Gradle
- **依赖管理**: Spring Boot Starter

---

## 3. 代码实现示例

### 核心代码
```java
@Service
@Transactional
public class UserService {

    private final UserRepository repository;

    public UserService(UserRepository repository) {
        this.repository = repository;
    }

    public User getUserById(Long id) {
        return repository.findById(id)
            .orElseThrow(() ->
                new UserNotFoundException("User not found: " + id));
    }

    public User createUser(UserRequest request) {
        User user = new User();
        user.setName(request.getName());
        user.setEmail(request.getEmail());
        return repository.save(user);
    }
}
```

### 最佳实践
- **命名**: camelCase（变量/方法），PascalCase（类）
- **注解**: @Service, @Repository, @RestController
- **异常**: 自定义异常类
- **日志**: SLF4J + Logback

---

## 4. 测试方案

### 测试示例
```java
@SpringBootTest
class UserServiceTest {

    @Autowired
    private UserService userService;

    @MockBean
    private UserRepository userRepository;

    @Test
    void getUserById() {
        // given
        User user = new User(1L, "test");
        when(userRepository.findById(1L)).thenReturn(Optional.of(user));

        // when
        User result = userService.getUserById(1L);

        // then
        assertEquals("test", result.getName());
    }
}
```

---

## 5. 交付清单

### 交付物
- [ ] 源代码
- [ ] 单元测试（JUnit 5）
- [ ] pom.xml / build.gradle
- [ ] README.md

### 构建与运行
```bash
# Maven
mvn clean install
mvn spring-boot:run

# Gradle
./gradlew build
./gradlew bootRun
```
```

---

## 🔴 4. TypeScript/JavaScript Expert（TS/JS专家）

### 核心职责
前端开发、Node.js后端开发、全栈开发

### 输出模板（简化版）

```markdown
# TypeScript Expert - TS/JS分析与实施方案

**任务类型**: [前端/后端/全栈]
**TS版本**: 5.x

---

## 1. 需求理解与确认

### 核心需求
- **功能描述**: [一句话概括]
- **运行环境**: [Browser/Node.js]
- **框架**: [React/Vue/Angular/Express]

---

## 2. TS特性分析

### 项目结构
```
project/
├── src/
│   ├── components/       # 组件
│   ├── services/         # 服务
│   ├── types/            # 类型定义
│   ├── utils/            # 工具
│   └── index.ts
├── tests/
├── package.json
├── tsconfig.json
└── README.md
```

### 类型策略
- **严格模式**: strict
- **工具链**: ESLint + Prettier
- **测试**: Jest + Testing Library

---

## 3. 代码实现示例

### React组件示例
```typescript
interface Props {
  title: string;
  count: number;
  onIncrement: () => void;
}

export const Counter: React.FC<Props> = ({
  title,
  count,
  onIncrement
}) => {
  return (
    <div>
      <h2>{title}</h2>
      <p>Count: {count}</p>
      <button onClick={onIncrement}>Increment</button>
    </div>
  );
};
```

### Node.js服务示例
```typescript
import express from 'express';
import { Request, Response } from 'express';

const app = express();

app.get('/api/users', async (req: Request, res: Response) => {
  try {
    const users = await userService.getAll();
    res.json(users);
  } catch (error) {
    res.status(500).json({ error: 'Internal server error' });
  }
});

app.listen(3000);
```

---

## 4. 最佳实践

### 类型定义
```typescript
// 接口定义
interface User {
  id: number;
  name: string;
  email: string;
}

// 类型别名
type UserID = number;

// 泛型
interface ApiResponse<T> {
  data: T;
  status: number;
}

// 联合类型
type Status = 'pending' | 'success' | 'error';
```

### 异步处理
```typescript
// async/await
async function fetchData(): Promise<User> {
  const response = await fetch('/api/user');
  const data = await response.json();
  return data;
}

// 错误处理
try {
  const user = await fetchData();
} catch (error) {
  console.error('Failed:', error);
}
```

---

## 5. 交付清单

### 交付物
- [ ] 源代码（.ts/.tsx）
- [ ] 类型定义文件
- [ ] 单元测试
- [ ] package.json
- [ ] README.md

### 开发命令
```bash
# 安装依赖
npm install

# 开发
npm run dev

# 构建
npm run build

# 测试
npm test
```
```

---

## 🟢 5. Other Languages（其他语言专家）

### C++ Expert
```markdown
**核心职责**: C++高性能开发、系统编程

**关键特性**:
- RAII（资源获取即初始化）
- 智能指针（shared_ptr, unique_ptr）
- STL标准库
- 模板元编程

**项目结构**:
```
project/
├── include/     # 头文件
├── src/         # 源文件
├── tests/       # 测试
├── CMakeLists.txt
└── README.md
```
```

### Rust Expert
```markdown
**核心职责**: Rust系统编程、安全并发

**关键特性**:
- 所有权系统
- 借用检查
- 零成本抽象
- 模式匹配

**项目结构**:
```
project/
├── src/
│   ├── main.rs
│   └── lib.rs
├── tests/
├── Cargo.toml
└── README.md
```
```

### PHP Developer
```markdown
**核心职责**: PHP Web开发、Laravel应用

**关键特性**:
- Laravel框架
- Composer依赖管理
- PSR标准

**项目结构**:
```
project/
├── app/
│   ├── Http/
│   ├── Models/
│   └── Services/
├── resources/
├── composer.json
└── README.md
```
```

### Ruby Expert
```markdown
**核心职责**: Ruby/Rails Web开发

**关键特性**:
- Ruby on Rails
- Gem管理
- 优雅语法

**项目结构**:
```
project/
├── app/
│   ├── models/
│   ├── controllers/
│   └── views/
├── config/
├── Gemfile
└── README.md
```
```

### SQL Expert
```markdown
**核心职责**: 数据库设计、SQL优化

**关键特性**:
- SQL规范
- 索引优化
- 查询性能
- 事务管理

**输出示例**:
```sql
-- 表设计
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 索引
CREATE INDEX idx_users_email ON users(email);

-- 查询优化
EXPLAIN SELECT * FROM users WHERE email = ?;
```
```

---

## 📊 模板使用指南

### 选择合适的语言专家

1. **Python**: 数据分析、AI/ML、Web开发、自动化脚本
2. **Golang**: 微服务、高并发服务、CLI工具、分布式系统
3. **Java**: 企业级应用、Spring Boot、大数据处理
4. **TypeScript/JavaScript**: 前端开发、Node.js后端、全栈
5. **C++**: 系统编程、游戏开发、高性能应用
6. **Rust**: 系统编程、安全关键应用、WebAssembly
7. **PHP**: Web开发、Laravel应用
8. **Ruby**: Web开发、Rails应用
9. **SQL**: 数据库设计、查询优化

### 通用最佳实践

1. **代码规范**: 遵循语言官方风格指南
2. **类型安全**: 优先使用强类型（TS/Go/Rust/Java）
3. **错误处理**: 统一异常处理策略
4. **测试覆盖**: 单元测试覆盖率>80%
5. **文档完整**: API文档、README、注释
6. **版本控制**: Git + 常规提交规范

### 交付标准

- **代码质量**: 通过linter检查
- **测试完整**: 单元测试+集成测试
- **文档齐全**: README + API文档 + 示例
- **可运行**: 可直接构建运行
- **性能达标**: 满足性能要求

---

**模板版本**: v2.1.0
**维护者**: Smart Flow Team
**最后更新**: 2025-01-07
