//
//  ViewController.m
//  OC-序列化
//
//  Created by 少朋刘 on 2017/11/7.
//  Copyright © 2017年 少朋刘. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 解归档
}


- (IBAction)save:(id)sender {
    Person *p = [[Person alloc] init];
    p.name = @"Twelve";
    p.age = 12;
    p.address = @"浙江";
    p.tel = @"123456";
    
    //沙河路径
    NSString *temppath = NSTemporaryDirectory();
    NSString *filepath = [temppath stringByAppendingPathComponent:@"Twelve.twelve"];
    NSLog(@"%@", filepath);
    
    //  存在本地
    [NSKeyedArchiver archiveRootObject:p toFile:filepath];
}

- (IBAction)get:(id)sender {
    NSString *temppath = NSTemporaryDirectory();
    NSString *filepath = [temppath stringByAppendingPathComponent:@"Twelve.twelve"];
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filepath];
    NSLog(@"%@--%d---%@----%@", p.name, p.age, p.address, p.tel);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
