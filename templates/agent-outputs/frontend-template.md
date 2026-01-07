# 前端开发类 Agent 输出模板

版本：v2.1.0
更新日期：2025-01-07
适用 Agent 类型：前端开发类（frontend-developer、React/Vue 开发、性能优化等）

---

## 📋 通用前端输出模板（适用所有前端 Agent）

### 1. 任务理解与确认

#### 原始需求
[用户原始需求描述]

#### 需求澄清与确认
- [ ] 核心功能范围确认
- [ ] 技术栈约束确认
- [ ] 性能要求确认
- [ ] 浏览器兼容性要求
- [ ] 交付物确认

**确认后的需求**：
- **核心目标**：[一句话描述]
- **功能范围**：
  1. [功能点1]
  2. [功能点2]
  3. ...
- **技术约束**：
  - 框架版本：[如 React 18.2+]
  - 构建工具：[如 Vite 5.0]
  - 浏览器支持：[如 Chrome 90+, Edge 90+]
- **性能指标**：
  - 首屏加载：< 2s
  - 交互响应：< 100ms
  - Lighthouse 分数：> 90

---

### 2. 技术方案设计

#### 2.1 架构设计
**技术栈选择**：
- 核心框架：[React/Vue/Next.js] + 版本
- UI 组件库：[Ant Design/Material-UI/Element Plus]
- 状态管理：[Redux/Zustand/Pinia]
- 路由方案：[React Router/Vue Router/Next.js App Router]
- HTTP 客户端：[Axios/Fetch API]
- 样式方案：[CSS Modules/Tailwind CSS/Styled Components]
- 构建工具：[Vite/Webpack/Next.js 内置]
- 代码规范：[ESLint + Prettier]

**选择理由**：
- 框架选择：[基于项目规模、团队技术栈、生态成熟度]
- UI 库选择：[设计系统匹配度、组件丰富度、性能]
- 状态管理：[数据复杂度、团队经验、性能要求]

#### 2.2 目录结构设计
```
src/
├── assets/           # 静态资源（图片、字体、图标）
├── components/       # 通用组件
│   ├── common/      # 基础组件（Button、Input）
│   ├── business/    # 业务组件
│   └── layouts/     # 布局组件（Header、Sidebar）
├── pages/           # 页面组件
│   ├── HomePage/
│   ├── Dashboard/
│   └── ...
├── hooks/           # 自定义 Hooks（React）
├── stores/          # 状态管理
├── services/        # API 服务层
├── utils/           # 工具函数
├── types/           # TypeScript 类型定义
├── styles/          # 全局样式
├── router/          # 路由配置
└── App.tsx          # 应用入口
```

**目录设计原则**：
- 按功能模块划分（而非文件类型）
- 组件颗粒度：可复用性 vs 复杂度平衡
- 避免深层嵌套（最多 3-4 层）

---

### 3. 核心组件设计

#### 3.1 组件架构
**组件分层**：
1. **原子组件（Atomic Components）**：
   - Button, Input, Select, Modal
   - 特点：高度可复用、零业务逻辑

2. **分子组件（Molecular Components）**：
   - SearchBar, FormField, Card
   - 特点：组合原子组件、包含简单业务逻辑

3. **组织组件（Organism Components）**：
   - Header, Sidebar, DataTable
   - 特点：复杂 UI 结构、包含中等复杂度逻辑

4. **页面组件（Page Components）**：
   - HomePage, Dashboard, Settings
   - 特点：完整页面、数据获取、状态管理

#### 3.2 关键组件设计

**示例：DataTable 组件**
```typescript
interface DataTableProps<T> {
  data: T[];
  columns: Column<T>[];
  loading?: boolean;
  pagination?: PaginationConfig;
  onRowClick?: (row: T) => void;
  selection?: {
    selectedRows: T[];
    onSelect: (rows: T[]) => void;
  };
}

// 功能清单：
// ✅ 数据展示（支持自定义列渲染）
// ✅ 排序（本地/远程）
// ✅ 分页（前端/后端）
// ✅ 筛选（列筛选/全局搜索）
// ✅ 行选择（单选/多选）
// ✅ 空状态、加载状态、错误状态
```

