//
//  main.m
//  0x07
//
//  Created by naijoug on 2024/3/13.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

@interface Person : NSObject
@property(nonatomic, assign) int age;
@property(nonatomic, assign) int height;
@end
@implementation Person
@end

@interface Student : Person
@property(nonatomic, copy) NSString *school;
@end
@implementation Student
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"****** NSObject ******");
        Class metaClass = object_getClass([NSObject class]);
        // 一个 metaClass 实例占用 40 个字节
        NSLog(@"NSObject 元类 - 占用字节: %zu", class_getInstanceSize(metaClass));
        // 一个 NSObject 实例占用 8(isa) 个字节
        NSLog(@"NSObject 类 - 占用字节: %zu", class_getInstanceSize([NSObject class]));
        NSObject *obj = [[NSObject alloc] init];
        // 对象指针内存占用 8(isa) + 8(对齐) = 16 个字节
        NSLog(@"NSObject 实例 - 占用字节 %zu", malloc_size((__bridge  const void *)obj));
        
        NSLog(@"\n****** Person ******");
        NSLog(@"Person 元类 - 占用字节: %zu", class_getInstanceSize(object_getClass([Person class])));
        // Student 实例占用 8(isa) + 4(int) + 4(int) = 16 个字节
        NSLog(@"Person 类 - 占用字节: %zu", class_getInstanceSize([Person class]));
        Person *person = [[Person alloc] init];
        person.age = 30;
        person.height = 188;
        // 对象指针内存占用 8(isa) + 4(int) + 4(int) = 16 个字节
        NSLog(@"Person 实例 - 占用字节: %zu", malloc_size((__bridge const void *)person));
        
        NSLog(@"\n****** Student ******");
        NSLog(@"Student 元类 - 占用字节: %zu", class_getInstanceSize(object_getClass([Student class])));
        // Student 实例占用 8(isa) + 4(int) + 4(int) + 8(NSString) = 24 个字节
        NSLog(@"Student 类 - 占用字节: %zu", class_getInstanceSize([Student class]));
        Student *student = [[Student alloc] init];
        student.age = 10;
        student.height = 150;
        student.school = @"School";
        // 对象指针内存占用 8(isa) + 4(int) + 4(int) + 8(NSString) + 8(对齐) = 32 个字节
        NSLog(@"Student 实例 - 占用字节: %zu", malloc_size((__bridge const void *)student));
    }
    return 0;
}
