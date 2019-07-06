//
//  LXPopAnimation.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/6.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXPopAnimation.h"

@implementation LXPopAnimation

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
    CGRect finalFrame = CGRectOffset(initFrame, initFrame.size.width, 0);
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:duration animations:^{
        fromVc.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        CGRect frame = fromVc.view.frame;
        fromVc.view.frame = CGRectMake(finalFrame.size.width, frame.origin.y, frame.size.width, frame.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
- (void)dealloc {
    NSLog(@"dealloc --- %@", NSStringFromClass(self.class));
}

@end
