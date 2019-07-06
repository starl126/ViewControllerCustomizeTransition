//
//  ViewController.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/5.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "ViewController.h"
#import "LXMainController.h"
#import "LXBaseNavController.h"
#import "LXRootController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

#pragma mark --- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}
#pragma mark --- UITableViewDelegate,UITableViewDataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {//modal
        LXMainController* mainVc = [[LXMainController alloc] init];
        [self presentViewController:mainVc animated:YES completion:nil];
    }else {//show
        LXRootController* root = [[LXRootController alloc] init];
        LXBaseNavController* nav = [[LXBaseNavController alloc] initWithRootViewController:root];
        [self presentViewController:nav animated:YES completion:nil];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
