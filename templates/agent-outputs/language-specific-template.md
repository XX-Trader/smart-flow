# 编程语言专项类 Agent 输出模板

> **适用 Agents**: python-expert, golang-expert, java-developer, cpp-engineer, rust-expert, c-developer, typescript-expert, javascript-developer, php-developer, ruby-expert, sql-expert
>
> **模板版本**: v2.1.0
> **创建时间**: 2026-01-07
> **更新历史**: 见文末

---

## 📋 输出结构

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

## 🎯 分层内容规范

### 第一层：语言通用结构（所有 Agent 必填）

```markdown
## 1. 需求理解与确认

### 核心需求
- **功能描述**: [一句话概括]
- **输入**: [数据格式、参数类型]
- **输出**: [返回格式、类型]
- **约束条件**: [性能/内存/兼容性]

### 语言特性匹配度
- **优势**: [该语言在此场景的优势]
- **劣势**: [需要注意的限制]
- **替代方案**: [是否更适合其他语言]

### 确认问题
- [ ] 需求边界是否清晰？
- [ ] 语言选型是否合理？
- [ ] 有无特殊约束（版本、依赖）？
```

---

### 第二层：语言专项定制（按语言类型）

#### 🔵 Python Expert（重点定制）

```markdown
## 2. Python 特性分析

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

### Python 版本选择
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

## 3. 技术方案设计

### 核心架构
- **设计模式**: [工厂/单例/策略/装饰器]
- **异步策略**: [同步/异步/混合]
- **并发模型**: [threading/multiprocessing/asyncio]

### 数据结构选择
```python
# 推荐使用 dataclass 定义数据模型
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

## 4. 代码实现

### 核心代码
```python
# 示例：带类型注解和文档字符串
from typing import List, Dict, Optional
from contextlib import contextmanager

class DataProcessor:
    """数据处理核心类

    Attributes:
        config: 配置字典
        cache: 缓存存储
    """

    def __init__(self, config: Dict[str, Any]) -> None:
        """初始化处理器

        Args:
            config: 配置参数字典

        Raises:
            ValueError: 配置无效时
        """
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

### Python 最佳实践

#### ✅ 命名规范
- **类名**: PascalCase（`DataProcessor`）
- **函数/变量**: snake_case（`process_data`）
- **常量**: UPPER_SNAKE_CASE（`MAX_RETRIES`）
- **私有成员**: _leading_underscore（`_internal_method`）

#### ✅ 导入顺序
```python
# 1. 标准库
import os
import sys
from typing import List, Dict

# 2. 第三方库
import numpy as np
from fastapi import FastAPI

# 3. 本地模块
from .core.models import User
from .utils.helpers import format_date
```

#### ✅ 异步编程规范
```python
import asyncio

async def fetch_data(urls: List[str]) -> List[Dict]:
    """异步并发获取数据"""
    tasks = [asyncio.create_task(fetch_single(url)) for url in urls]
    results = await asyncio.gather(*tasks, return_exceptions=True)
    return [r for r in results if not isinstance(r, Exception)]
```

#### ✅ 上下文管理器
```python
from contextlib import contextmanager

@contextmanager
def database_transaction(session):
    """数据库事务上下文管理器"""
    try:
        yield session
        session.commit()
    except Exception:
        session.rollback()
        raise
    finally:
        session.close()
```

## 5. Python 性能优化

### 性能分析工具
- **profiling**: `cProfile` + `pstats`
- **内存分析**: `memory_profiler`
- **可视化**: `snakeviz`

### 优化策略

#### 数据处理优化
```python
# ❌ 慢：循环拼接字符串
result = ""
for item in items:
    result += str(item)

# ✅ 快：使用 join
result = "".join(str(item) for item in items)
```

#### 缓存优化
```python
from functools import lru_cache
import time

@lru_cache(maxsize=128)
def expensive_computation(x: int) -> int:
    """带缓存的计算密集型函数"""
    time.sleep(1)  # 模拟耗时操作
    return x ** 2
