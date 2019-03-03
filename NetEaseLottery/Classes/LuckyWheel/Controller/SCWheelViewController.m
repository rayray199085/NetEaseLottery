//
//  SCWheelViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 2/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCWheelViewController.h"
#import "SCRotateView.h"
#define kNavigationBarHeight 64
@interface SCWheelViewController ()

@end

@implementation SCWheelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *backgroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
    backgroundImage.image = [UIImage imageNamed:@"LuckyBackground"];
    [self.view addSubview:backgroundImage];
    SCRotateView *rotateView = [SCRotateView rotateView];
    [self.view addSubview:rotateView];
    rotateView.center = self.view.center;
    [rotateView startRotate];
}

@end
