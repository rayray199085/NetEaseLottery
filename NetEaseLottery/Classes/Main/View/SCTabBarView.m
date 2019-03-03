//
//  SCTabBarView.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 27/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCTabBarView.h"
@interface SCTabBarButton : UIButton
@end
@implementation SCTabBarButton
- (void)setHighlighted:(BOOL)highlighted{
}
@end
@interface SCTabBarView()
@property(nonatomic,assign)BOOL isFirstTimeLoad;
@property(nonatomic,weak)UIButton *previousSelectedButton;
@end
@implementation SCTabBarView
-(void)addTabBarButtonsWithNormalImage:(UIImage*) normalImage andWithSelectedImage:(UIImage *) selectedImage{
     SCTabBarButton *tabBarButton = [[SCTabBarButton alloc]init];
    [tabBarButton setImage:normalImage forState:UIControlStateNormal];
    [tabBarButton setImage:selectedImage forState:UIControlStateSelected];
    [self addSubview:tabBarButton];
    self.isFirstTimeLoad = YES;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat buttonWidth = kScreenWidth / self.subButtonCount;
    CGFloat buttonHeight = self.frame.size.height;
    for(int i =0; i < self.subviews.count; i++){
        SCTabBarButton *tabBarButton = self.subviews[i];
        tabBarButton.frame = CGRectMake(i * buttonWidth, 0, buttonWidth, buttonHeight);
        tabBarButton.tag = i;
        [tabBarButton addTarget:self action:@selector(selectedTabBarButton:) forControlEvents:UIControlEventTouchDown];
        if(i == 0 && self.isFirstTimeLoad){
            [self selectedTabBarButton:tabBarButton];
            self.isFirstTimeLoad = NO;
        }
    }
}
-(void)selectedTabBarButton:(UIButton *)button{
    self.previousSelectedButton.selected = NO;
    button.selected = YES;
    self.previousSelectedButton = button;
    if([self.delegate respondsToSelector:@selector(setTabBarControllerIndexWithView:andIndex:)]){
        [self.delegate setTabBarControllerIndexWithView:self andIndex:button.tag];
    }
}
@end
