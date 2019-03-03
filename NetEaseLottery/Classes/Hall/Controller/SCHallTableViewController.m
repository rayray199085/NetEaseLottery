//
//  SCHallTableViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 27/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCHallTableViewController.h"

@interface SCHallTableViewController ()
@property(nonatomic,weak)UIView *coverView;
@property(nonatomic,weak)UIImageView *imageView;
@end

@implementation SCHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIImage *image = [UIImage imageNamed:@"CS50_activity_image"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *activityItem = [[UIBarButtonItem alloc]initWithImage: image style:UIBarButtonItemStylePlain target:self action:@selector(clickActivity)];
    self.navigationItem.leftBarButtonItem = activityItem;
}
-(void)clickActivity{
    UIView *cover = [[UIView alloc]initWithFrame:kScreenSize];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    self.coverView = cover;
    [self.tabBarController.view addSubview:cover];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"showActivity"]];
    imageView.userInteractionEnabled = YES;
    imageView.center = self.view.center;
    [self.tabBarController.view addSubview:imageView];
    UIButton *closeButton = [[UIButton alloc]init];
    UIImage *buttonImage = [UIImage imageNamed:@"alphaClose"];
    closeButton.frame = CGRectMake(imageView.frame.size.width - buttonImage.size.width, 0, 0,0);
    [closeButton setImage:buttonImage forState:UIControlStateNormal];
    [closeButton sizeToFit];
    [imageView addSubview:closeButton];
    [closeButton addTarget:self action:@selector(closeActivity) forControlEvents:UIControlEventTouchUpInside];
    self.imageView = imageView;
}
-(void)closeActivity{
    [UIView animateWithDuration:0.25 animations:^{
        [self.coverView removeFromSuperview];
        [self.imageView removeFromSuperview];
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
