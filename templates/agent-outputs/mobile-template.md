# 移动开发类 Agent 输出模板

**模板版本**: v2.1.0
**适用 Agent**: mobile-developer, ios-developer, android-developer, react-native-developer, flutter-developer
**生成日期**: 2025-01-07

---

## 📱 移动开发输出结构

### 1. 技术栈与架构设计
```yaml
平台选择:
  - iOS: Swift 5.9+ / SwiftUI / UIKit
  - Android: Kotlin 1.9+ / Jetpack Compose
  - 跨平台: React Native / Flutter
  - 混合: Cordova / Ionic / Capacitor

架构模式:
  推荐选项:
    - MVVM (Model-View-ViewModel)
    - VIPER (View-Interactor-Presenter-Entity-Router)
    - Clean Architecture
    - Redux/Flux (状态管理)
  选择: [根据项目复杂度和团队规模选择]

状态管理:
  iOS: Combine / SwiftUI @State / Redux
  Android: LiveData / StateFlow / Jetpack ViewModel
  React Native: Redux / MobX / Context API
  Flutter: Provider / Riverpod / Bloc

依赖注入:
  iOS: Swinject / Resolver
  Android: Dagger 2 / Hilt / Koin
  React Native: Redux Thunk / Saga
  Flutter: GetIt / Provider

网络层:
  - URLSession / Alamofire (iOS)
  - Retrofit / OkHttp (Android)
  - Axios / Fetch (React Native)
  - Dio / http (Flutter)
```

---

### 2. UI/UX 实现方案

#### 组件架构
```
UI Components Structure:
├── Atoms (基础组件)
│   ├── Button variants (primary, secondary, text, icon)
│   ├── TextInput variants (email, password, search)
│   ├── Loading indicators
│   └── Iconography
├── Molecules (复合组件)
│   ├── Form fields with validation
│   ├── List items (cards, rows)
│   ├── Navigation bars
│   └── Tab bars
├── Organisms (复杂组件)
│   ├── Forms (login, registration)
│   ├── Lists (feed, gallery)
│   ├── Cards (product, profile)
│   └── Charts (data visualization)
└── Templates (页面模板)
    ├── Authentication flows
    ├── Dashboard layouts
    ├── Detail views
    └── Settings screens
```

#### 设计系统
```yaml
设计规范:
  颜色系统:
    - Primary colors (品牌色)
    - Secondary colors (辅助色)
    - Semantic colors (success, warning, error, info)
    - Neutral colors (灰阶)
  字体系统:
    - Font families (SF Pro, Roboto, Open Sans)
    - Typography scale (h1-h6, body, caption)
    - Line heights and letter spacing
  间距系统:
    - Spacing scale (4, 8, 12, 16, 24, 32, 48, 64)
  圆角系统:
    - Border radius (4, 8, 12, 16, 24)
  阴影系统:
    - Elevation levels (1-5)

响应式设计:
  - 适配不同屏幕尺寸 (iPhone SE 到 iPad Pro)
  - 横竖屏适配
  - 折叠屏适配
  - 安全区域处理 (Safe Area / Window Insets)

主题支持:
  - Light mode
  - Dark mode
  - High contrast mode (辅助功能)
```

---

### 3. 原生功能集成

#### iOS 专属功能
```yaml
iOS Frameworks Integration:
  UI Kit:
    - UIKit / SwiftUI 混合开发
    - 自定义 Transitions 和 Animations
    - 复杂手势识别

  系统集成:
    - Push Notifications (APNs)
    - Background Tasks / Background Fetch
    - Widget Extension
    - Live Activities (iOS 16+)
    - Dynamic Island (iOS 16+)

  硬件功能:
    - Camera / AVFoundation
    - Photos / PHPhotoLibrary
    - Core Location (地理定位)
    - Core Motion (传感器数据)
    - Bluetooth (Core Bluetooth)
    - NFC (Core NFC)
    - Face ID / Touch ID (LocalAuthentication)

  高级功能:
    - Core ML / Create ML (机器学习)
    - ARKit (增强现实)
    - RealityKit (3D 内容)
    - Core Data / Realm (本地数据库)
    - CloudKit (云端同步)
    - In-App Purchase (StoreKit)
    - Siri Shortcuts
    - Wallet (Apple Pay)

性能优化:
  - Instruments 分析
  - 预加载和懒加载策略
  - 内存优化 (Autorelease Pool, 弱引用)
  - 启动时间优化
  - 滚动性能优化
  - 图像优化 (ImageIO, HEIC)
```

