//
//  main.m
//  0xt01
//
//  Created by naijoug on 2024/3/13.
//

#import <Foundation/Foundation.h>

@interface Test: NSObject

- (void)run;

@end
@implementation Test

- (void)run {
    dispatch_queue_t queue = dispatch_get_main_queue();
    BOOL isEqual = [queue isKindOfClass:[NSObject class]];
    NSLog(@"isEqual = %d", isEqual);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        [[[Test alloc] init] run];
    }
    return 0;
}
