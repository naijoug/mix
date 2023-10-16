# 面试题

## method dispatch - “方法派发”

> 以下代码输出？

```objc
@interface Animail
@end
@interface Dog : Animal
@end
@implementation Dog
- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"%@", NSStringFromClass([self class]));
        NSLog(@"%@", NSStringFromClass([super class]));
    }
    return self;
}
@end
```

## memory - “内存”
 
  [“内存”那些事](memory.md)
  
> 一张 100*100 的 RGBA 格式的图片占用多少内存？

  首先计算每个像素点占用内存，RGBA 格式的图片由于占用 4 个字节，
  然后图片大小为 100*100 = 10000 像素点 (≈ 10240 = 10 * 1024 = 10kb)
  所有最后结果为: 4 * 10kb = 40kb
  
> 如何使用 `UIImageView` 显示一个超大图片，并且支持缩放功能？

  由于 `UIImageView` 通过 `UIImage` 加载图片，是一次性将图片加载到内存，超大图片会引发内存不足的的问题。所以这个时候不能一次全部加载，需要使用分治思想，将图片像素点分块加载，只加载可视区域像素点。使用 `Tile Rendering` 的解决方案，类似家庭装修贴地砖的方式，先将图片像素按照一定的大小分割成 `Tile`，然后根据图片显示区域渲染。`CATiledLayer` 是一种适用于处理大量数据的渲染的 layer，适合处理这种情况。
  缩放功能可以通过将 `UIImageView` 嵌套在 `UIScrollView` 里面，根据缩放的代理回调，进行 `Tile` 的重新绘制。
  
> `C++` 中 `placement new` 特性，在 `OC` 中可以使用吗？

  `placement new` : 是一种可以已分配内存的位置直接构造对象的特性，而这个已分配内存可以栈区也可以是堆区。
  
  ```cpp
  // 栈内存
  char buffer[sizeof(Foo)]; 
  Foo* foo = new(buffer) Foo(args);
  // 堆内存
  char* buffer = new char[sizeof(Foo)]; 
  Foo* foo = new(buffer) Foo(args);
  ```
  
  `OC` 是不具备这个特性，但是可以借助 `C` 语言分配内存。
  
  ```objc
  // OC 常规方案
  Foo* foo = [[Foo alloc] init];
  // 使用 C 分配内存
  Foo* foo = (Foo*) malloc(sizeof(Foo));
  if (foo != NULL) {
      [foo init];
  }
  ```
  
> 以下代码存在什么问题？

```objc
@autoreleasepool {
    for (int i = 0; i < INT_MAX; i++) {
        Test *test = [[Test alloc] init];
    }
}
```
  
  申请对象时，在 `ARC` 编译期间，会添加 `autorelease`，将申请的对象加入到自动释放池中。如果在一个自动释放池申请大量对象，那么对象的释放都需要等到这个这个自动释放所在的 `RunLoop` 休眠或结束时才能释放，申请大量对象时会造成内存泄漏。这种情况下，需要将 `@autoreleasepool` 加入到 `for` 循环里面。

> ^ 如果将 `for` 循环改为 `enumerateObjectsUsingBlock` 会不会有问题？

  不会有问题，这是因为枚举器方法实现时，已经将 `block` 嵌套在 `@autoreleasepool` 中。
  
## thread - “线程”

> 什么是线程安全？
  
  
> `iOS` 中如何创建一个常驻线程？

> 以下代码输出是什么？

```objc
NSLog(@"1");
dispatch_async(dispatch_get_global_queue(0, 0), ^{
    NSLog(@"2");
    [self performSelector:@selector(test) withObject:nil afterDelay:10];
    NSLog(@"3");
});
NSLog(@"4");
- (void)test
{
    NSLog(@"5");
}
```
  
## network - “网络”

> 如果手机应用与服务器通过 `TCP` 连接，这个时候手机切换为飞行模式，服务器可以短时间内知道到手机离线状态吗？

  服务器通过 `TCP` 短时间内是不能知晓手机的离线状态的。因为 `TCP` 主要是为了保证数据的可靠传输，通信双方是通过数据交换来了解对方状态。而 `TCP` 并没有设计心跳检测机制，所有就没有实时检测对方是否离线的能力。

> 三次握手可以携带数据吗？

  

## system - “操作系统”

> `backtrace` 是在用户态实现吗？

  先理解两个概念 : `backtrace`、用户态
  `backtrace` 是回溯栈，记录程序运行过程中的调用栈信息，当程序 `Crash` 时，可以通过这个信息了解程序崩溃的上下文，调试程序问题。
  用户态是属于操作系统的一个分区概念，主要分为内核态和用户态。两者的区别的是为了保证内核安全，只有以内核态运行的程序才具备操作系统所有资源的访问权限，而以用户态运行的程序会受到限制，这样是为了保证操作系统的稳定运行。