```

#### 向量化计算（NumPy）
```python
import numpy as np

# ❌ 慢：Python 循环
result = [x * 2 for x in range(1000000)]

# ✅ 快：NumPy 向量化
arr = np.arange(1000000)
result = arr * 2
```

### 内存优化
- 使用生成器（`yield`）替代列表
- 及时释放大对象（`del large_object`）
- 使用 `__slots__` 减少类内存占用

```python
class OptimizedModel:
    """使用 __slots__ 优化内存"""
    __slots__ = ['id', 'name', 'value']

    def __init__(self, id: int, name: str, value: float):
        self.id = id
        self.name = name
        self.value = value
```

## 6. Python 错误处理

### 异常层次设计
```python
class BaseError(Exception):
    """基础异常类"""
    pass

class ValidationError(BaseError):
    """数据验证错误"""
    pass

class ProcessingError(BaseError):
    """处理错误"""
    pass

class ConfigurationError(BaseError):
    """配置错误"""
    pass
```

### 错误处理最佳实践

#### ✅ 明确捕获异常
```python
# ❌ 不好：捕获所有异常
try:
    process()
except Exception:
    pass

# ✅ 好：明确捕获
try:
    process()
except ValidationError as e:
    logger.warning(f"验证失败: {e}")
    raise
except ProcessingError as e:
    logger.error(f"处理失败: {e}")
    raise
```

#### ✅ 异常链（Exception Chaining）
```python
def load_config(path: str) -> Dict:
    """加载配置文件"""
    try:
        with open(path) as f:
            return json.load(f)
    except FileNotFoundError as e:
        raise ConfigurationError(f"配置文件不存在: {path}") from e
```

#### ✅ 资源清理
```python
# 使用 with 语句自动清理资源
with open('data.txt', 'r') as f:
    data = f.read()
    # 即使发生异常，文件也会自动关闭
```

## 7. Python 测试方案

### 测试框架
- **单元测试**: `pytest`
- **异步测试**: `pytest-asyncio`
- **覆盖率**: `pytest-cov`
- **Mock**: `unittest.mock`

### 测试结构
```
tests/
├── unit/
│   ├── test_models.py
│   ├── test_services.py
│   └── test_utils.py
├── integration/
│   ├── test_api.py
│   └── test_database.py
└── conftest.py          # pytest 配置和 fixtures
```

### 测试用例示例
```python
import pytest
from unittest.mock import Mock, patch
from app.core.processor import DataProcessor

class TestDataProcessor:
    """DataProcessor 测试类"""

    @pytest.fixture
    def processor(self):
        """测试实例"""
        return DataProcessor(config={"max_retries": 3})

    def test_process_success(self, processor):
        """测试正常处理流程"""
        data = {"id": 1, "value": 100}
        result = processor.process(data)
        assert result["status"] == "success"

    def test_process_validation_error(self, processor):
        """测试验证失败场景"""
        invalid_data = {"id": -1}
        with pytest.raises(ValidationError):
            processor.process(invalid_data)

    @pytest.mark.asyncio
    async def test_async_process(self, processor):
        """测试异步处理"""
        items = [{"id": i} for i in range(10)]
        results = await processor.process_async(items)
        assert len(results) == 10
```

### 测试覆盖率目标
- **核心逻辑**: 90%+
- **工具函数**: 80%+
- **整体**: 75%+

## 8. 文档与维护

### 代码文档
```python
def complex_algorithm(data: List[Dict], threshold: float = 0.5) -> List[Dict]:
    """复杂算法处理函数

    该函数实现了高性能数据处理算法，包括以下步骤：
    1. 数据预处理
    2. 特征提取
    3. 阈值过滤

    Args:
        data: 输入数据列表，每个元素为字典类型
        threshold: 过滤阈值，范围 [0, 1]，默认 0.5

    Returns:
        过滤后的数据列表

    Raises:
        ValueError: 当 threshold 不在有效范围时
        ProcessingError: 处理过程中出现错误时

    Examples:
        >>> data = [{"value": 0.8}, {"value": 0.3}]
        >>> complex_algorithm(data, threshold=0.5)
        [{"value": 0.8}]

    Note:
        该函数对内存使用进行了优化，适合处理大规模数据集

    See Also:
        simple_algorithm: 简化版算法
    """
    if not 0 <= threshold <= 1:
        raise ValueError(f"threshold 必须在 [0, 1] 范围内，当前值: {threshold}")

    # 实现细节...
