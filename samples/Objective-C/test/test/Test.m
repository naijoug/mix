//
//  Test.m
//  test
//
//  Created by naijoug on 2023/10/31.
//

#import "Test.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface Student1 : NSObject
@property(nonatomic, assign) int age;
@property(nonatomic, assign) int no;
@end
@implementation Student1
@end

@interface Student2 : NSObject
@property(nonatomic, assign) int age;
@property(nonatomic, assign) int no;
@property(nonatomic, copy) NSString *name;
@end
@implementation Student2
@end

@interface Father : NSObject
@end
@implementation Father
@end

@interface Son : Father
@end
@implementation Son
@end

@implementation Test

+ (void)test {
    [Test test0];
    [Test test1];
    [Test test2];
    [Test test3];
}

+ (void)test0 {
    NSLog(@"");
    
    Class metaClass = object_getClass([NSObject class]);
    // 一个 metaClass 实例占用 40 个字节
    NSLog(@"NSObject meta 占用字节: %zu", class_getInstanceSize(metaClass));
    // 一个 NSObject 实例占用 8(isa) 个字节
    NSLog(@"NSObject 占用字节: %zu", class_getInstanceSize([NSObject class]));
    NSObject *obj = [[NSObject alloc] init];
    // 对象指针内存占用 8(isa) + 8(对齐) = 16 个字节
    NSLog(@"NSObject 实例占用字节 %zu", malloc_size((__bridge  const void *)obj));
}

+ (void)test1 {
    NSLog(@"");
    // Student1 实例占用 8(isa) + 4(int) + 4(int) = 16 个字节
    NSLog(@"Student1 占用字节: %zu", class_getInstanceSize([Student1 class]));
    Student1 *obj = [[Student1 alloc] init];
    obj.no = 1;
    obj.age = 30;
    // 对象指针内存占用 8(isa) + 4(int) + 4(int) = 16 个字节
    NSLog(@"Student1 实例占用字节: %zu", malloc_size((__bridge const void *)obj));
}

+ (void)test2 {
    NSLog(@"");
    // Student2 实例占用 8(isa) + 4(int) + 4(int) + 8(NSString) = 24 个字节
    NSLog(@"Student2 占用字节: %zu", class_getInstanceSize([Student2 class]));
    Student2 *obj = [[Student2 alloc] init];
    obj.no = 1;
    obj.age = 30;
    obj.name = @"a";
    // 对象指针内存占用 8(isa) + 4(int) + 4(int) + 8(NSString) + 8(对齐) = 32 个字节
    NSLog(@"Student2 实例占用字节: %zu", malloc_size((__bridge const void *)obj));
}

+ (void)test3 {
    Son *sonObject = [Son new];

    Father *fatherObject = [Father new];

    BOOL ret1 = [Son isKindOfClass:[fatherObject class]];

    BOOL ret2 = [sonObject isKindOfClass:[Father class]];

    BOOL ret3 = [Son isMemberOfClass:[fatherObject class]];

    BOOL ret4 = [sonObject isMemberOfClass:[Father class]];

    NSLog(@"%d------%d-------%d-------%d",ret1,ret2,ret3,ret4);
}

@end

