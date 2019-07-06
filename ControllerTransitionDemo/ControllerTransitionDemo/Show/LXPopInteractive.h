//
//  LXPopInteractive.h
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/6.
//  Copyright © 2019 starxin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXPopInteractive : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL interacting;
- (void)setPopInteractiveToController:(UIViewController*)toViewController;

@end

NS_ASSUME_NONNULL_END