**组件设计原则**：
- 单一职责：每个组件只做一件事
- Props 最小化：只暴露必要的可配置项
- 组合优于继承：使用 children 或 render props
- 可测试性：逻辑与视图分离

---

### 4. API 集成与数据流

#### 4.1 API 服务层设计
```typescript
// services/api.ts - 统一的 API 客户端
import axios from 'axios';

const apiClient = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL,
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json',
  },
});

// 请求拦截器（添加 Token）
apiClient.interceptors.request.use((config) => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

// 响应拦截器（统一错误处理）
apiClient.interceptors.response.use(
  (response) => response.data,
  (error) => {
    if (error.response?.status === 401) {
      // 跳转登录
    }
    return Promise.reject(error);
  }
);

// services/userService.ts - 业务 API 封装
export const userService = {
  getUsers: (params: GetUserParams) =>
    apiClient.get('/users', { params }),
  createUser: (data: CreateUserDto) =>
    apiClient.post('/users', data),
  updateUser: (id: string, data: UpdateUserDto) =>
    apiClient.put(`/users/${id}`, data),
  deleteUser: (id: string) =>
    apiClient.delete(`/users/${id}`),
};
```

#### 4.2 数据流方案
**推荐方案（基于复杂度）**：

| 数据复杂度 | 推荐方案 | 适用场景 |
|-----------|---------|---------|
| 简单（单组件） | React useState + useEffect | 表单、弹窗、简单列表 |
| 中等（跨组件共享） | Context API / Zustand | 用户信息、主题、购物车 |
| 复杂（大量状态+时间旅行） | Redux Toolkit | 大型应用、复杂业务逻辑 |

**示例：Zustand 状态管理**
```typescript
// stores/userStore.ts
import create from 'zustand';

interface UserState {
  user: User | null;
  loading: boolean;
  error: string | null;
  fetchUser: () => Promise<void>;
  updateUser: (data: UpdateUserDto) => Promise<void>;
}

export const useUserStore = create<UserState>((set) => ({
  user: null,
  loading: false,
  error: null,

  fetchUser: async () => {
    set({ loading: true, error: null });
    try {
      const user = await userService.getCurrentUser();
      set({ user, loading: false });
    } catch (error) {
      set({ error: error.message, loading: false });
    }
  },

  updateUser: async (data) => {
    set({ loading: true });
    try {
      const updatedUser = await userService.updateUser(data);
      set({ user: updatedUser, loading: false });
    } catch (error) {
      set({ error: error.message, loading: false });
    }
  },
}));
```

---

### 5. 路由配置

#### 5.1 路由设计
```typescript
// router/index.tsx
import { createBrowserRouter } from 'react-router-dom';
import { MainLayout } from '@/components/layouts/MainLayout';
import { HomePage } from '@/pages/HomePage';
import { DashboardPage } from '@/pages/DashboardPage';
import { NotFoundPage } from '@/pages/NotFoundPage';

export const router = createBrowserRouter([
  {
    path: '/',
    element: <MainLayout />,
    errorElement: <NotFoundPage />,
    children: [
      { index: true, element: <HomePage /> },
      {
        path: 'dashboard',
        element: <DashboardPage />,
        loader: dashboardLoader, // 数据预加载
      },
      {
        path: 'users',
        children: [
          { index: true, element: <UserListPage /> },
          { path: ':id', element: <UserDetailPage /> },
        ],
      },
    ],
  },
]);

// 路由权限控制
export const ProtectedRoute = ({ children, requiredRole }) => {
  const { user } = useAuthStore();
  if (!user) return <Navigate to="/login" />;
  if (requiredRole && !hasRole(user, requiredRole)) {
    return <Navigate to="/unauthorized" />;
  }
  return children;
};
```

#### 5.2 路由最佳实践
- 使用嵌套路由组织布局
- 使用 `loader` 预加载数据（Next.js/React Router 6.4+）
- 懒加载路由组件（`React.lazy` + `Suspense`）
- 集中管理路由常量（避免硬编码路径）

---

### 6. 样式方案

#### 6.1 样式架构选择
**方案对比**：

