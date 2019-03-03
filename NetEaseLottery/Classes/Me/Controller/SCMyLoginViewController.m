//
//  SCMyLoginViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 28/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCMyLoginViewController.h"
#import "SCSettingsTableViewController.h"
#import "SCHelpTableViewController.h"

@interface SCMyLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
- (IBAction)settings:(id)sender;

@end

@implementation SCMyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"RedButton"];
    UIImage *imagePressed = [UIImage imageNamed:@"RedButtonPressed"];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height* 0.5];
    [self.loginButton setBackgroundImage:image forState:UIControlStateNormal];
    
    imagePressed = [imagePressed stretchableImageWithLeftCapWidth:imagePressed.size.width* 0.5 topCapHeight:imagePressed.size.height* 0.5];
    [self.loginButton setBackgroundImage:imagePressed forState:UIControlStateHighlighted];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)settings:(id)sender {
    SCSettingsTableViewController *settingsController = [[SCSettingsTableViewController alloc]init];
    settingsController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Help" style:UIBarButtonItemStylePlain target:self action:@selector(enterHelpController)];
    NSString *plistName = @"Settings";
    settingsController.navigationItem.title = plistName;
    settingsController.plistName = plistName;
    [self.navigationController pushViewController:settingsController animated:YES];
}
-(void)enterHelpController{
    SCHelpTableViewController *helpController = [[SCHelpTableViewController alloc]initWithStyle:UITableViewStylePlain];
    helpController.navigationItem.title = @"Help";
    [self.navigationController pushViewController:helpController animated:YES];
}
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    segue.destinationViewController.navigationItem.title = @"Settings";
//}
@end
