

//
//  SCSettingsTableViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 28/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCSettingsTableViewController.h"
#import "SCRedeemCodeViewController.h"
#import "SCSettingsTableViewCell.h"
#import "SCLiveResultTableViewController.h"

@interface SCSettingsTableViewController ()
@property(nonatomic,strong)NSArray *groups;
@end

@implementation SCSettingsTableViewController
- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (NSArray *)groups{
    if(_groups == nil){
        NSString *path = [[NSBundle mainBundle]pathForResource:self.plistName ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _groups = array;
    }
    return _groups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title = @"Settings";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"NavBack"] style:UIBarButtonItemStylePlain target:self action:@selector(back2Previous)];
}
-(void)back2Previous{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dict = self.groups[section];
    NSArray *cells = dict[@"items"];
    return cells.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.groups[indexPath.section];
    NSArray *array = dict[@"items"];
    NSDictionary *subDict = array[indexPath.row];
    SCSettingsTableViewCell *cell = [SCSettingsTableViewCell settingsCellWithTableView:tableView andWithDictionary:subDict];
    cell.dict = subDict;
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *dict = self.groups[section];
    return dict[@"header"];
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSDictionary *dict = self.groups[section];
    return dict[@"footer"];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.groups[indexPath.section];
    NSArray *array = dict[@"items"];
    NSDictionary *subDict = array[indexPath.row];
    if(subDict[@"destinationController"] != nil && [subDict[@"destinationController"] length] > 0){
        Class clz = NSClassFromString(subDict[@"destinationController"]);
        UIViewController *controller = (UIViewController *)[[clz alloc]init];
        if([controller isKindOfClass:[SCSettingsTableViewController class]]){
            SCSettingsTableViewController *sc =(SCSettingsTableViewController *) controller;
            sc.plistName = subDict[@"plistName"];
        }
        controller.navigationItem.title = subDict[@"title"];
        [self.navigationController pushViewController:controller animated:YES];
    }
    if(subDict[@"functionName"] != nil && [subDict[@"functionName"] length] > 0){
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector: NSSelectorFromString(subDict[@"functionName"])];
        #pragma clang diagnostic pop
    }
}
-(void)checkUpdateStatus{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Your application has been up to date." delegate:nil cancelButtonTitle:@"Confirm" otherButtonTitles:nil, nil];
    [alert show];
}
@end
