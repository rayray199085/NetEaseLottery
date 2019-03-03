//
//  SCRecommandCollectionViewCell.h
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCProductItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface SCRecommandCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)SCProductItem *productItem;
@end

NS_ASSUME_NONNULL_END
