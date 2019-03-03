//
//  SCArenaViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 27/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCArenaViewController.h"

@interface SCArenaViewController ()


@end

@implementation SCArenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"NLArenaBackground"].CGImage);
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    UISegmentedControl *segment = (UISegmentedControl *) self.navigationItem.titleView;
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    NSDictionary *dict = @{NSForegroundColorAttributeName :[UIColor whiteColor]};
    [segment setTintColor:[UIColor clearColor]];
    [segment setTitleTextAttributes:dict forState:UIControlStateNormal];
    [segment setTitleTextAttributes:dict forState:UIControlStateSelected];
    
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