```

### 类型检查
```python
# mypy.ini
[mypy]
python_version = 3.11
warn_return_any = True
warn_unused_configs = True
disallow_untyped_defs = True
```

### 代码格式化
```python
# pyproject.toml
[tool.black]
line-length = 100
target-version = ['py311']

[tool.isort]
profile = "black"
line_length = 100
```

## 9. 性能基准

### 性能指标
- **吞吐量**: [X] ops/s
- **延迟**: P50 < [X]ms, P99 < [X]ms
- **内存**: 峰值 < [X]MB
- **并发**: 支持 [X] 并发请求

### 优化前后对比
| 指标 | 优化前 | 优化后 | 提升 |
|------|--------|--------|------|
| 吞吐量 | 1000 ops/s | 5000 ops/s | 5x |
| 内存占用 | 500MB | 200MB | 60% |
| P99 延迟 | 200ms | 50ms | 75% |

## 10. 交付清单

### 代码文件
- [ ] `src/core/` - 核心业务逻辑
- [ ] `src/models/` - 数据模型
- [ ] `src/utils/` - 工具函数
- [ ] `tests/` - 完整测试套件
- [ ] `requirements.txt` - 依赖清单
- [ ] `pyproject.toml` - 项目配置

### 质量检查
- [ ] mypy 类型检查通过
- [ ] pytest 测试覆盖率 >75%
- [ ] black 格式化通过
- [ ] pylint 代码质量 >8.0

### 文档
- [ ] README.md - 项目说明
- [ ] API.md - API 文档（如适用）
- [ ] CHANGELOG.md - 变更日志

### 性能验证
- [ ] 基准测试报告
- [ ] 性能优化建议
```

---

#### 🟡 Go Expert（重点定制）

```markdown
## 2. Go 特性分析

### 项目结构设计（标准布局）
```
project/
├── cmd/
│   └── app/
│       └── main.go           # 应用入口
├── internal/
│   ├── handler/              # 处理器
│   ├── service/              # 业务逻辑
│   ├── repository/           # 数据访问
│   └── model/                # 数据模型
├── pkg/
│   └── util/                 # 公共工具库
├── api/
│   └── proto/                # Protobuf 定义（如需要）
├── go.mod
├── go.sum
├── Makefile
└── README.md
```

### Go 版本选择
- **目标版本**: Go 1.21+
- **关键特性**:
  - Generics（泛型）
  - Goroutines
  - Channels
  - Context（上下文控制）

### 依赖管理
```go
// go.mod
module github.com/example/project

go 1.21

require (
    github.com/gin-gonic/gin v1.9.1          // Web 框架（如需要）
    github.com/go-redis/redis/v8 v8.11.5     // Redis 客户端
    go.uber.org/zap v1.25.0                  // 结构化日志
    github.com/stretchr/testify v1.8.4       // 测试工具
)
```

## 3. 技术方案设计

### 核心架构
- **并发模型**: Goroutines + Channels
- **错误处理**: 显式错误返回，不使用异常
- **设计模式**: Interface-based design

### Interface 设计
```go
// 定义接口而非具体实现
type DataProcessor interface {
    Process(ctx context.Context, data Input) (Output, error)
    Validate(data Input) error
}

// 多态实现
type ImageProcessor struct{}
type TextProcessor struct{}

func (p *ImageProcessor) Process(ctx context.Context, data Input) (Output, error) {
    // 实现...
}
```

### 错误处理策略
```go
// 自定义错误类型
type ValidationError struct {
    Field   string
    Message string
}

func (e *ValidationError) Error() string {
    return fmt.Sprintf("validation failed on field %s: %s", e.Field, e.Message)
}

