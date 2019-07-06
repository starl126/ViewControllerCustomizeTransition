//
//  LXModalController.h
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/5.
//  Copyright © 2019 starxin. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN
@class LXModalController;
@protocol LXModalControllerDelegate <NSObject>

@optional
- (void)modalViewControllerDidClickDismissButton:(LXModalController*)modelController;

@end

@interface LXModalController : UIViewController

@property (nonatomic, weak) id<LXModalControllerDelegate> modalDelegate;

@end

NS_ASSUME_NONNULL_END
