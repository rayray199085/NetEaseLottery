//
//  SCTabBarController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 27/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCTabBarController.h"
#import "SCTabBarView.h"
@interface SCTabBarController()<SCTabBarViewDelegate>

@end
@implementation SCTabBarController
- (void)viewDidLoad{
    [super viewDidLoad];
    NSArray *names = @[@"Hall",@"Arena",@"Discovery",@"History",@"Me"];
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:names.count];
    for(NSString *name in names){
        [controllers addObject:[self loadViewControllerFromStoryboardWithName:name]];
    }
    self.viewControllers = controllers;
    SCTabBarView *myTabBar = [[SCTabBarView alloc]initWithFrame:self.tabBar.bounds];
    myTabBar.subButtonCount = controllers.count;
    myTabBar.delegate = self;
    [self.tabBar addSubview:myTabBar];
    for(int i =0; i < controllers.count; i++){
        UIImage *normalImage = [UIImage imageNamed:[NSString stringWithFormat:@"TabBar%d",i+1]];
        UIImage *selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"TabBar%dSel",i+1]];
        [myTabBar addTabBarButtonsWithNormalImage:normalImage andWithSelectedImage:selectedImage];
    }
}
-(UIViewController *)loadViewControllerFromStoryboardWithName:(NSString *)name{
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateInitialViewController];
}
- (void)setTabBarControllerIndexWithView:(SCTabBarView *)view andIndex:(NSInteger)index{
    self.selectedIndex = index;
}
@end
