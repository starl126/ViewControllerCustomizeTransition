//
//  LXDismissInteractive.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/5.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXDismissInteractive.h"

@interface LXDismissInteractive ()

@property (nonatomic, weak) UIViewController* toViewController;
@property (nonatomic, assign, getter=isCompleted) BOOL completed;
@property (nonatomic, assign) CGPoint startP;

@end

@implementation LXDismissInteractive

- (void)setDismissInteractiveToController:(UIViewController*)toViewController {
    self.toViewController = toViewController;
    [self p_preparePanGestureInView:toViewController.view];
}
- (void)p_preparePanGestureInView:(UIView*)inView {
    UIPanGestureRecognizer* pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(p_actionForPanGesture:)];
    inView.userInteractionEnabled = YES;
    [inView addGestureRecognizer:pan];
}
- (void)p_actionForPanGesture:(UIPanGestureRecognizer*)pan {
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.startP = [pan locationInView:self.toViewController.view.superview];
            self.interacting = YES;
            [self.toViewController dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint currentP = [pan locationInView:self.toViewController.view.superview];
            CGFloat fraction = (currentP.y-self.startP.y)/100.0;
            fraction = fminf(fmaxf(0.0, fraction),1.0);
            self.completed = (fraction>0.5);
            [self updateInteractiveTransition:fraction];
        }
            break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        {
            self.interacting = NO;
            [self cancelInteractiveTransition];
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            self.interacting = NO;
            if (self.isCompleted) {
                [self finishInteractiveTransition];
            }else {
                [self cancelInteractiveTransition];
            }
        }
            break;
        default:
            break;
    }
}
- (CGFloat)completionSpeed {
    return 1-self.percentComplete;
}
- (void)dealloc {
    NSLog(@"dealloc --- %@", NSStringFromClass(self.class));
}

@end
