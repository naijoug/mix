//
//  main.m
//  0xc01
//
//  Created by naijoug on 2024/3/13.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a[5] = { 1,2,3,4,5 };
        int *ptr = (int *)(&a + 1);
        printf("%d, %d\n", *(a + 1), *(ptr - 1));
    }
    return 0;
}
