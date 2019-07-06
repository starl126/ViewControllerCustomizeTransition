//
//  LXShowAnimation.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/6.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXShowAnimation.h"

@implementation LXShowAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController* fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toVc   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView* containerView = [transitionContext containerView];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVc];
    toVc.view.transform = CGAffineTransformMakeRotation(M_PI_2);
    CGRect initFrame = CGRectOffset(finalFrame, finalFrame.size.width, 0);
    toVc.view.frame = initFrame;
    [containerView addSubview:toVc.view];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        toVc.view.transform = CGAffineTransformMakeRotation(0);
        toVc.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}
- (void)dealloc {
    NSLog(@"dealloc --- %@", NSStringFromClass(self.class));
}

@end
