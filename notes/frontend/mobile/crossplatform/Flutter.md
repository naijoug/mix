# Flutter
> Flutter makes it easy and fast to build beautiful apps for mobile and beyond

## Reference

- [Flutter](https://github.com/flutter/flutter)
- [Flutter 中文网](https://flutter.cn)
- [深入浅出 Dart](https://www.coding-time.cn/dart/preamble.html)
- [Flutter 实战](https://github.com/flutterchina/flutter_in_action_2nd)
- [Flutter开发实战详解系列](https://github.com/CarGuo/gsy_flutter_book)
    > 本系列将完整讲述：如何快速从 0 开发一个完整的 Flutter APP，配套高完成度 Flutter 开源项目 GSYGithubAppFlutter ，同时会提供一些Flutter的开发细节技巧，之后深入源码和实战为你全面解析 Flutter 。

------

- [2023-10-23 FlutterCandies](https://juejin.cn/post/7292450647303208999)

## Usage

```shell
$ flutter doctor # 检查 flutter 环境是否正确
# flutter create 创建工程
#  配置
#   -template=(app/module/package/plugin/skeleton) 创建工程模板
#   -platforms=(ios/android/windows/linux/macos/web) 指定平台
#   -a 指定 android 开发语言 (默认: kotlin)
#   -i 指定 ios 开发语言 (默认: swift)
$ flutter create test # 创建 flutter test 项目
$ flutter pub get
$ flutter run
$ flutter clean
```

## Concept

| flutter 项目 | 说明
| -- | --
| `App`     | 应用，适用于 `flutter` 为主的开发方法，其它端为壳工程 
| `Moudle`  | 模块，适用于 `flutter` 以模块集成的混合开发方式
| `Plugin`  | 插件，包含原生代码的插件包
| `Package` | 包，纯 `dart` 的工具包
  
`pub.dev`
  
```shell
# 发布 packages
$ flutter packages pub publish --dry-run # 检查包
$ flutter packages pub pushlish # 发布包
```
 
## Dart

> `final` 与 `const` 区别？

  * `const` : 是编译时常量，必须初始化。
  * `final` : 运行时常量，支持惰性初始化，只能被赋值一次的变量。 
  
```dart
final date = DateTime().now(); // ✅
const date = DateTime().now(); // ❌ 编译错误
```

> `mixin` `extends` `implement` 之间的关系

> `await for` 如何使用

> `isolate` `compute` 是如何运行的？

> 如何使用反射?

  使用 `Mirror`
  
  * `ClassMirror` : 类
  * `InstanceMirror` : 实例 
  * `ClosureMirror` : 闭包
  * `DeclarationMirror` : 类属性
  * `IsolateMirror` : Isolate
  * `MethodMirror` : 方法
 
## Native 消息通道

- BasicMessageChannel : 传递字符串和半结构化的信息
- MethodChannel : 传递方法调用 (method invocation)
- EventChannel : 数据流 (event streams) 的通信

------

- [2018-08-28 深入理解Flutter Platform Channel](https://juejin.cn/post/6844903666193956872)

## Flutter 3.x
> 全平台支持 (ios、android、web、windows + => macOS、linux)

- 全平台支持 (稳定了 macOS、linux)
- 无障碍支持
- DevTools 增强

## DevTools

- hot reload : 热启动
- inspector 布局调试

## Widget

`package:flutter/material.dart`

- `StatelessWidget` 
- `StatefulWidget`
  
`Widget` 的生命周期
  
- `StatelessWidget`
    
- `StatefulWidget`

常用的 Widget

- MaterialApp : 
- Scaffold : 脚手架
- ListView : 列表
- ListTile : 
- CircleAvatar : 原形头像

Text : 显示文字
Image : 显示图片 -> AssetImage
PopupMenuButton

FutureBuilder

InheritedWidget

## 布局系统

- Scaffold : 脚手架

- Row、Column、Stack : 布局方向

- Container、Expanded、Positioned、AspectRatio

- Center、Chip、SizedBox、BoxDecoration

mianAxis: 主轴
crossAxis : 交叉轴

flexbox : 弹性盒子布局

padding vs margin

## 导航系统 

- Navigator 2.0

  页面导航管理
  1.0 版本存在很多问题

## 生命周期
  
## 状态管理

- [Flutter 状态管理框架 Provider 和 Get 分析](https://flutter.cn/community/tutorials/state-management-package-getx-provider-analysis)
- [2021-07-14 Flutter GetX深度剖析](https://juejin.cn/post/6984593635681517582)
- [2021-09-26 Flutter 对状态管理的认知与思考](https://juejin.cn/post/7012044249386450981)

## 渲染引擎

> 图像的成像原理 : 计算中的图像的展示，需要 `CPU`、`GPU` 和显示器合作完成。`CPU` 负责计算图像哪些数据需要显示，`GPU` 负责将需要显示的图像数据渲染，然后放入缓存区，显示器读取缓存区数据将图像显示出来。



- Key
    * GlobalKey
    * LocalKey
        * ValueKey
        * ObjectKey
        * UniqueKey

增量渲染

## 热重载

flutter_tools

## 线程模型

- `Flutter` 的线程模型 : 双队列设计(微任务队列和事件队列)，微任务队列比事件队列具有更高优先级。 
- `Flutter` 的线程管理 : 4 个 Runner Thread ()
  
- Microtask : 微任务
- Isolate : 独立线程

## 播放器

> 常用的播放器有哪些？
  
  * video_player : `flutter` 官方提供的播放器
  * video_player_plus : 扩展的 `video_player`
  * Chewie : 封装的 `video_player`
  * FijkPlayer : 封装的 `ijkPlayer` 
 
> FijkPlayer 状态机

  `IDLE` -> `Initialized` -> `Async Preparing` -> `Prepared`
    -> `Started` <--> `Paused` 
    -> `Completed`
    -> `Stopped` 
    -> `Error`
    -> `End`
 
> 播放器的插件化

  插件引用方式
  * Local
  * Git
  * Pub
  
## 混合开发

- module 方式
- framework 方式
- Cocoapods 方式

```shell

# 构建 framework
$ flutter build ios-framework --output=path/to/

# 构建 cocoapods framework
$ flutter build ios-framework --cocoapods --output=path/to/
```

## lib

- [GetX](https://github.com/jonataslaw/getx)
    > Open screens/snackbars/dialogs/bottomSheets without context, manage states and inject dependencies easily with Get.
- [flutter_boost](https://github.com/alibaba/flutter_boost)
    > FlutterBoost is a Flutter plugin which enables hybrid integration of Flutter for your existing native apps with minimum efforts
    
## interview

- [Flutter Interview Questions](https://github.com/h65wang/flutter_interview_questions)
- [flutter_interviews](https://github.com/hornhuang/flutter_interviews)
    > 🇨🇳 面试题、学习资料、私房菜，这里是 flutter 中文学习宝库 👩‍🎓‍👜，想要的知识应有尽有，点击 star 不迷路！ 🌟🌟

------

- [2022-05-03 浅谈 Flutter 编译原理](https://juejin.cn/post/7093388612078665764)
- [2022-01-24 知道 Flutter 生命周期？](https://juejin.cn/post/7056646298073563166)
- [2020-06-26 算是flutter最完整题库了](https://juejin.cn/post/6844904199726039054)
- [2020-04-24 Android-Flutter面经](https://juejin.cn/post/6844904136937324552)

### Dart

> `final` vs `const`

  * 

### Flutter

> 命令式 `UI` vs 声明式 `UI`
  
  * 命令式 : 告诉程序一步一步如何搭建我所需要的界面，类似做菜的教程
  * 声明式 : 告诉程序我需要一个怎样的界面，类似做菜的菜单

> `Flutter` 的生命周期？

  * `StatelessWidget` : `build`
  * `StatefulWidget` : `initState` -> ``

> `Widget` `Element` `RenderObject` 之间的关系？

  `Flutter` 的三棵树，代表了使用树的数据结构构成的三种元素。
  
  * `Widget` 树，可以理解为对 `UI` 的一些配置。
  * `Element` 树，这个是真正进行 `UI` 元素。
  * `RenderObject` 树，代表渲染树 

> `Future` 与 `microtask` 两者的执行顺序

> `InheritedWidget` 作用

> `Provider` `BLoc` `GetX` 区别

> `ListView` 与 `Sliver` 区别

> `Flutter` 与 `RN` (`React Native`) 不同之处？

> 为什么说 `Flutter` 是原生的？

> `Flutter` 的优缺点?

> `Flutter` 的渲染原理？

> `Flutter` 跨平台是如何实现的？

  `Flutter` 其实主要实现了两大块，一个是视图层的渲染，另一个调用原生功能。对于一款应用来说，核心就是展示给用户界面，再有就是与用户交互，交互过程中可能会涉及一些设备功能的调起(摄像头、麦克风、相册等)。
  
  * 界面渲染 : `Skia` 绘制引擎进行视图的统一渲染
  * 原生通信 : 通过 `Channel` 机制进行与原生进行交互
    - `BasicMessageChannel` : 用于基本的字符串信息通信
    - `MethodChannel` : 方法调用通信
    - `EventChannel` : 数据流通信

> `hot reload`(热重载)、`hot restart`(热重启)、`hot update`(热更新)？


> `Flutter` 是如何实现热重载的？


> `Flutter` 列表优化方案？

> `Flutter` 包体积如何优化？

  包体积的优化说到底就是包里面所含有资源的优化，主要包含两类文件一类是资源文件，另一个类是二进制文件。
  
  * 资源文件的优化: 图片的压缩，bundle 优化，无用资源的移除，资源的动态下发
  * 二进制文件优化: 无用代码的移除；减少第三方的依赖；编译优化，主要有编译参数相关，以及底层编译生成产物优化，需要去进行底层研究对一些无用功能的裁剪。

> `Flutter` 渲染优化方案？

  渲染优化来说主要涉及两个方面，其一是首次加载的渲染，其二是 `StatefulWidget` 状态改变时页面的重建渲染。
  
  * 首次渲染方面: 构建 `Widget` 时应该合理搭建，减少复杂度；能使用 `const` 的地方尽量使用
  * 重建渲染方面: 尽量减少状态改变引起重建区域；减少 `saveLayer()`的触发
  
  触发 `saveLayer()`
    * ShaderMask
    * ColorFilter
    * Chip & `disabledColorAlpha != 0xff`
    * Text & `overflowShader`

> `Flutter` 的内存管理

> `Flutter` 为啥没有反射？

  因为发射会影响 `Dart` 的 `tree shaking`(摇树优化)。这是一种无用代码裁剪技术，有利于优化发布版本的 `App` 体积。如果反射机制存在，会存在隐式代码，`tree shaking` 时无法准确定位运行时哪些代码不会被调用，冗余代码就没法被裁剪。