// 错误包装
func process(data string) error {
    result, err := validate(data)
    if err != nil {
        return fmt.Errorf("validate failed: %w", err)  // 使用 %w 保留错误链
    }
    return nil
}
```

## 4. 代码实现

### 核心代码
```go
// internal/service/processor.go
package service

import (
    "context"
    "fmt"
    "log"
)

type Processor struct {
    config Config
    logger *log.Logger
}

func NewProcessor(cfg Config) *Processor {
    return &Processor{
        config: cfg,
        logger: log.Default(),
    }
}

// Process 处理数据
// ctx: 用于控制超时和取消
// data: 输入数据
// 返回: 处理结果和可能的错误
func (p *Processor) Process(ctx context.Context, data Data) (Result, error) {
    // 1. 验证输入
    if err := p.validate(data); err != nil {
        return Result{}, fmt.Errorf("validation failed: %w", err)
    }

    // 2. 检查上下文取消
    select {
    case <-ctx.Done():
        return Result{}, ctx.Err()
    default:
    }

    // 3. 处理数据
    result, err := p.processData(ctx, data)
    if err != nil {
        return Result{}, fmt.Errorf("process failed: %w", err)
    }

    return result, nil
}

// processData 私有方法
func (p *Processor) processData(ctx context.Context, data Data) (Result, error) {
    // 实现细节...
    return Result{}, nil
}

func (p *Processor) validate(data Data) error {
    if data.ID == 0 {
        return &ValidationError{Field: "ID", Message: "cannot be zero"}
    }
    return nil
}
```

### Go 最佳实践

#### ✅ 命名规范
- **包名**: 小写单词，不使用下划线（`processor`）
- **导出**: PascalCase（`ProcessData`）
- **私有**: camelCase（`processData`）
- **接口**: 通常以 -er 结尾（`Processor`, `Reader`）

#### ✅ 错误处理
```go
// ❌ 不好：忽略错误
data, _ := readFile()

// ✅ 好：总是处理错误
data, err := readFile()
if err != nil {
    return fmt.Errorf("read file failed: %w", err)
}
```

#### ✅ 并发模式
```go
// Worker Pool 模式
func workerPool(ctx context.Context, jobs <-chan Job, results chan<- Result) {
    const numWorkers = 10

    for i := 0; i < numWorkers; i++ {
        go func() {
            for {
                select {
                case job, ok := <-jobs:
                    if !ok {
                        return
                    }
                    result := process(job)
                    results <- result
                case <-ctx.Done():
                    return
                }
            }
        }()
    }
}
```

#### ✅ Context 使用
```go
// 带超时的处理
func (p *Processor) ProcessWithTimeout(data Data) error {
    ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
    defer cancel()

    result, err := p.Process(ctx, data)
    if err != nil {
        return err
    }

    // 使用结果...
    return nil
}
```

#### ✅ Defer 使用
```go
func processFile(path string) error {
    file, err := os.Open(path)
    if err != nil {
        return err
    }
    defer file.Close()  // 确保资源释放

    // 处理文件...
    return nil
}
```

## 5. Go 性能优化

### 性能分析工具
- **CPU profiling**: `pprof`
- **内存分析**: `pprof` + `go tool pprof`
- **竞态检测**: `go run -race`

### 优化策略

#### 减少内存分配
```go
// ❌ 慢：频繁分配内存
func concatenate(items []string) string {
    result := ""
    for _, item := range items {
        result += item  // 每次都创建新字符串
    }
    return result
}

// ✅ 快：使用 strings.Builder
func concatenate(items []string) string {
    var builder strings.Builder
    builder.Grow(len(items) * 10)  // 预分配
    for _, item := range items {
        builder.WriteString(item)
    }
    return builder.String()
}
```

#### 对象池（sync.Pool）
```go
var bufferPool = sync.Pool{
    New: func() interface{} {
        return new(bytes.Buffer)
    },
}

