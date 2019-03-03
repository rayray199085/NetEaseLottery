//
//  SCRecommandCollectionViewCell.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCRecommandCollectionViewCell.h"
@interface SCRecommandCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end
@implementation SCRecommandCollectionViewCell
- (void)setProductItem:(SCProductItem *)productItem{
    _productItem = productItem;
    self.imageView.image = [UIImage imageNamed:productItem.icon];
//    self.imageView.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:productItem.icon].CGImage);
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = YES;
    self.title.text = productItem.title;
}
@end
