//
//  ViewController.m
//  0xt05
//
//  Created by naijoug on 2024/3/13.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self run]; // 1 4 2 3
    [self runInRunLoop]; // 1 4 2 5 3
    [self runInMain]; // 1 4 2 3 5
}

- (void)run {
    NSLog(@"1");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"2");
        [self performSelector:@selector(test:) withObject:@"" afterDelay:1];
        NSLog(@"3");
    });
    NSLog(@"4");
}

- (void)runInRunLoop {
    NSLog(@"runloop 1");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"runloop 2");
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        [self performSelector:@selector(test:) withObject:@"runloop" afterDelay:1];
        [runloop run];
        NSLog(@"runloop 3");
    });
    NSLog(@"runloop 4");
}

- (void) runInMain {
    NSLog(@"main 1");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"main 2");
        [self performSelectorOnMainThread:@selector(test:) withObject:@"main" waitUntilDone:NO];
        NSLog(@"main 3");
    });
    NSLog(@"main 4");
}

- (void)test:(NSString *)tag {
    NSLog(@"%@ 5", tag);
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
