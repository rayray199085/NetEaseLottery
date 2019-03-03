//
//  SCRotateView.m
//  LuckWheel
//
//  Created by Stephen Cao on 27/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCRotateView.h"
#define SUBBUTTON_COUNT 12
#define BUTTON_IMAGE_SCALE 2.3
@interface SCRotateView ()<UIAlertViewDelegate>
@property(weak, nonatomic) IBOutlet UIImageView *rotateImage;
@property(nonatomic, weak) UIButton *selectedButton;
@property(nonatomic, weak) CADisplayLink *link;
- (IBAction)startSelectNumber:(id)sender;
@end
@implementation SCRotateView
+ (instancetype)rotateView {
  return
      [[NSBundle mainBundle] loadNibNamed:@"SCRotateView" owner:nil
                                  options:nil][0];
}

- (void)awakeFromNib {
  [super awakeFromNib];
  for (int i = 0; i < SUBBUTTON_COUNT; i++) {
    UIButton *button = [[UIButton alloc] init];
    UIImage *buttonImageNormal =
        [self clipImageWithImage:[UIImage imageNamed:@"LuckyAstrology"]
                    andWithIndex:i];
    UIImage *buttonImageSelected =
        [self clipImageWithImage:[UIImage imageNamed:@"LuckyAstrologyPressed"]
                    andWithIndex:i];
    [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"]
                      forState:UIControlStateSelected];
    [button setImage:buttonImageNormal forState:UIControlStateNormal];
    [button setImage:buttonImageSelected forState:UIControlStateSelected];
    [button setImageEdgeInsets:UIEdgeInsetsMake(-50, 0, 0, 0)];
    [button addTarget:self
                  action:@selector(buttonSelected:)
        forControlEvents:UIControlEventTouchUpInside];
    button.tag = i;
    [self.rotateImage addSubview:button];
  }
}
- (void)layoutSubviews {
  [super layoutSubviews];
  for (int i = 0; i < self.rotateImage.subviews.count; i++) {
    UIButton *button = self.rotateImage.subviews[i];
    button.center = self.rotateImage.center;
    button.bounds = CGRectMake(0, 0, 68, 143);
    button.layer.anchorPoint = CGPointMake(0.5, 1);
    CGFloat angle = M_PI * 2 / SUBBUTTON_COUNT;
    button.layer.affineTransform = CGAffineTransformMakeRotation(angle * i);
  }
}
- (UIImage *)clipImageWithImage:(UIImage *)image andWithIndex:(NSInteger)index {
  CGFloat width =
      image.size.width / SUBBUTTON_COUNT * [UIScreen mainScreen].scale;
  CGFloat height = image.size.height * [UIScreen mainScreen].scale;
  CGFloat x = index * width;
  CGFloat y = 0;
  CGImageRef imageRef = CGImageCreateWithImageInRect(
      image.CGImage, CGRectMake(x, y, width, height));
  UIImage *partialImage =
      [[UIImage alloc] initWithCGImage:imageRef
                                 scale:BUTTON_IMAGE_SCALE
                           orientation:UIImageOrientationUp];
  CGImageRelease(imageRef);
  return partialImage;
}
- (void)buttonSelected:(UIButton *)sender {
  if (self.selectedButton != nil) {
    self.selectedButton.selected = NO;
  }
  sender.selected = YES;
  self.selectedButton = sender;
}
- (void)startRotate {
  CADisplayLink *link =
      [CADisplayLink displayLinkWithTarget:self
                                  selector:@selector(wheelRotationListener)];
  self.link = link;
  [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}
- (void)wheelRotationListener {
  CGFloat angle = M_PI * 2 / SUBBUTTON_COUNT / 60;
    self.rotateImage.transform =
    CGAffineTransformRotate(self.rotateImage.transform, angle);
}
- (IBAction)startSelectNumber:(id)sender {
    if (![self.rotateImage.layer animationForKey:@"luckyNumbers"]) {
    CABasicAnimation *basicAnim = [[CABasicAnimation alloc] init];
    basicAnim.keyPath = @"transform.rotation";
    CGFloat offsetAngle = M_PI * 2 / SUBBUTTON_COUNT * self.selectedButton.tag;
    basicAnim.toValue = @(M_PI * 10 - offsetAngle);
    basicAnim.removedOnCompletion = NO;
    basicAnim.fillMode = kCAFillModeForwards;
    basicAnim.duration = 3;
    [self.rotateImage.layer addAnimation:basicAnim forKey:@"luckyNumbers"];
    self.link.paused = YES;
    dispatch_after(
        dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)),
        dispatch_get_main_queue(), ^{
          self.rotateImage.transform =
              CGAffineTransformMakeRotation(-offsetAngle);
          NSMutableString *luckNumbers = [[NSMutableString alloc] init];
          for (int i = 0; i < 7; i++) {
            int digit = arc4random_uniform(33) + 1;
            [luckNumbers appendFormat:@"%02d ", digit];
          }
          UIAlertView *alert =
              [[UIAlertView alloc] initWithTitle:@"Lucky Numbers"
                                         message:luckNumbers
                                        delegate:self
                               cancelButtonTitle:@"Confirm"
                               otherButtonTitles:nil, nil];
          [alert show];
          [self.rotateImage.layer removeAnimationForKey:@"luckyNumbers"];
        });
  }
}
- (void)alertView:(UIAlertView *)alertView
    clickedButtonAtIndex:(NSInteger)buttonIndex {
  self.link.paused = NO;
}
@end
