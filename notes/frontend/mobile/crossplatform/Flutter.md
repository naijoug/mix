# Flutter
> Flutter makes it easy and fast to build beautiful apps for mobile and beyond

## Reference

- [Flutter](https://github.com/flutter/flutter)
- [Flutter 中文网](https://flutter.cn)
- [Flutter 实战](https://github.com/flutterchina/flutter_in_action_2nd)
- [Flutter开发实战详解系列](https://github.com/CarGuo/gsy_flutter_book)
    > 本系列将完整讲述：如何快速从 0 开发一个完整的 Flutter APP，配套高完成度 Flutter 开源项目 GSYGithubAppFlutter ，同时会提供一些Flutter的开发细节技巧，之后深入源码和实战为你全面解析 Flutter 。

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
  
## Native 消息通道

- BasicMessageChannel : 传递字符串和半结构化的信息
- EventChannel : 数据流 (Event Streams) 的通信
- MethodChannel : 传递方法调用 (Method Invocation)

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

## 布局系统

## 导航系统 

- Navigator 2.0

  页面导航管理
  1.0 版本存在很多问题

## 生命周期
  
## 渲染引擎

增量渲染

## 线程模型

- `Flutter` 的线程模型 : 双队列设计(微任务队列和事件队列)，微任务队列比事件队列具有更高优先级。 
- `Flutter` 的线程管理 : 4 个 Runner Thread ()
  
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
  


   