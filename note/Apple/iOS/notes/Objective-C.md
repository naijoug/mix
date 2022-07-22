# Objective-C

## Reference

## Concept

- id & instancetype

| 类型 | 相同点 | 不同点
| --- | --- | ---
| `id`            | 可以表示任何对象 | 可以用在返回值和参数类型上
| `instancetype`  | 可以表示任何对象 | 只能用在返回值类型上，编译器会检测 instancetype 的真实类型

- load & initialize

| 方法 | 调用时机 | 子类实现 | 分类实现 | 调用顺序
| --- | --- | --- | --- | ---
| `load`          | 第一次装载进内存时调用  | 不会覆盖父类 | 不会覆盖原始类 | `父类 -> 子类 -> 分类`
| `initialize`    | 第一次使用这个类时调用  | 会覆盖父类   | 会覆盖原始类  | `父类 or 子类 or 分类`

- nil & NIL & NSNull

| 类型 | 说明
| --- | ---
| `nil`     | 一个空地址
| `NIL`     | 等价于 `nil`
| `NSNull`  | 一个指向 `nil` 的对象

- @property

| 属性 | 特性 | 说明 
| --- | --- | ---
| `readwrite`         | 可读可写    | 生成 getter 方法和 setter 方法
| `readonly`          | 只读        | 只会生成 getter 方法，不会生成 setter 方法
| `retain`            | 持有        | setter 方法将传入参数先持有(retain count +1)，再赋值
| `nonatomic`         | 非原子      | 非线程安全，编译更快
| `atomic`            | 原子        | 原子操作，保证线程安全
| `assign`            | 赋值        | setter 方法将传入参数赋值给实例变量
| `weak`              | 弱引用      | 对象被销毁时，会被设置nil
| `strong`            | 强引用      | 
| `copy`              | 复制        | 类似 strong，在赋值时进行 copy 而不是 retain，用于不可变对象，防止使用过程中被篡改(如：字符串，block)
| `unsafe_unretained` | 不安全的不持有 | 类似 weak，对象销毁时，不会被设置为 nil，比 weak 效率更高
| `nonnull`           | 不为空       | 
| `nullable`          | 可为空       |  

- `@synthesize` & `@dynamic`

| 修饰符 | 说明
| --- | ---
| `@synthesize` | 编译器自动生成 getter 和 setter
| `@dynamic`    | 显式表示不希望编译器生成 getter 和 setter

- category & extension

| 类型 | 加载时机 | 说明
| --- | --- | ---
| category  | 运行时 | 分类，用于扩展现有类功能
| extension | 编译时 | 一种特殊的(匿名) category，只能存在原始类 .m 文件中

- `#include` & `#import` & `@class`

| 类型 | 说明
| --- | ---
| `#include`    | C/C++ 导入关键字
| `#import`     | OC 导入关键字，只导入一次，不会重复导入
| `@class`      | 头文件引用类

- 协变 & 逆变
> iOS 9，泛型使用

| 类型 | 说明
| --- | ---
| `__covariant`     | 协变，子类转父类
| `__contravariant` | 逆变，父类转子类

## KVC & KVO

