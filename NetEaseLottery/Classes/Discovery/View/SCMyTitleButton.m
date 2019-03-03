//
//  SCMyTitleButton.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 28/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCMyTitleButton.h"
#import "UIView+SCFrame.h"
@implementation SCMyTitleButton

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width;
}

@end
