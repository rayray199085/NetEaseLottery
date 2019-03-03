//
//  SCAboutTableViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCAboutTableViewController.h"
#import "SCAboutHeaderView.h"
#define APPID @"1307961750"
@interface SCAboutTableViewController ()

@end

@implementation SCAboutTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableHeaderView = [SCAboutHeaderView aboutHeaderView];
}
-(void)makeACall{
    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",cell.detailTextLabel.text]]];
}
-(void)sendAMessage{
    UITableViewCell *cell = [self tableView:self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",cell.detailTextLabel.text]]];
}
-(void)rateThisApp{
    UIApplication *application = [UIApplication sharedApplication];
    [application openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/cn/app/id%@", APPID]]];
}
@end
