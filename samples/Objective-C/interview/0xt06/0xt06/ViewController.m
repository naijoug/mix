//
//  ViewController.m
//  0xt06
//
//  Created by naijoug on 2024/3/13.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *target;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
    for (int i = 0; i < 1000000 ; i++) {
        dispatch_async(queue, ^{
//             self.target = [NSString stringWithFormat:@"ksddkjalkjd%d",i];
            self.target = [NSString stringWithFormat:@"kd%d",i];
        });
    }
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
