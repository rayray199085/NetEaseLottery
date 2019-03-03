//
//  UIView+SCFrame.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 28/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "UIView+SCFrame.h"

@implementation UIView (SCFrame)
- (void)setX:(CGFloat)x{
    CGRect viewFrame = self.frame;
    viewFrame.origin.x = x;
    self.frame = viewFrame;
}
- (CGFloat)x{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y{
    CGRect viewFrame = self.frame;
    viewFrame.origin.y = y;
    self.frame = viewFrame;
}
- (CGFloat)y{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width{
    CGRect viewFrame = self.frame;
    viewFrame.size.width = width;
    self.frame = viewFrame;
}
- (CGFloat)width{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height{
    CGRect viewFrame = self.frame;
    viewFrame.size.height = height;
    self.frame = viewFrame;
}
- (CGFloat)height{
    return self.frame.size.height;
}
@end
