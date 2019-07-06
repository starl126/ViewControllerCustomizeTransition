//
//  LXModalController.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/5.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXModalController.h"

@interface LXModalController ()

@end

@implementation LXModalController

#pragma mark --- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.lightGrayColor;
    [self p_setupView];
}
- (void)p_setupView {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = UIColor.purpleColor;
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"dismiss controller" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(p_actionForClickDismissButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)p_actionForClickDismissButton:(UIButton*)sender {
    if (self.modalDelegate && [self.modalDelegate respondsToSelector:@selector(modalViewControllerDidClickDismissButton:)]) {
        [self.modalDelegate modalViewControllerDidClickDismissButton:self];
    }
}
- (void)dealloc {
    NSLog(@"dealloc --- %@", NSStringFromClass(self.class));
}

@end
