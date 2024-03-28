//
//  main.m
//  0x03
//
//  Created by naijoug on 2024/3/13.
//

#import <Foundation/Foundation.h>

@interface NSObject (Test)
+ (void)test;
- (void)test;
@end

@implementation NSObject (Test)
- (void)test {
    NSLog(@"testing...");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 正常调用，输出 "testing..."
        [[[NSObject alloc] init] test];
        // 输出 "testing..."，会调用到实例方法 -(void)test
        //      NSObject 是根类，根类的元类 superclass 指针会指向类对象
        //      类方法存放在元类中，而实例方法存放在类对象中
        //      调用 [NSObject test]; 会先元类方法列表中，
        //      没有，继续到父类中查找，而 NSObject 元类的父类指针指向了 NSObject 类对象，所以最终会调到 -(void)test。
        [NSObject test];
    }
    return 0;
}
