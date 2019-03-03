//
//  SCTabBarView.h
//  NetEaseLottery
//
//  Created by Stephen Cao on 27/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCTabBarView;
NS_ASSUME_NONNULL_BEGIN
@protocol SCTabBarViewDelegate <NSObject>
-(void)setTabBarControllerIndexWithView:(SCTabBarView *)view andIndex:(NSInteger)index;
@end
@interface SCTabBarView : UIView
@property(nonatomic,assign)NSInteger subButtonCount;
-(void)addTabBarButtonsWithNormalImage:(UIImage *) normalImage andWithSelectedImage:(UIImage *) selectedImage;
@property(nonatomic,weak)id<SCTabBarViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