- [KVO 的内部实现](http://limboy.me/tech/2013/08/05/internal-implementation-of-kvo.html)
- [如何自己动手实现 KVO](https://tech.glowing.com/cn/implement-kvo/)

- `KVC`（Key Value Coding）
    > 是一种间接更改对象状态的方式，使用字符串来描述对象需要更改的属性(以字符串的形式向对象发送消息)。

```objc
valueForKey:                // 获取对象的属性值
setValue:ForKey:            // 修改对象的属性值

// 键路径(Key Path) : 类似属性的链式访问
valueForKeyPath:            // 通过
setValue:forKeyPath:        // 

// 批处理
dictionaryWithValuesForKeys:    // 
dictionaryWithObjects:forKeys:  // 
setValuesForKeysWithDictionary: // 

// 键路径的运算符
//   在键路径中，可以引用一些运算符来进行一些运算，例如获取一组值的平均值、最小值、最大值或者总数。
//1. 例如，计算Student中Book的总数
NSNumber *count = [student.books valueForKeyPath:@"@count"];   
//或者
NSNumber *count = [student valueForKeyPath:@"books.@count"];
//2. 计算Student中所有Book的价钱(price)总和
NSNumber *sum = [student.books valueForKeyPath:@"@sum.price"]; 
//或者
NSNumber *sum = [student valueForKeyPath:@"books.@sum.price"];
//3. 找出Student中Book的所有不同价位(排除相同价位)
NSArray *prices = [student.books valueForKeyPath:@"@distinctUnionOfObjects.price"];
//或者
NSArray *prices = [student valueForKeyPath:@"books.@distinctUnionOfObjects.price"];
```

- `KVO` (Key Value Observing)
    > KVO 是一种非常重要的机制，它允许监听对象的属性的变化。

```objc
/**
    注册监听器
        anObserver ：监听器对象
        keyPath ：监听的属性
        options ：决定了当属性改变时，要传递什么数据给监听器
*/
-(void)addObserver:(NSObject *)anObserver forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context

/** 
    监听器需要实现监听方法
        keyPath ：监听的属性
        object ：谁的属性改变了
        change ：属性改变时传递过来的信息（取决于添加监听器时的options参数）
*/
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context

/** 移除监听器 */
-(void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath

// 手动设定KVO
- (void)setAge:(NSString *)age {
    [self willChangeValueForKey:@"age"];
    _age = age;
    [self didChangeValueForKey:@"age"];
}
- (NSString *)age {
    return _age;
}
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
    // 如果监测到键值为age,则指定为非自动监听对象
    if ([key isEqualToString:@"age"]) {
        return NO;
    }
    return [super automaticallyNotifiesObserversForKey:key];
}
```

## Block

- [How Do I Declare A Block in Objective-C?](http://fuckingblocksyntax.com/)
- [对 Objective-C 中 Block 的追探](http://www.cnblogs.com/biosli/archive/2013/05/29/iOS_Objective-C_Block.html)

```objc
// 定义 block
//      本地变量
returnType (^blockName)(parameterTypes) = ^returnType(parameters) {...};
//      属性
@property (nonatomic, copy, nullability) returnType (^blockName)(parameterTypes);
//      方法参数类型
- (void)someMethodThatTakesABlock:(returnType (^nullability)(parameterTypes))blockName;
//      方法调用参数
[someObject someMethodThatTakesABlock:^returnType (parameters) {...}];
//      C 函数参数类型
void SomeFunctionThatTakesABlock(returnType (^blockName)(parameterTypes));
//      定义一个类型
typedef returnType (^TypeName)(parameterTypes);
TypeName blockName = ^returnType(parameters) {...};
```

- Block 内存机制

| 类型 | 说明
| --- | ---
| `NSMallocBlock`   | 存储于堆区
| `NSStackBlock`    | 存储于栈区
| `NSGlobalBlock`   | 存储于程序数据区

```objc
typedef void (^blk)(void);

blk returnBlock() {
    int val = 11;
    return ^{ NSLog(@"val = %d", val); };
}

void testBlock() {
    // 修改 Block 之外的局部变量，需要使用 __block 关键字
    __block int val = 10;
    
    // 强引用 block : 存放在堆上
    __strong blk strongPointerBlock = ^{ NSLog(@"val = %d", ++val); };
    strongPointerBlock();
    NSLog(@"strongPointerBlock: %@", strongPointerBlock);
    
    // 弱应用 block : 存放在栈上
    __weak blk weakPointerBlock = ^{ NSLog(@"val = %d", ++val); };
    weakPointerBlock();
    NSLog(@"weakPointerBlock: %@", weakPointerBlock);
    
    // 弱引用 copy block : 存放在堆上
    blk copyBlock = [weakPointerBlock copy];
    copyBlock();
    NSLog(@"copyBlock: %@", copyBlock);
    
    // 临时 block : 存放在栈上
    NSLog(@"tempBlock %@", ^{ NSLog(@"val = %d", ++val); } );
    
    // block 作为返回值 : 存放在栈上
    NSLog(@"returnBlock: %@", returnBlock());
}
```

- Block vs 函数指针

| 类型 | 说明
| --- | ---
| Block     | 一个函数对象，包含函数信息，有类型限制
| 函数指针   | 是一个地址，不具备函数原型信息，没有类型限制

```objc
int (*func)(int, int);  // 定义函数指针
int (^block)(int, int); // 定义 Block

(*func)(10, 20);        // 调用函数指针
block(10, 20);          // 调用 Block
```

- 解除循环引用
    1. 局部变量默认都是强引用的，离开其所在的作用域之后就会被释放
    2. 使用 `__weak` 关键字，可以将局部变量声明为弱引用
    3. 在 Block 中引用 `weakSelf`，则 Block 不会再对 `self` 做强引用

```objc
@property (nonatomic, strong) NSMutableArray *myBlocks;
int(^sum)(int, int) = ^(int x, int y) {
    return [self sum:x y:y];
};

// 形成循环引用
[self.myBlocks addObject:sum];

// 修改 block 解除循环引用
__weak DemoObj *weakSelf = self;
int(^sum)(int, int) = ^(int x, int y) {
    return [weakSelf sum: x y: y];
};
```

## Copy

- 深复制 & 潜复制
    > 只有不可变对象创建不可变副本(copy)才是浅复制，其他都是深复制

| 复制类型 | 说明
| --- | ---
| 深复制   | 内容拷贝，源对象和副本指向的是不同的两个对象；源对象引用计数器不变，副本计数器设置为1
| 浅复制   | 指针拷贝，源对象和副本指向的是同一个对象；对象的引用计数器+1

- `Copy` & `MutableCopy`
    >  使用 `copy` 或 `mutableCopy` 方法可以创建一个对象的副本

| 复制类型 | 说明
| --- | ---
| `copy`        | 需要实现`NSCopying`协议，创建的是不可变副本(如`NSString`、`NSArray`、`NSDictionary`)
| `mutableCopy` | 需要先实现`NSMutableCopying`协议，创建的是可变副本(如`NSMutableString`、`NSMutableArray`、`NSMutableDictionary`)

| 源对象 | 复制方式 | 副本 
| --- | --- | --- 
| NSArray NSMutableArray            | copy          | NSArray  
|                                   | mutableCopy   | NSMutableArray 
| NSDictionary NSMutableDictionary  | copy          | NSDictionary  
|                                   | mutableCopy   | NSMutableDictionary 
| NSString NSMutableString          | copy          | NSString 
|                                   | mutableCopy   | NSMutableString 

- 自定义类添加复制功能
    > 如果想自定义 `copy`, 那么就必须遵守 `NSCopying`, 并且实现 `copyWithZone:` 方法
    >
    > 如果想自定义 `mutableCopy`, 那么就必须遵守 `NSMutableCopying`, 并且实现 `mutableCopyWithZone:` 方法

``` objc
// 以copy为例,建议用[self class]代替直接类名
- (id)copyWithZone:(NSZone *)zone {
    id copy = [[[self class] allocWithZone: zone] init];
    // 属性的初始化.....
    return copy;
}

// 自定义对象的copyWithZone
- (id)copyWithZone:(NSZone *)zone {
    Person *p   = [[[self class] allocWithZone: zone] init];  
    p.name      = self.name;
    p.age       = self.age;
    return p;
}
```

## NSCache
> 线程安全, 具有自动移除对象来释放内存的 `NSMutableDictionary`, key 不需要实现 `NSCopying` 协议.

- [NSCache](http://nshipster.cn/nscache/)
- [Foundation: NSCache](http://southpeak.github.io/2015/02/11/cocoa-foundation-nscache/)
- [NSCache 源码分析](https://github.com/nixzhu/dev-blog/blob/master/2015-12-09-nscache.md)