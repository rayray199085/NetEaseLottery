//
//  SCNavigationController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 27/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCNavigationController.h"

@interface SCNavigationController ()

@end

@implementation SCNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    NSDictionary *dict = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [self.navigationBar setTitleTextAttributes:dict];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
   
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