#### Android 专属功能
```yaml
Android Frameworks Integration:
  UI Kit:
    - Jetpack Compose / XML 混合
    - Material Design 3 组件
    - 自定义 Views 和 Drawables

  系统集成:
    - Firebase Cloud Messaging
    - Work Manager (后台任务)
    - App Widgets
    - Tile (快速设置)
    - Notifications (通知渠道)

  硬件功能:
    - CameraX (相机)
    - MediaStore (媒体存储)
    - Location Services (Fused Location Provider)
    - Sensors (传感器)
    - Bluetooth (Bluetooth Low Energy)
    - NFC (Near Field Communication)
    - Biometric Prompt (指纹/面部识别)

  高级功能:
    - ML Kit (机器学习)
    - ARCore (增强现实)
    - Room / SQLite (本地数据库)
    - Jetpack DataStore (数据存储)
    - Firebase Services (Analytics, Crashlytics)
    - Billing Library (应用内购买)
    - Google Assistant Actions

性能优化:
  - Android Profiler 分析
  - LeakCanary (内存泄漏检测)
  - ProGuard / R8 混淆
  - APK 大小优化
  - 启动速度优化
  - 布局优化 (Layout Inspector)
  - 图像优化 (Glide, Coil)
```

#### React Native 跨平台功能
```yaml
React Native Integration:
  核心模块:
    - Navigation (React Navigation 6+)
    - State Management (Redux Toolkit, Zustand)
    - Networking (Axios, React Query)
    - Storage (AsyncStorage, MMKV)

  原生模块桥接:
    - 自定义 Native Modules
    - Native Components (Fabric)
    - Turbo Modules (New Architecture)
    - CodePush (热更新)

  第三方库生态:
    - UI 组件: React Native Paper, NativeBase
    - 图表: Victory, React Native Chart Kit
    - 动画: Reanimated 3, Lottie
    - 地图: React Native Maps
    - 推送: React Native Push Notification
    - 相机: React Native VisionCamera

性能优化:
  - Hermes 引擎
  - React DevTools Profiler
  - Bundle 分包
  - 图片优化 (react-native-fast-image)
  - 列表优化 (FlashList, VirtualizedList)
  - 内存优化 (useMemo, useCallback)
```

#### Flutter 跨平台功能
```yaml
Flutter Integration:
  核心架构:
    - BLoC / Riverpod (状态管理)
    - Go Router (路由导航)
    - Dio (网络请求)
    - Hive / Isar (本地数据库)

  平台特定代码:
    - Platform Channels (MethodChannel, EventChannel)
    - Platform Views (AndroidView, UIKitView)
    - Pigeon (类型安全桥接)

  插件生态:
    - UI: flutter/material, cupertino_icons
    - 地图: google_maps_flutter, mapbox_gl
    - 视频: video_player, chewie
    - 相机: camera, image_picker
    - 推送: flutter_local_notifications, firebase_messaging
    - 支付: in_app_purchase, flutter_stripe

性能优化:
  - DevTools 分析工具
  - Performance Overlay
  - Widget 树优化 (const, RepaintBoundary)
  - Isolate 多线程
  - 图像优化 (CachedNetworkImage)
  - 列表优化 (ListView.builder, SliverList)
  - 代码混淆 (Flutter Proguard)
```

