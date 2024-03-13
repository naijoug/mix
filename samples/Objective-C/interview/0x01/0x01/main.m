//
//  main.m
//  0x01
//
//  Created by naijoug on 2024/3/13.
//

#import <Foundation/Foundation.h>

@interface Test : NSObject

@property (atomic) NSInteger i;

- (void)run:(NSString *)tag;

@end
@implementation Test

- (void)run:(NSString *)tag {
    for (int i = 0; i < 10000; i++) {
        self.i++;
        NSLog(@"%@ i = %ld", tag, (long)self.i);
    }
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Test *test = [[Test alloc] init];
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, ^{
            [test run:@"task1"];
        });
        dispatch_async(queue, ^{
            [test run:@"task2"];
        });
        
        sleep(8);
        NSLog(@"Hello World!");
    }
    return 0;
}
