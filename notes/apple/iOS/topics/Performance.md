# Performance
> Performance Optimization: 性能优化

## Reference

- [iOS-Performance-Optimization](https://github.com/skyming/iOS-Performance-Optimization) 
    > 关于iOS 性能优化梳理、内存泄露、卡顿、网络、GPU、电量、 App 包体积瘦身、启动速度优化等、Instruments 高级技巧、常见的优化技能- Get — Edit
- [2015.11.12 iOS 保持界面流畅的技巧](https://blog.ibireme.com/2015/11/12/smooth_user_interfaces_for_ios/)
- [2016.10.30 优化 App 的启动时间](http://yulingtianxia.com/blog/2016/10/30/Optimizing-App-Startup-Time/)
- [2017.07.17 阿里数据iOS端启动速度优化的一些经验](https://www.jianshu.com/p/f29b59f4c2b9)
- [2018.06.16 性能优化](https://github.com/buptwsgprivate/iOSInterview/blob/master/%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96.md)
- [2022.06.23 带你打造一套 APM 监控系统](https://github.com/FantasticLBP/knowledge-kit/blob/master/Chapter1%20-%20iOS/1.74.md)

## GPU 屏幕渲染

| 屏幕渲染 | 说明
| --- | ---
| `On-Screen Rendering`     | *当前屏幕渲染*，在当前显示的屏幕缓冲区中进行。优点：不需要创建新的缓存，也不需要进行上下文切换，性能较好；缺点：缓存大小受限制，无法进行复杂的操作。
| `Off-Screen Rendering`    | *离屏渲染*，在当前屏幕缓冲区外开辟新的缓冲区进行操作。需要创建新的缓冲区，以及多次上下文切换

> 在当前屏幕缓冲区以外，新开辟一个缓冲区进行操作。

- 触发离屏渲染
    * 圆角 `layer.masksToBounds = YES & layer.cornerRadius > 0`
    * 图层蒙版 `layer.mask`
    * 阴影 `layer.shadowXXX (除 shadowPath)`
    * 光栅化 `layer.shouldRasterize = YES`
    * 抗锯齿 `edge antialiasing`
    * 不透明 `group opacity`
    
## CPU 渲染 & 离屏渲染

| 渲染类型 | 说明
| --- | ---
| CPU 渲染 | 简单视图 CPU 渲染可能高于 GPU (不需要创建缓冲区和上下文切换)
| 离屏渲染  | GPU 浮点运算能力强于 CPU，所以 GPU 渲染效率高于 CPU

## iOS 启动优化方案？


## iOS 界面卡顿优化方案？