func process() {
    buf := bufferPool.Get().(*bytes.Buffer)
    defer func() {
        buf.Reset()
        bufferPool.Put(buf)
    }()

    // 使用 buf...
}
```

#### 预分配切片容量
```go
// ❌ 慢：动态扩容
items := make([]int, 0)
for i := 0; i < 1000; i++ {
    items = append(items, i)  // 多次重新分配
}

// ✅ 快：预分配容量
items := make([]int, 0, 1000)
for i := 0; i < 1000; i++ {
    items = append(items, i)
}
```

### Goroutine 优化
```go
// 限制并发数
func processConcurrent(items []Item) {
    sem := make(chan struct{}, 100)  // 最多 100 个并发
    var wg sync.WaitGroup

    for _, item := range items {
        wg.Add(1)
        sem <- struct{}{}  // 获取信号量

        go func(item Item) {
            defer wg.Done()
            defer func() { <-sem }()  // 释放信号量

            process(item)
        }(item)
    }

    wg.Wait()
}
```

## 6. Go 错误处理

### 错误类型设计
```go
// 错误接口
type Error interface {
    error
    Type() string
    Code() int
}

// 实现
type AppError struct {
    Type    string
    Code    int
    Message string
    Err     error
}

func (e *AppError) Error() string {
    if e.Err != nil {
        return fmt.Sprintf("%s: %s (%v)", e.Type, e.Message, e.Err)
    }
    return fmt.Sprintf("%s: %s", e.Type, e.Message)
}

func (e *AppError) Type() string { return e.Type }
func (e *AppError) Code() int { return e.Code }

func (e *AppError) Unwrap() error { return e.Err }
```

### 错误处理最佳实践

#### ✅ 早期返回
```go
func process(data Data) error {
    if data.ID == 0 {
        return ErrInvalidID
    }
    if data.Name == "" {
        return ErrEmptyName
    }

    // 继续处理...
    return nil
}
```

#### ✅ 错误包装
```go
if err := db.Save(data); err != nil {
    return fmt.Errorf("save data failed: %w", err)  // %w 保留错误链
}
```

#### ✅ 错误检查
```go
// 检查特定错误
if errors.Is(err, context.DeadlineExceeded) {
    // 处理超时
}

// 检查错误类型
var validationErr *ValidationError
if errors.As(err, &validationErr) {
    // 处理验证错误
}
```

## 7. Go 测试方案

### 测试框架
- **标准库**: `testing`
- **断言库**: `testify/assert`
- **Mock**: `gomock`, `testify/mock`
- **覆盖率**: `go test -cover`

### 测试结构
```
internal/
├── service/
│   ├── processor.go
│   ├── processor_test.go       # 单元测试
│   └── processor_bench_test.go # 基准测试
```

### 测试用例示例
```go
// internal/service/processor_test.go
package service

import (
    "context"
    "testing"
    "time"

    "github.com/stretchr/testify/assert"
    "github.com/stretchr/testify/require"
)

func TestProcessor_Process(t *testing.T) {
    tests := []struct {
        name    string
        input   Data
        want    Result
        wantErr bool
    }{
        {
            name:  "success case",
            input: Data{ID: 1, Name: "test"},
            want:  Result{Status: "ok"},
            wantErr: false,
        },
        {
            name:    "validation error",
            input:   Data{ID: 0},
            wantErr: true,
        },
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            p := NewProcessor(Config{})

            got, err := p.Process(context.Background(), tt.input)

            if tt.wantErr {
                require.Error(t, err)
                return
            }

            require.NoError(t, err)
            assert.Equal(t, tt.want, got)
        })
    }
}

// 并发测试
func TestProcessor_Concurrent(t *testing.T) {
    p := NewProcessor(Config{})
    ctx := context.Background()

    const goroutines = 100
    var wg sync.WaitGroup

    for i := 0; i < goroutines; i++ {
        wg.Add(1)
        go func(id int) {
            defer wg.Done()

            data := Data{ID: id, Name: "test"}
            _, err := p.Process(ctx, data)
            assert.NoError(t, err)
        }(i)
    }

    wg.Wait()
}

