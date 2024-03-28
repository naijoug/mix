//
//  main.m
//  0x06
//
//  Created by naijoug on 2024/3/13.
//

#import <Foundation/Foundation.h>

@interface Father : NSObject
@end
@implementation Father
@end

@interface Son : Father
@end
@implementation Son
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Son *son = [[Son alloc] init];
        Father *father = [[Father alloc] init];
        
        NSLog(@"%d", [Son isKindOfClass:[father class]]);
        NSLog(@"%d", [son isKindOfClass:[Father class]]);
        NSLog(@"%d", [Son isMemberOfClass:[father class]]);
        NSLog(@"%d", [son isMemberOfClass:[Father class]]);
        
        NSLog(@"[father class]: %@", [father class]);
        NSLog(@"[Father class]: %@", [Father class]);
    }
    return 0;
}
