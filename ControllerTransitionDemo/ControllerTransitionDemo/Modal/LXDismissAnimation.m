//
//  LXDismissAnimation.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/5.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXDismissAnimation.h"

@implementation LXDismissAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4f;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController* fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toVc   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVc];
    
    UIView* containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    [containerView sendSubviewToBack:toVc.view];
    CGRect finalFrame = CGRectOffset(initFrame, 0, initFrame.size.height);
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        fromVc.view.transform = CGAffineTransformMakeRotation(M_PI_2);
        fromVc.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
- (void)dealloc {
    NSLog(@"dealloc --- %@", NSStringFromClass(self.class));
}

@end
