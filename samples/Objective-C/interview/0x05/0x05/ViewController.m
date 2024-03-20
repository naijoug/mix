//
//  ViewController.m
//  0x05
//
//  Created by naijoug on 2024/3/13.
//

#import "ViewController.h"

@interface Person : NSObject
@property(nonatomic, copy) NSString *name;
@end
@implementation Person
- (void)speak {
    NSLog(@"My name is: %@", self.name);
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *str = @"test";
    
    id cls = [Person class];
    void *obj = &cls;
    [(__bridge id)obj speak];
    
    NSLog(@"%@ - %@", cls, obj);
    //NSLog(@"cls address:%p str address:%p", &cls, &str);
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
