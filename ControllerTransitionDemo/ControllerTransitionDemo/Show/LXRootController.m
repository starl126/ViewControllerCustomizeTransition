//
//  LXRootController.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/6.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXRootController.h"
#import "LXShowController.h"
#import "LXShowAnimation.h"
#import "LXPopAnimation.h"
#import "LXShowInteractive.h"
#import "LXPopInteractive.h"

@interface LXRootController ()<UINavigationControllerDelegate,LXShowInteractiveDelegate>

@property (nonatomic, strong) LXShowAnimation* showAmination;
@property (nonatomic, strong) LXPopAnimation*  popAnimation;
@property (nonatomic, strong) LXShowInteractive* showInteractive;
@property (nonatomic, strong) LXPopInteractive* popInteractive;

@end

@implementation LXRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"root";
    self.navigationController.delegate = self;
    [self p_prepareTransitionConfiguration];
    [self p_setupView];
}
- (void)p_prepareTransitionConfiguration {
    self.showAmination = [LXShowAnimation new];
    self.popAnimation  = [LXPopAnimation new];
    self.showInteractive = [LXShowInteractive new];
    self.popInteractive  = [LXPopInteractive new];
    
    [self.showInteractive setShowGestureToController:self];
    self.showInteractive.delegate = self;
}
- (void)p_setupView {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = UIColor.purpleColor;
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"show controller" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(p_actionForClickShowButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)p_actionForClickShowButton:(UIButton*)sender {
    LXShowController* showVc = [[LXShowController alloc] init];
    [self.navigationController pushViewController:showVc animated:YES];
    [self.popInteractive setPopInteractiveToController:self.navigationController.viewControllers.lastObject];
}

#pragma mark --- LXShowInteractiveDelegate
- (void)showInteractiveDidBegin:(LXShowInteractive*)presentInteractive {
    [self p_actionForClickShowButton:nil];
}

#pragma mark --- UINavigationControllerDelegate
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0) {
    
    if (navigationController.viewControllers.count == 2) {
        return self.showInteractive.interacting?self.showInteractive:nil;
    }else {
        return self.popInteractive.interacting?self.popInteractive:nil;
    }
}
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0) {
    if (operation == UINavigationControllerOperationPush) {
        return self.showAmination;
    }else if (operation == UINavigationControllerOperationPop) {
        return self.popAnimation;
    }else {
        return nil;
    }
}

@end
