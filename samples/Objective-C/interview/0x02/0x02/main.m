//
//  main.m
//  0x02
//
//  Created by naijoug on 2024/3/13.
//

#import <Foundation/Foundation.h>

@interface Animal: NSObject
@end
@implementation Animal
@end

@interface Dog: Animal
@end
@implementation Dog
    - (instancetype)init {
        self = [super init];
        if (self) {
            NSLog(@"self: %@", NSStringFromClass([self class]));
            NSLog(@"super: %@", NSStringFromClass([super class]));
        }
        return self;
    }
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dog *dog = [[Dog alloc] init];
        NSLog(@"%@", dog);
    }
    return 0;
}
