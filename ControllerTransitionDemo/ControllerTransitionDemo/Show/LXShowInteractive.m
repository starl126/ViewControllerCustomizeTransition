//
//  LXShowInteractive.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/6.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "LXShowInteractive.h"

@interface LXShowInteractive ()

@property (nonatomic, weak) UIViewController* toViewController;
@property (nonatomic, assign) CGPoint startP;
@property (nonatomic, assign, getter=isCompleted) BOOL completed;

@end

@implementation LXShowInteractive

- (void)setShowGestureToController:(UIViewController*)toViewController {
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
            self.startP = [pan locationInView:self.toViewController.view];
            self.interacting = YES;
            if (self.delegate && [self.delegate respondsToSelector:@selector(showInteractiveDidBegin:)]) {
                [self.delegate showInteractiveDidBegin:self];
            }
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint currentP = [pan locationInView:self.toViewController.view];
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
