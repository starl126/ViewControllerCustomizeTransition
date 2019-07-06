//
//  LXShowController.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/6.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXShowController.h"

@interface LXShowController ()

@end

@implementation LXShowController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.lightGrayColor;
    self.navigationItem.title = @"show";
    [self p_setupView];
}
- (void)p_setupView {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = UIColor.purpleColor;
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"pop controller" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(p_actionForClickPopButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)p_actionForClickPopButton:(UIButton*)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