| 方案 | 优点 | 缺点 | 适用场景 |
|-----|------|------|---------|
| **CSS Modules** | 简单、隔离性好、原生支持 | 动态样式繁琐 | 中小型项目 |
| **Tailwind CSS** | 开发快、一致性高、体积小 | 类名冗长、学习成本 | 快速开发、设计系统完善 |
| **Styled Components** | 动态样式强、主题方便 | 运行时开销、SSR 复杂 | 高度定制 UI、动画场景 |
| **CSS-in-JS (Emotion)** | 灵活、性能可优化 | 包体积大、调试复杂 | 大型应用、主题系统 |

**推荐**：
- 新项目：Tailwind CSS（配合 shadcn/ui）
- 遗留项目：CSS Modules（渐进迁移）
- 设计系统完善：Styled Components

#### 6.2 Tailwind CSS 配置示例
```javascript
// tailwind.config.js
module.exports = {
  content: ['./src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#f0f9ff',
          500: '#0ea5e9',
          900: '#0c4a6e',
        },
      },
      spacing: {
        '128': '32rem',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
};

// 使用示例
export const Button = ({ variant = 'primary', children }) => (
  <button
    className={clsx(
      'px-4 py-2 rounded font-medium transition-colors',
      {
        'bg-primary-500 text-white hover:bg-primary-600': variant === 'primary',
        'border border-gray-300 hover:bg-gray-50': variant === 'outline',
      }
    )}
  >
    {children}
  </button>
);
```

---

### 7. 性能优化策略

#### 7.1 代码分割与懒加载
```typescript
// 路由级别代码分割
const DashboardPage = lazy(() => import('@/pages/DashboardPage'));

// 组件级别懒加载
const HeavyComponent = lazy(() => import('./HeavyComponent'));

function App() {
  return (
    <Suspense fallback={<LoadingSpinner />}>
      <DashboardPage />
    </Suspense>
  );
}
```

#### 7.2 渲染优化
```typescript
// 1. 使用 React.memo 避免不必要的重渲染
export const UserCard = memo(({ user }) => {
  return <div>{user.name}</div>;
});

// 2. 使用 useMemo 缓存计算结果
const filteredUsers = useMemo(
  () => users.filter((u) => u.isActive),
  [users]
);

// 3. 使用 useCallback 稳定函数引用
const handleDelete = useCallback(
  (id: string) => {
    deleteUser(id);
  },
  [deleteUser]
);

// 4. 虚拟列表（react-window）
import { FixedSizeList } from 'react-window';

export const UserList = ({ users }) => (
  <FixedSizeList
    height={600}
    itemCount={users.length}
    itemSize={50}
    width="100%"
  >
    {({ index, style }) => (
      <div style={style}>{users[index].name}</div>
    )}
  </FixedSizeList>
);
```

#### 7.3 资源优化
- **图片优化**：
  - 使用 WebP 格式（降级到 JPEG/PNG）
  - 响应式图片（`<picture>` + `srcset`）
  - 懒加载（`loading="lazy"` 或 Intersection Observer）
- **字体优化**：
  - 使用 `font-display: swap`
  - 仅加载必要字符集
  - 预加载关键字体
- **构建优化**：
  - Tree Shaking（移除未使用代码）
  - 代码压缩（Terser）
  - Gzip/Brotli 压缩

---

### 8. 状态管理详细方案

#### 8.1 全局状态管理（Zustand 示例）
```typescript
// stores/index.ts
export { useUserStore } from './userStore';
export { useThemeStore } from './themeStore';
export { useCartStore } from './cartStore';

// stores/userStore.ts
interface UserState {
  user: User | null;
  isAuthenticated: boolean;
  login: (email: string, password: string) => Promise<void>;
  logout: () => void;
}

export const useUserStore = create<UserState>((set) => ({
  user: null,
  isAuthenticated: false,

  login: async (email, password) => {
    const { user, token } = await authService.login(email, password);
    localStorage.setItem('token', token);
    set({ user, isAuthenticated: true });
  },

  logout: () => {
    localStorage.removeItem('token');
    set({ user: null, isAuthenticated: false });
  },
}));
```