// 基准测试
func BenchmarkProcessor_Process(b *testing.B) {
    p := NewProcessor(Config{})
    ctx := context.Background()
    data := Data{ID: 1, Name: "test"}

    b.ResetTimer()
    for i := 0; i < b.N; i++ {
        _, _ = p.Process(ctx, data)
    }
}

// 表格驱动测试
func TestProcessor_Validate(t *testing.T) {
    p := NewProcessor(Config{})

    tests := map[string]struct {
        input Data
        err   error
    }{
        "valid data": {
            input: Data{ID: 1, Name: "test"},
            err:   nil,
        },
        "zero ID": {
            input: Data{ID: 0, Name: "test"},
            err:   ErrInvalidID,
        },
        "empty name": {
            input: Data{ID: 1, Name: ""},
            err:   ErrEmptyName,
        },
    }

    for name, tc := range tests {
        t.Run(name, func(t *testing.T) {
            err := p.Validate(tc.input)
            assert.Equal(t, tc.err, err)
        })
    }
}
```

### 测试覆盖率
```bash
# 运行测试并显示覆盖率
go test ./... -coverprofile=coverage.out
go tool cover -html=coverage.out

# 目标覆盖率: 75%+
```

## 8. 文档与维护

### 代码文档
```go
// Process 处理输入数据并返回结果
//
// 该方法执行以下操作：
// 1. 验证输入数据的有效性
// 2. 检查上下文是否已取消
// 3. 执行核心处理逻辑
// 4. 返回处理结果
//
// 参数：
//   ctx - 用于控制超时和取消的上下文
//   data - 包含 ID 和 Name 的输入数据结构
//
// 返回：
//   Result - 处理结果，包含状态和输出数据
//   error - 处理失败时返回错误，成功时为 nil
//
// 错误类型：
//   - *ValidationError: 输入数据验证失败
//   - context.DeadlineExceeded: 处理超时
//   - context.Canceled: 操作被取消
//
// 示例：
//   p := NewProcessor(Config{})
//   result, err := p.Process(context.Background(), Data{ID: 1, Name: "test"})
//   if err != nil {
//       log.Fatalf("处理失败: %v", err)
//   }
//   fmt.Printf("结果: %+v\n", result)
func (p *Processor) Process(ctx context.Context, data Data) (Result, error) {
    // 实现...
}
```

### Go Doc 生成
```bash
# 生成文档
go doc -all ./...

# 启动文档服务器
godoc -http=:6060
```

### 代码规范
```bash
# 格式化代码
go fmt ./...

# 静态检查
go vet ./...

# 使用 golangci-lint
golangci-lint run
```

## 9. 性能基准

### 性能指标
- **吞吐量**: [X] req/s
- **延迟**: P50 < [X]ms, P99 < [X]ms
- **内存**: 峰值 < [X]MB
- **Goroutine**: 峰值 < [X] 个

### 基准测试
```bash
# 运行基准测试
go test -bench=. -benchmem

# 输出示例：
# BenchmarkProcessor_Process-8   500000   3200 ns/op   512 B/op   10 allocs/op
```

### pprof 分析
```go
import (
    _ "net/http/pprof"
    "net/http"
)

func main() {
    go func() {
        log.Println(http.ListenAndServe("localhost:6060", nil))
    }()

    // 应用代码...
}
```

```bash
# CPU 分析
go tool pprof http://localhost:6060/debug/pprof/profile

# 内存分析
go tool pprof http://localhost:6060/debug/pprof/heap
```

## 10. 交付清单

### 代码文件
- [ ] `cmd/app/main.go` - 应用入口
- [ ] `internal/` - 内部包
- [ ] `pkg/` - 公共库（如需要）
- [ ] `go.mod` / `go.sum` - 依赖管理
- [ ] `Makefile` - 构建脚本
- [ ] `Dockerfile` - 容器化（如需要）

### 质量检查
- [ ] `go test ./...` - 所有测试通过
- [ ] `go vet ./...` - 静态检查通过
- [ ] `go fmt ./...` - 代码格式化
- [ ] `golangci-lint run` - Lint 检查
- [ ] `go test -cover` - 覆盖率 >75%

### 文档
- [ ] README.md - 项目说明
- [ ] API.md - API 文档（如适用）
- [ ] CONTRIBUTING.md - 贡献指南

### 构建与部署
- [ ] `make build` - 构建成功
- [ ] `make test` - 测试通过
- [ ] 二进制文件生成
```

