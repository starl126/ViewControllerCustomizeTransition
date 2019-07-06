//
//  LXMainController.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/5.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXMainController.h"
#import "LXModalController.h"
#import "LXDismissAnimation.h"
#import "LXPresentAnimation.h"
#import "LXPresentInteractive.h"
#import "LXDismissInteractive.h"

@interface LXMainController ()<UIViewControllerTransitioningDelegate,LXModalControllerDelegate,LXPresentInteractiveDelegate>

@property (nonatomic, strong) LXPresentAnimation* presentAnimation;
@property (nonatomic, strong) LXDismissAnimation* dismissAnimation;

@property (nonatomic, strong) LXPresentInteractive* presentInteractive;
@property (nonatomic, strong) LXDismissInteractive* dismissInteractive;

@end

@implementation LXMainController

#pragma mark --- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self p_setupView];
    [self p_prepareTransitionConfiguration];
}
- (void)p_setupView {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = UIColor.purpleColor;
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"present controller" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(p_actionForClickPresentButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back.backgroundColor = UIColor.purpleColor;
    back.frame = CGRectMake(20.0, 44.0, 40.0, 30.0);
    [back setTitle:@"back" forState:UIControlStateNormal];
    [back setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [back addTarget:self action:@selector(p_actionForClickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
}
- (void)p_prepareTransitionConfiguration {
    _presentAnimation = [LXPresentAnimation new];
    _dismissAnimation = [LXDismissAnimation new];
    _presentInteractive = [LXPresentInteractive new];
    _dismissInteractive = [LXDismissInteractive new];
    
    _presentInteractive.delegate = self;
    [_presentInteractive setInteractiveGestureToController:self];
}
- (void)p_actionForClickPresentButton:(UIButton*)sender {
    LXModalController* modalVc = [[LXModalController alloc] init];
    modalVc.transitioningDelegate = self;
    modalVc.modalDelegate = self;
    [self presentViewController:modalVc animated:YES completion:nil];
    [_dismissInteractive setDismissInteractiveToController:modalVc];
}
- (void)p_actionForClickBackButton:(UIButton*)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark --- LXModalControllerDelegate
- (void)modalViewControllerDidClickDismissButton:(LXModalController *)modelController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark --- LXPresentInteractiveDelegate
- (void)presentInteractiveDidBegin:(LXPresentInteractive *)presentInteractive {
    [self p_actionForClickPresentButton:nil];
}

#pragma mark --- UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return self.presentAnimation;
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissAnimation;
}
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.presentInteractive.interacting?self.presentInteractive:nil;
}
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.dismissInteractive.interacting?self.dismissInteractive:nil;
}
- (void)dealloc {
    NSLog(@"dealloc --- %@", NSStringFromClass(self.class));
}

@end