#### 8.2 服务端状态管理（TanStack Query）
```typescript
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';

// 获取数据
export const useUsers = (params: GetUserParams) => {
  return useQuery({
    queryKey: ['users', params],
    queryFn: () => userService.getUsers(params),
    staleTime: 5 * 60 * 1000, // 5 分钟内数据视为新鲜
  });
};

// 修改数据
export const useUpdateUser = () => {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: ({ id, data }: { id: string; data: UpdateUserDto }) =>
      userService.updateUser(id, data),
    onSuccess: () => {
      // 自动重新获取数据
      queryClient.invalidateQueries({ queryKey: ['users'] });
    },
  });
};
```

**选择建议**：
- 客户端状态（UI 状态、用户偏好）：Zustand
- 服务端状态（API 数据、缓存）：TanStack Query

---

### 9. 类型安全（TypeScript）

#### 9.1 类型定义组织
```typescript
// types/api.ts - API 响应类型
export interface ApiResponse<T> {
  data: T;
  message: string;
  code: number;
}

export interface PaginatedResponse<T> {
  items: T[];
  total: number;
  page: number;
  pageSize: number;
}

// types/models.ts - 业务实体类型
export interface User {
  id: string;
  name: string;
  email: string;
  role: 'admin' | 'user';
  createdAt: string;
}

export interface CreateUserDto {
  name: string;
  email: string;
  password: string;
}

export interface UpdateUserDto {
  name?: string;
  email?: string;
}

// types/components.ts - 组件 Props 类型
export interface ButtonProps {
  variant?: 'primary' | 'secondary' | 'danger';
  size?: 'sm' | 'md' | 'lg';
  loading?: boolean;
  disabled?: boolean;
  onClick?: () => void;
  children: React.ReactNode;
}
```

#### 9.2 类型安全最佳实践
- 避免使用 `any`，优先使用 `unknown`
- 使用泛型提高代码复用性
- 使用类型守卫（Type Guards）进行运行时检查
- 使用 `const assertion`（`as const`）锁定字面量类型

---

### 10. 测试策略

#### 10.1 测试类型
- **单元测试**：工具函数、自定义 Hooks、纯组件
- **集成测试**：API 调用、状态管理、路由跳转
- **E2E 测试**：关键用户流程（登录、支付、表单提交）

#### 10.2 测试工具
```typescript
// Vitest + React Testing Library
import { render, screen, fireEvent, waitFor } from '@testing-library/react';
import { describe, it, expect, vi } from 'vitest';

describe('UserList', () => {
  it('should display users', async () => {
    render(<UserList />);
    await waitFor(() => {
      expect(screen.getByText('John Doe')).toBeInTheDocument();
    });
  });

  it('should filter users by search', async () => {
    render(<UserList />);
    const searchInput = screen.getByPlaceholderText('Search...');
    fireEvent.change(searchInput, { target: { value: 'John' } });
    await waitFor(() => {
      expect(screen.getByText('John Doe')).toBeInTheDocument();
      expect(screen.queryByText('Jane Smith')).not.toBeInTheDocument();
    });
  });
});
```

---

### 11. 开发规范

#### 11.1 命名规范
- **组件**：PascalCase（`UserCard.tsx`）
- **文件**：camelCase（`userService.ts`）
- **常量**：UPPER_SNAKE_CASE（`API_BASE_URL`）
- **类型/接口**：PascalCase（`UserData`）
- **函数/变量**：camelCase（`fetchUsers`）

#### 11.2 代码组织原则
- **文件大小**：单个文件不超过 300 行（超出则拆分）
- **组件复杂度**：单个组件不超过 200 行（超出则提取子组件）
- **函数复杂度**：单个函数不超过 50 行（超出则拆分）
- **圈复杂度**：不超过 10（使用 `eslint-plugin-complexity` 检查）

#### 11.3 注释规范
```typescript
/**
 * 获取用户列表
 * @param params - 查询参数（分页、筛选、排序）
 * @returns 用户列表及分页信息
 * @example
 * const { items, total } = await getUsers({ page: 1, pageSize: 10 });
 */
export const getUsers = async (params: GetUserParams) => {
  // 实现逻辑...
};
```

---

### 12. 环境配置

#### 12.1 环境变量
```bash
# .env.development
VITE_API_BASE_URL=http://localhost:3000/api
VITE_ENABLE_DEBUG=true

# .env.production
VITE_API_BASE_URL=https://api.example.com
VITE_ENABLE_DEBUG=false

# 使用
const apiBaseUrl = import.meta.env.VITE_API_BASE_URL;
```