---

### 4. 核心功能实现

```yaml
数据层:
  网络请求:
    - RESTful API / GraphQL
    - 请求拦截器 (auth, logging)
    - 响应拦截器 (error handling)
    - 缓存策略 (memory, disk)
    - 离线支持 (queue, sync)

  数据持久化:
    - Key-Value Storage (UserDefaults, SharedPreferences)
    - SQL Database (Core Data, Room, Realm)
    - NoSQL Database (Firebase Firestore)
    - File System (Documents, Caches)

  数据同步:
    - 实时同步 (WebSocket, Firebase Realtime Database)
    - 后台同步 (Background Tasks)
    - 冲突解决策略
    - 数据版本控制

业务逻辑层:
  用例编排:
    - Use Cases / Interactors
    - Repository Pattern
    - Domain Models (业务实体)
    - Business Rules (业务规则)
    - Validation (数据校验)

状态管理:
  - 全局状态 (用户信息, 设置)
  - 局部状态 (页面数据)
  - 导航状态 (路由栈)
  - 会话状态 (登录状态)
```

---

### 5. 性能优化策略

#### 启动优化
```yaml
冷启动优化:
  - Application 初始化优化
  - 多线程初始化 (Dispatch Queue, Coroutine)
  - 延迟初始化非关键模块
  - 减少启动时的网络请求

热启动优化:
  - 进程保活策略
  - 缓存预热
  - 状态恢复 (State Restoration)
```

#### 运行时优化
```yaml
内存管理:
  - 对象池 (Object Pooling)
  - 弱引用避免循环引用
  - 及时释放大对象 (images, videos)
  - 内存泄漏检测

渲染优化:
  - 减少布局层级
  - 避免过度绘制 (Overdraw)
  - 列表复用 (UITableView, RecyclerView)
  - 异步渲染 (后台线程解码图片)

网络优化:
  - 请求合并和批处理
  - 请求优先级队列
  - 数据压缩 (gzip, brotli)
  - CDN 加速
  - 预加载关键资源
```

#### 包体积优化
```yaml
iOS App Thinning:
  - Bitcode (已废弃, 使用 Slicing)
  - Asset Catalogs (自动设备适配)
  - On-Demand Resources
  - App Size Report (分析体积)

Android APK 优化:
  - ProGuard / R8 混淆
  - App Bundle (动态分发)
  - 资源压缩 (shrinkResources)
  - 动态特性交付 (Dynamic Features)

跨平台优化:
  - 代码分割 (Code Splitting)
  - Tree Shaking (未使用代码删除)
  - 图片压缩和格式优化 (WebP)
  - 字体子集化
```

---

### 6. 测试策略

```yaml
单元测试:
  框架选择:
    - iOS: XCTest / Quick + Nimble
    - Android: JUnit / Truth
    - React Native: Jest + React Native Testing Library
    - Flutter: test package + mockito

  测试覆盖:
    - Business Logic (Use Cases)
    - View Models / Presenters
    - Utilities / Helpers
    - Data Sources (Repository)

集成测试:
  框架选择:
    - iOS: XCTest UI
    - Android: Espresso / Compose Testing
    - React Native: Detox
    - Flutter: integration_test

  测试场景:
    - User Journeys (用户流程)
    - Navigation flows (导航流程)
    - Form submissions (表单提交)
    - API interactions (API 交互)

E2E 测试:
  工具选择:
    - Appium (跨平台)
    - XCUITest (iOS)
    - UI Automator (Android)
    - Detox (React Native)

  测试覆盖:
    - Critical User Paths (关键用户路径)
    - Payment flows (支付流程)
    - Authentication flows (认证流程)

性能测试:
  工具选择:
    - Xcode Instruments (iOS)
    - Android Profiler (Android)
    - Firebase Performance Monitoring
    - Lighthouse (Progressive Web Apps)

  测试指标:
    - App Launch Time (启动时间)
    - Frame Rate (帧率 > 60fps)
    - Memory Usage (内存占用)
    - Battery Consumption (电池消耗)
    - Network Latency (网络延迟)
```

