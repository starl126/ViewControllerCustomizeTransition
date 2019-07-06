//
//  LXPresentInteractivie.h
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/5.
//  Copyright © 2019 starxin. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN
@class LXPresentInteractive;
@protocol LXPresentInteractiveDelegate <NSObject>

@optional
///交互开始
- (void)presentInteractiveDidBegin:(LXPresentInteractive*)presentInteractive;

@end

@interface LXPresentInteractive : UIPercentDrivenInteractiveTransition

///是否正在交互中
@property (nonatomic, assign) BOOL interacting;
///创建交互手势
- (void)setPresentInteractiveToController:(UIViewController*)toViewController;
@property (nonatomic, weak) id<LXPresentInteractiveDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