#### 12.2 代理配置（Vite）
```javascript
// vite.config.ts
export default defineConfig({
  server: {
    proxy: {
      '/api': {
        target: 'http://localhost:3000',
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ''),
      },
    },
  },
});
```

---

### 13. 部署与构建

#### 13.1 构建优化
```javascript
// vite.config.ts
export default defineConfig({
  build: {
    rollupOptions: {
      output: {
        manualChunks: {
          'react-vendor': ['react', 'react-dom', 'react-router-dom'],
          'ui-library': ['@mui/material', '@mui/icons-material'],
        },
      },
    },
    chunkSizeWarningLimit: 1000,
  },
});
```

#### 13.2 CI/CD 配置示例
```yaml
# .github/workflows/deploy.yml
name: Deploy to Production

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: 18
      - run: npm ci
      - run: npm run build
      - run: npm run test
      - uses: amondnet/vercel-action@v20
        with:
          vercel-token: ${{ secrets.VERCEL_TOKEN }}
          vercel-org-id: ${{ secrets.ORG_ID }}
          vercel-project-id: ${{ secrets.PROJECT_ID }}
```

---

## 📊 交付清单

### 代码交付
- [ ] 所有组件实现完成（含 TypeScript 类型定义）
- [ ] API 集成完成（含错误处理）
- [ ] 路由配置完成（含权限控制）
- [ ] 状态管理完成（全局状态 + 服务端状态）
- [ ] 样式实现完成（响应式设计）
- [ ] 性能优化完成（代码分割、懒加载）

### 文档交付
- [ ] 组件使用文档（Storybook 或 README）
- [ ] API 接口文档（接口列表、请求/响应格式）
- [ ] 环境配置文档（环境变量、本地开发指南）
- [ ] 部署文档（构建命令、部署流程）

### 质量保证
- [ ] ESLint + Prettier 检查通过
- [ ] TypeScript 类型检查无错误
- [ ] 单元测试覆盖率 > 80%（如需要）
- [ ] Lighthouse 性能评分 > 90
- [ ] 浏览器兼容性测试通过（Chrome, Edge, Firefox, Safari）

---

## 🎯 常见任务快速参考

### 新增页面
1. 在 `src/pages/` 创建页面组件
2. 在 `src/router/index.tsx` 添加路由
3. 创建对应的 API Service（`src/services/`）
4. 添加必要的 TypeScript 类型定义（`src/types/`）

### 新增组件
1. 确定组件复用性（通用组件 vs 业务组件）
2. 创建组件文件（`src/components/`）
3. 定义 Props 接口（含 TypeScript 类型）
4. 实现组件逻辑 + 样式
5. 添加组件使用示例（Storybook 或 README）

### API 集成
1. 在 `src/services/` 创建服务文件
2. 定义请求/响应类型（`src/types/api.ts`）
3. 封装 API 调用函数
4. 在组件中使用（或配合 TanStack Query）
5. 添加错误处理 + Loading 状态

### 状态管理
1. 确定状态类型（客户端 vs 服务端）
2. 客户端状态：在 `src/stores/` 创建 Zustand store
3. 服务端状态：使用 TanStack Query hooks
4. 在组件中订阅状态

---

## 📚 参考资源

### 官方文档
- [React 文档](https://react.dev/)
- [Vue 文档](https://vuejs.org/)
- [Next.js 文档](https://nextjs.org/docs)
- [Vite 文档](https://vitejs.dev/)
- [Tailwind CSS 文档](https://tailwindcss.com/docs)

### 最佳实践
- [React 设计模式](https://reactpatterns.com/)
- [前端性能优化清单](https://web.dev/fast/)
- [TypeScript 最佳实践](https://typescript-eslint.io/rules/)

### 工具库
- [TanStack Query](https://tanstack.com/query/latest)
- [Zustand](https://zustand-demo.pmnd.rs/)
- [React Hook Form](https://react-hook-form.com/)
- [shadcn/ui](https://ui.shadcn.com/)

---

**模板版本**：v2.1.0
**最后更新**：2025-01-07
**维护者**：Smart Flow Core Team