---

### 7. 构建与发布

#### CI/CD 流程
```yaml
iOS CI/CD:
  工具: GitHub Actions / Bitrise / Codemagic

  流程:
    1. 代码检出 (Checkout)
    2. 依赖安装 (CocoaPods / SPM)
    3. 代码检查 (SwiftLint)
    4. 单元测试 (xcodebuild test)
    5. 构建 (xcodebuild archive)
    6. 发布 (TestFlight / App Store Connect)

Android CI/CD:
  工具: GitHub Actions / Bitrise / CircleCI

  流程:
    1. 代码检出 (Checkout)
    2. 依赖安装 (Gradle)
    3. 代码检查 (ktlint, Detekt)
    4. 单元测试 (Gradle test)
    5. 构建 (Gradle assemble)
    6. 发布 (Google Play Console)

跨平台 CI/CD:
  React Native:
    - EAS Build (Expo)
    - Fastlane (自定义)

  Flutter:
    - Codemagic
    - Fastlane
```

#### 发布策略
```yaml
版本管理:
  - 语义化版本 (Semantic Versioning)
  - Build Number / Version Code
  - Release Notes (版本说明)

测试发布:
  - TestFlight (iOS)
  - Google Play Internal Test (Android)
  - Firebase App Distribution

生产发布:
  - App Store Review (iOS)
  - Google Play Review (Android)
  - Rollout Strategy (灰度发布)
  - Staged Rollout (分阶段发布)

热更新:
  iOS:
    - App Store 审核 (无热更新, 除 CodePush)
    - Bug 修复需走审核流程

  Android:
    - Instant Update (无需审核)
    - Google Play 灰度发布

  跨平台:
    - CodePush (React Native)
    - Shorebird (Flutter)
    - Exponent Updates (Expo)
```

---

### 8. 监控与分析

```yaml
崩溃监控:
  工具选择:
    - Firebase Crashlytics
    - Sentry
    - Bugsnag
    - Instabug

  监控指标:
    - Crash Free Users (崩溃率)
    - Crash Reports (崩溃报告)
    - Stack Traces (堆栈跟踪)
    - Device Info (设备信息)

性能监控:
  工具选择:
    - Firebase Performance Monitoring
    - New Relic Mobile
    - Datadog APM

  监控指标:
    - App Launch Time (启动时间)
    - Screen Render Time (屏幕渲染时间)
    - Network Request Time (网络请求时间)
    - Memory Usage (内存使用)
    - Battery Usage (电池使用)

用户分析:
  工具选择:
    - Firebase Analytics
    - Mixpanel
    - Amplitude
    - AppsFlyer (归因分析)

  分析维度:
    - DAU / MAU (日活/月活)
    - User Retention (用户留存)
    - Session Duration (会话时长)
    - Funnel Analysis (漏斗分析)
    - Event Tracking (事件追踪)
```

---

### 9. 安全与合规

```yaml
数据安全:
  - 数据加密 (AES-256)
  - HTTPS / SSL Pinning
  - Keychain / Keystore 存储
  - 生物识别认证 (Face ID, Touch ID, Fingerprint)
  - 敏感数据脱敏

代码安全:
  - 代码混淆 (ProGuard, R8)
  - 反编译保护
  - 调试检测 (Root Detection, Jailbreak Detection)
  - 完整性校验 (App Integrity)

合规要求:
  - GDPR (欧盟数据保护)
  - CCPA (加州消费者隐私法)
  - App Store Review Guidelines (iOS)
  - Google Play Policy (Android)
  - 隐私政策和用户协议

权限管理:
  iOS:
    - Info.plist 权限声明
    - 运行时权限请求 (Camera, Location, Photos)
    - 推送通知权限

  Android:
    - AndroidManifest.xml 权限声明
    - 运行时权限请求 (Dangerous Permissions)
    - 后台权限优化 (Background Location)
```

