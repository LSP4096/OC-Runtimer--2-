//
//  Person.m
//  OC-序列化
//
//  Created by 少朋刘 on 2017/11/7.
//  Copyright © 2017年 少朋刘. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

- (void)encodeWithCoder:(NSCoder *)coder
{
//    [coder encodeObject:self.name forKey:@"name"];
//    [coder encodeInt:_age forKey:@"age"];
    
    //为了解决成员变量过多问题，我们runtimer来实现
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        //利用KVC
        [coder encodeObject:[self valueForKey:key] forKey:key];
    }
    free(ivars); //释放对应的区域
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
//        _name = [coder decodeObjectForKey:@"name"];
//        _age = [coder decodeIntForKey:@"age"];
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [NSString stringWithUTF8String:name];
            //取值
            id value = [coder decodeObjectForKey:key];
            //kvc设置
            [self setValue:value forKey:key];
        }
        free(ivars); //释放对应的区域
    }
    return self;
}

@end
