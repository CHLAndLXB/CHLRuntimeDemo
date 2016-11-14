//
//  ViewController.m
//  runtime动态添加属性
//
//  Created by iosDeveloper on 16/9/28.
//  Copyright © 2016年 恒众鑫智能技术. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+backgroundColor.h"
#import <objc/objc-runtime.h>
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIColor *color1 =[UIColor redColor];
//    self.color =[UIColor redColor];
//    
//    self.view.backgroundColor =self.color;
    
   // NSLog(@"%@,%@",self.color,color1);
    
    
    UIButton *gotobtn =[UIButton buttonWithType:UIButtonTypeCustom];
    gotobtn.frame =CGRectMake(10, 100, 100, 100);
    [gotobtn setBackgroundColor:[UIColor blueColor]];
    [gotobtn addTarget:self action:@selector(BtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gotobtn];
}

-(void)BtnAction:(UIButton *)sender{
    ViewController2 *ctl =[[ViewController2 alloc]init];
    
    [self presentViewController:ctl animated:YES completion:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
