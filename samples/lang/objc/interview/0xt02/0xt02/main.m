//
//  main.m
//  0xt02
//
//  Created by naijoug on 2024/3/13.
//

#import <Foundation/Foundation.h>

@interface Test: NSObject

- (void)runSyncInMain;
- (void) runSyncInGlobal;

@end

@implementation Test

- (void)runSyncInMain {
    NSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
}

- (void)runSyncInGlobal {
    NSLog(@"a");
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"b");
    });
    NSLog(@"c");
}


@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 主线程运行，输出 1 之后崩溃
//        [[[Test alloc] init] runSyncInMain];
//        [[[Test alloc] init] runSyncInGlobal];
        // 子线程运行，仅输出 1
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [[[Test alloc] init] runSyncInMain];
            [[[Test alloc] init] runSyncInGlobal];
        });
        
        sleep(3);
        NSLog(@"Hello world!");
    }
    return 0;
}
