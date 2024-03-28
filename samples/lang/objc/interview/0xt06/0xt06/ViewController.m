//
//  ViewController.m
//  0xt06
//
//  Created by naijoug on 2024/3/13.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *target;

@property (atomic, strong) NSString *string;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self question]; // 崩溃
    
    [self solutionInTaggedPointer];
    [self solutionInAtomic];
}

- (void)question {
    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 1000000 ; i++) {
        dispatch_async(queue, ^{
            self.target = [NSString stringWithFormat:@"ksddkjalkjd%d",i];
        });
    }
}

- (void)solutionInTaggedPointer {
    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 1000000 ; i++) {
        dispatch_async(queue, ^{
            self.target = [NSString stringWithFormat:@"kd%d",i];
        });
    }
}

- (void)solutionInAtomic {
    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 1000000 ; i++) {
        dispatch_async(queue, ^{
            self.string = [NSString stringWithFormat:@"ksddkjalkjd%d",i];
        });
    }
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
