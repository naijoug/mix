
## Reference

- [iOS 面试题集锦 - 陈奕龙(阿里)](https://github.com/ChenYilong/iOSInterviewQuestions)
- [iOSInterviewsAndDevNotes](https://github.com/DevDragonLi/iOSInterviewsAndDevNotes)
    > 🚴 iOS Interviews, Dev Notes && Git ...
- [2015-07-04 招聘一个靠谱的 iOS - 孙源(滴滴)](http://blog.sunnyxx.com/2015/07/04/ios-interview)
- [2016-10-09 一份"有点难"的iOS面试题](https://zhuanlan.zhihu.com/p/22834934)
- [2018-07-24 出一套 iOS 高级面试题](juejin.im/post/5b56155e6fb9a04f8b78619b)
- [2020-02-14 阿里、字节：一套高效的iOS面试题](https://juejin.cn/post/6844904064937902094)
    > [runtime 结构模型](https://juejin.cn/post/7218915344119234616)

## Project Show

- 分层设计
- 使用 `MVVM` 架构进行控制器解耦
- 通过减少离屏渲染、高度缓存和按需加载等方案，解决列表卡顿问题
- 使用 `Hybrid` 开发实现 `Native & JS` 交互
- 使用 `Json-Server` 构建 `Mock Server`，解决并行开发问题
- 使用 `gitlab-ci-runner` 配置 `yml` 文件进行持续集成任务
- 优化安装包过大，优化页面

## Questions

- 如果让你实现属性的weak，如何实现的？
- 如果让你来实现属性的atomic，如何实现？
- KVO为什么要创建一个子类来实现？
- 类结构体的组成，isa指针指向了什么？（这里应该将元类和根元类也说一下）
- RunLoop有几种事件源？有几种模式？
- 方法列表的数据结构是什么？
- 分类是如何实现的？它为什么会覆盖掉原来的方法？

- @Property 本质是什么？
- 什么情况下需要手动创建 autoreleasepool ？
- GCG 本质是什么？

- CPU & 进程 & 线程 的关系？

- iOS 常用设计模式？

- iOS 单例实现

- 介绍下内存的几大区域？
- 你是如何组件化解耦的？
- runtime如何通过selector找到对应的IMP地址
- runloop内部实现逻辑？
- 你理解的多线程？
- GCD执行原理？
- 怎么防止别人反编译你的app？
- YYAsyncLayer如何异步绘制？
- 优化你是从哪几方面着手？

- 你一般学习iOS是如何学习的？
- app内存你是如何分析的？
- 用过 TableView 吗，平时怎么解决 TableView 滑动卡顿问题的？
- 网络模型了解么？有哪几种？说说你的看法？
- block本质是什么？
- KVC机制是如何通过key找到value。
- 说说你最熟悉的第三方，知晓其原理么？

- 使用了第三方库, 有看它们是怎么实现的吗？
- 强连通量算法了解嘛？
- 遇到tableView卡顿嘛？会造成卡顿的原因大致有哪些？
- M、V、C相互通讯规则你知道的有哪些？
- NStimer准吗？谈谈你的看法？如果不准该怎样实现一个精确的NSTimer? 

- 编译过程做了哪些事情；
- 字典大致实现原理；
- block和函数指针的理解；
- 一般开始做一个项目，你的架构是如何思考的？
- 你了解的 UIKit 结构？

- OC你了解的锁有哪些？在你回答基础上进行二次提问；
    * 自旋和互斥对比？
    * 用C/OC/C++，任选其一，实现自旋或互斥？口述即可！
- 内存泄漏可能会出现的几种原因，聊聊你的看法？
    * 非OC对象如何处理？
    * 若常用框架出现内存泄漏如何处理？
- 容错处理你们一般是怎么做的？
- 项目开始容错处理没做？如何防止拦截潜在的崩溃？

## Technical Point

- 表格列表 - 双 `UITableView` 实现
- 问答文本 - `NSTextAttachment` 处理富文本
- 消息模块 - `SQLite` 进行消息缓存
- 自定义 `TabBar` - 顶部灰线去除
- 快捷模式 - 动画处理和换肤处理
- 创意Menu - 自定义 `Window`

## Ability

- 设计一个时长统计模块
- 设计一个日志记录模块
- 设计一个缓存模块？LRUCache 算法怎么实现？
- 设计一个通用网络模块
- 设计一个通用视频播放器
- 模块化分层设计方案