---

#### 🟢 TypeScript Expert

```markdown
## 2. TypeScript 特性分析

### 项目结构设计
```
project/
├── src/
│   ├── core/           # 核心业务逻辑
│   ├── types/          # 类型定义
│   ├── utils/          # 工具函数
│   └── config/         # 配置管理
├── tests/
│   ├── unit/
│   └── integration/
├── package.json
├── tsconfig.json
└── README.md
```

### TypeScript 版本选择
- **目标版本**: TypeScript 5.0+
- **编译目标**: ES2020+
- **严格模式**: 启用

### 依赖管理
```json
{
  "devDependencies": {
    "typescript": "^5.0.0",
    "@types/node": "^20.0.0",
    "vitest": "^1.0.0",
    "eslint": "^8.0.0",
    "prettier": "^3.0.0"
  }
}
```

## 3. 类型系统设计

### 类型定义
```typescript
// types/models.ts
export interface UserData {
  id: number;
  name: string;
  email: string;
  createdAt: Date;
}

export type UserStatus = 'active' | 'inactive' | 'pending';

export interface UserResponse extends UserData {
  status: UserStatus;
  metadata?: Record<string, unknown>;
}

// 泛型类型
export interface ApiResponse<T> {
  data: T;
  status: number;
  message: string;
}

export type PaginatedResponse<T> = ApiResponse<{
  items: T[];
  total: number;
  page: number;
  pageSize: number;
}>;
```

### 类型守卫
```typescript
function isUserData(data: unknown): data is UserData {
  return (
    typeof data === 'object' &&
    data !== null &&
    'id' in data &&
    'name' in data &&
    'email' in data
  );
}
```

## 4. 最佳实践

#### ✅ 类型安全
```typescript
// ❌ 不好：使用 any
function process(data: any) {
  return data.value;
}

// ✅ 好：明确类型
function process(data: { value: number }): number {
  return data.value;
}
```

#### ✅ 不可变性
```typescript
import { Readonly } from 'typescript';

// 使用 Readonly
function process(data: Readonly<UserData>): void {
  // data.id = 2; // 编译错误
}
```

#### ✅ 类型推导
```typescript
// 利用类型推导
const users = [
  { id: 1, name: 'Alice' },
  { id: 2, name: 'Bob' },
]; // 类型自动推导为 { id: number; name: string; }[]
```

## 5. 工具配置

### tsconfig.json
```json
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "commonjs",
    "strict": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "resolveJsonModule": true,
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules"]
}
```

## 10. 交付清单

### 代码文件
- [ ] `src/` - 源代码
- [ ] `tests/` - 测试文件
- [ ] `tsconfig.json` - TS 配置
- [ ] `package.json` - 依赖管理

### 质量检查
- [ ] `tsc --noEmit` - 类型检查通过
- [ ] `vitest` - 测试通过
- [ ] `eslint` - Lint 检查
```

---

#### 🔴 SQL Expert

```markdown
## 2. SQL 特性分析

### SQL 方言选择
- **数据库**: [PostgreSQL / MySQL / SQLite / SQL Server]
- **版本**: [具体版本]
- **特性**: [窗口函数 / CTE / 存储过程]

## 3. 查询设计

### 查询结构
```sql
-- 标准查询模板
WITH cte_name AS (
    -- CTE 逻辑
    SELECT
        column1,
        column2
    FROM table1
    WHERE condition
)
SELECT
    t1.column1,
    t2.column2
