//
//  LXDismissInteractive.h
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/5.
//  Copyright © 2019 starxin. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface LXDismissInteractive : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;
- (void)setDismissInteractiveToController:(UIViewController*)toViewController;

@end

NS_ASSUME_NONNULL_END
