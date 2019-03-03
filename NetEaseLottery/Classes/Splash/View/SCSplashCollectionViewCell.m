//
//  SCSplashCollectionViewCell.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCSplashCollectionViewCell.h"
@interface SCSplashCollectionViewCell()
@property(nonatomic,strong)UIImageView *imageView;
@end
@implementation SCSplashCollectionViewCell
- (UIImageView *)imageView{
    if(_imageView == nil){
        _imageView = [[UIImageView alloc]initWithFrame:kScreenSize];
        [self addSubview:_imageView];
    }
    return _imageView;
}
- (void)setImage:(UIImage *)image{
    _image = image;
    self.imageView.image = image;
}
@end