---

### 10. 最佳实践建议

#### iOS 最佳实践
```yaml
代码规范:
  - Swift API Design Guidelines
  - SwiftLint 规则集
  - MARK 注释分段
  - 命名规范 (camelCase, PascalCase)

架构模式:
  - MVVM-C (Coordinator 模式)
  - SwiftUI + Combine 响应式编程
  - UIKit Delegation 模式
  - Protocol-Oriented Programming

内存管理:
  - ARC 自动引用计数
  - 弱引用避免循环引用
  - @escaping 闭包捕获列表
  - Combine Subscription 管理

性能优化:
  - GCD 并发编程
  - Operation Queue 依赖管理
  - Instruments 分析工具
  - 预加载和懒加载策略
```

#### Android 最佳实践
```yaml
代码规范:
  - Kotlin Coding Conventions
  - Detekt 静态分析
  - ktlint 代码格式化
  - 包结构分层 (data, domain, presentation)

架构模式:
  - Clean Architecture
  - MVVM + Repository Pattern
  - Jetpack ViewModel + LiveData/StateFlow
  - Coroutines 异步编程

内存管理:
  - Lifecycle-aware 组件
  - ViewModel 避免内存泄漏
  - Weak References 避免内存泄漏
  - LeakCanary 检测内存泄漏

性能优化:
  - Kotlin Coroutines 并发
  - Room Database 索引优化
  - WorkManager 后台任务
  - Android Profiler 性能分析
```

#### 跨平台最佳实践
```yaml
React Native:
  - 组件化开发
  - Custom Hooks 封装逻辑
  - Code Splitting 代码分割
  - Fast Refresh 快速刷新

Flutter:
  - Widget 组合优于继承
  - Provider/Riverpod 状态管理
  - Build Method 优化 (const, RepaintBoundary)
  - Hot Reload 快速迭代

通用最佳实践:
  - 响应式设计 (适配不同屏幕)
  - 无障碍功能 (Accessibility)
  - 国际化 (i18n) 和本地化 (l10n)
  - 主题切换 (Dark Mode)
  - 离线优先 (Offline-first) 策略
```

---

## 📦 交付清单

### 代码交付
- [ ] 完整的源代码 (Git 仓库)
- [ ] 单元测试覆盖率 > 80%
- [ ] 集成测试关键流程
- [ ] 代码文档注释 (JSDoc, KDoc, Swift Doc)
- [ ] README.md (开发指南)

### 配置文件
- [ ] package.json / Podfile / pubspec.yaml
- [ ] iOS: Info.plist, Entitlements
- [ ] Android: AndroidManifest.xml, build.gradle
- [ ] 环境配置 (.env, Config.xcconfig)
- [ ] CI/CD 配置 (.github/workflows, bitrise.yml)

### 文档交付
- [ ] 技术架构文档 (Architecture Decision Records)
- [ ] API 接口文档 (OpenAPI/Swagger)
- [ ] 数据模型文档 (Data Models)
- [ ] 部署指南 (Deployment Guide)
- [ ] 故障排查指南 (Troubleshooting Guide)

### 测试交付
- [ ] 测试报告 (Test Report)
- [ ] 性能基准测试 (Performance Benchmarks)
- [ ] 兼容性测试矩阵 (Compatibility Matrix)
- [ ] 安全审计报告 (Security Audit)

### 发布准备
- [ ] App Store / Google Play 截图
- [ ] 应用图标和启动屏
- [ ] 隐私政策和用户协议
- [ ] Release Notes (版本说明)
- [ ] 应用商店优化 (ASO) 元数据

---

## 🔧 常用命令速查

