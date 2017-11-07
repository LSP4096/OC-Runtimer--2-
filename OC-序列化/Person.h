//
//  Person.h
//  OC-序列化
//
//  Created by 少朋刘 on 2017/11/7.
//  Copyright © 2017年 少朋刘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject <NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int age;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *tel;
@end
