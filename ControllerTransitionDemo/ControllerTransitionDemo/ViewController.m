//
//  ViewController.m
//  ControllerTransitionDemo
//
//  Created by 天边的星星 on 2019/7/5.
//  Copyright © 2019 starxin. All rights reserved.
//

#import "ViewController.h"
#import "LXMainController.h"

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
        
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
