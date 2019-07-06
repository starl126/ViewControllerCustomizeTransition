//
//  LXShowInteractive.h
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/6.
//  Copyright © 2019 starxin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LXShowInteractive;
@protocol LXShowInteractiveDelegate <NSObject>

@optional
///交互开始
- (void)showInteractiveDidBegin:(LXShowInteractive*)presentInteractive;

@end

@interface LXShowInteractive : UIPercentDrivenInteractiveTransition

///是否正在交互中
@property (nonatomic, assign) BOOL interacting;
///创建交互手势
- (void)setShowGestureToController:(UIViewController*)toViewController;
@property (nonatomic, weak) id<LXShowInteractiveDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