### iOS 开发
```bash
# CocoaPods
pod install
pod update

# Xcode 构建
xcodebuild -workspace MyApp.xcworkspace -scheme MyApp -configuration Debug build
xcodebuild test -workspace MyApp.xcworkspace -scheme MyApp -destination 'platform=iOS Simulator,name=iPhone 15'

# SwiftLint
swiftlint lint
swiftlint --fix

# Swift Package Manager
swift build
swift test
```

### Android 开发
```bash
# Gradle 构建
./gradlew assembleDebug
./gradlew assembleRelease
./gradlew test

# 代码检查
./gradlew ktlintCheck
./gradlew detekt

# Lint 检查
./gradlew lint

# 生成签名 APK
./gradlew assembleRelease --stacktrace
```

### React Native 开发
```bash
# 安装依赖
npm install
cd ios && pod install

# 运行开发服务器
npm start
npm start -- --reset-cache

# 运行应用
npx react-native run-ios
npx react-native run-android

# 构建
npx react-native build-ios --mode Release
npx react-native build-android --mode Release

# 代码检查
npm run lint
npm run typecheck
```

### Flutter 开发
```bash
# 获取依赖
flutter pub get

# 运行应用
flutter run
flutter run --release

# 构建
flutter build apk --release
flutter build ios --release
flutter build web

# 测试
flutter test
flutter test integration_test

# 代码检查
flutter analyze
dart format .
```

---

## 📚 推荐资源

### iOS 学习资源
- [Swift Programming Language](https://docs.swift.org/swift-book/)
- [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
- [SwiftUI by Example](https://www.hackingwithswift.com/quick-start/swiftui)
- [WWDC Videos](https://developer.apple.com/videos/)
- [Ray Wenderlich](https://www.kodeco.com/ios)

### Android 学习资源
- [Android Developers](https://developer.android.com/)
- [Kotlin Language](https://kotlinlang.org/docs/)
- [Jetpack Compose](https://developer.android.com/jetpack/compose)
- [Android Architecture Blueprints](https://github.com/android/architecture-samples)
- [Android Kotlin Guides](https://developer.android.com/kotlin/style-guide)

### React Native 学习资源
- [React Native Official Docs](https://reactnative.dev/)
- [React Navigation](https://reactnavigation.org/)
- [Redux Toolkit](https://redux-toolkit.js.org/)
- [Awesome React Native](https://github.com/jondot/awesome-react-native)
- [Callstack React Native Services](https://callstack.com/services/react-native)

### Flutter 学习资源
- [Flutter Official Docs](https://flutter.dev/docs)
- [Flutter Widgets Catalog](https://api.flutter.dev/flutter/widgets/widgets-library.html)
- [BLoC Library](https://bloclibrary.dev/)
- [Flutter Architecture Samples](https://github.com/brianegan/flutter_architecture_samples)
- [Awesome Flutter](https://github.com/Solido/awesome-flutter)

---

**模板结束**

---

## 使用说明

### 如何使用此模板

1. **复制模板**
   - 根据具体 Agent 选择对应的章节
   - mobile-developer: 所有章节通用
   - ios-developer: 重点关注 iOS 专属内容
   - android-developer: 重点关注 Android 专属内容
   - react-native-developer: 重点关注 React Native 跨平台内容
   - flutter-developer: 重点关注 Flutter 跨平台内容

2. **自定义调整**
   - 删除不适用的章节
   - 补充项目特定的技术栈
   - 调整架构模式和最佳实践

3. **生成输出**
   - 填写具体实现细节
   - 添加代码示例
   - 提供配置文件示例

### 输出目标

- **开发阶段**: 提供技术方案和架构设计
- **实施阶段**: 提供代码实现和最佳实践
- **测试阶段**: 提供测试策略和质量保证
- **部署阶段**: 提供构建流程和发布策略
- **维护阶段**: 提供监控分析和问题排查

---

**版本历史**:
- v2.1.0 (2025-01-07): 初始版本，覆盖移动开发全流程