FROM cte_name t1
JOIN table2 t2 ON t1.id = t2.id
WHERE t2.status = 'active'
ORDER BY t1.created_at DESC
LIMIT 100;
```

### 性能优化

#### 索引策略
```sql
-- 创建索引
CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_user_created_at ON users(created_at DESC);

-- 复合索引
CREATE INDEX idx_order_user_status ON orders(user_id, status);
```

#### 查询优化
```sql
-- ❌ 慢：SELECT *
SELECT * FROM users WHERE email = 'test@example.com';

-- ✅ 快：只查询需要的列
SELECT id, name FROM users WHERE email = 'test@example.com';

-- ❌ 慢：在索引列上使用函数
SELECT * FROM users WHERE YEAR(created_at) = 2024;

-- ✅ 快：使用范围查询
SELECT * FROM users
WHERE created_at >= '2024-01-01'
  AND created_at < '2025-01-01';
```

## 4. 最佳实践

#### ✅ 命名规范
- **表名**: snake_case，复数形式（`users`, `orders`）
- **列名**: snake_case（`user_id`, `created_at`）
- **索引**: `idx_table_columns`（`idx_users_email`）
- **外键**: `fk_table_column`（`fk_orders_user_id`）

#### ✅ 事务处理
```sql
BEGIN;

-- 操作 1
UPDATE accounts SET balance = balance - 100 WHERE id = 1;

-- 操作 2
UPDATE accounts SET balance = balance + 100 WHERE id = 2;

-- 验证
-- SELECT balance FROM accounts WHERE id IN (1, 2);

COMMIT;
-- 或 ROLLBACK;
```

#### ✅ 参数化查询
```sql
-- ❌ 危险：SQL 注入风险
SELECT * FROM users WHERE name = '` + userInput + `';

-- ✅ 安全：参数化查询
SELECT * FROM users WHERE name = $1;
```

## 5. 测试方案

### 测试数据
```sql
-- 创建测试表
CREATE TABLE test_users AS
SELECT * FROM users LIMIT 100;

-- 测试查询
EXPLAIN ANALYZE
SELECT * FROM test_users WHERE email = 'test@example.com';
```

## 10. 交付清单

### SQL 文件
- [ ] `schema.sql` - 数据库结构
- [ ] `queries.sql` - 业务查询
- [ ] `indexes.sql` - 索引定义
- [ ] `tests.sql` - 测试用例

### 文档
- [ ] `ER_DIAGRAM.md` - 实体关系图
- [ ] `PERFORMANCE.md` - 性能分析
```

---

## 📊 其他语言（简化版）

### JavaScript / PHP / Ruby / Java / C++ / Rust / C

```markdown
## 2. 语言特性分析
### 版本选择
### 项目结构
### 依赖管理

## 3. 技术方案
### 架构设计
### 核心模式

## 4. 代码实现
### 核心代码示例
### 最佳实践

## 5. 性能优化
### 优化策略
### 工具使用

## 6. 错误处理
### 异常设计
### 处理模式

## 7. 测试方案
### 测试框架
### 用例示例

## 8. 文档与维护
### 代码文档
### 工具配置

## 9. 性能基准
### 性能指标
### 优化建议

## 10. 交付清单
```

---

## 🔄 版本历史

| 版本 | 日期 | 变更说明 |
|------|------|---------|
| v2.1.0 | 2026-01-07 | 初始版本，重点定制 Python 和 Go 模板 |

---

## 📝 使用说明

1. **选择对应语言模板**：根据任务使用的语言选择对应章节
2. **填写必填字段**：所有 `[ ]` 占位符需要替换
3. **保持结构一致**：输出必须遵循 10 章节结构
4. **代码可运行**：所有代码示例必须经过验证
5. **文档完整**：交付清单中所有项目必须完成

---

## ⚠️ 注意事项

1. **语言特性**：充分利用语言特性，不要写成"伪代码"
2. **最佳实践**：遵循社区公认的最佳实践
3. **性能优先**：给出性能优化建议和基准测试
4. **错误处理**：显式处理错误，不要忽略
5. **测试覆盖**：提供完整的测试方案
