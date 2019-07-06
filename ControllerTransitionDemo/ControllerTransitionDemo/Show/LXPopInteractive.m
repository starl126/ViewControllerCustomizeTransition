//
//  LXPopInteractive.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/6.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXPopInteractive.h"

@interface LXPopInteractive ()

@property (nonatomic, weak) UIViewController* toViewController;
@property (nonatomic, assign, getter=isCompleted) BOOL completed;
@property (nonatomic, assign) CGPoint startP;

@end

@implementation LXPopInteractive

- (void)setPopInteractiveToController:(UIViewController*)toViewController {
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
            [self.toViewController.navigationController popViewControllerAnimated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint currentP = [pan locationInView:self.toViewController.view.superview];
            CGFloat fraction = (currentP.y-self.startP.y)/100.0;
            fraction = fminf(fmaxf(0.0, fraction),1.0);
            self.completed = (fraction>0.5);
            NSLog(@"fraction=%.3f",fraction);
            [self updateInteractiveTransition:fraction];
        }
            break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        {
            [self cancelInteractiveTransition];
            self.interacting = NO;
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (self.isCompleted) {
                [self finishInteractiveTransition];
            }else {
                [self cancelInteractiveTransition];
            }
            self.interacting = NO;
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
