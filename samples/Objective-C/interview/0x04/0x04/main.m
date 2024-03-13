//
//  main.m
//  0x04
//
//  Created by naijoug on 2024/3/13.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject
 + (void)test;
 - (void)test;
 @end

 @implementation Test
 - (void)test {
    NSLog(@"testing...");
 }
 @end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[[Test alloc] init] test];
        [Test test]; // 崩溃找不到方法
    }
    return 0;
}
