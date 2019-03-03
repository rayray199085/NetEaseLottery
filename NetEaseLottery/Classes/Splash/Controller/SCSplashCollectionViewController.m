//
//  SCSplashCollectionViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCSplashCollectionViewController.h"
#import "SCSplashCollectionViewCell.h"
#import "UIView+SCFrame.h"
#import "SCTabBarController.h"

@interface SCSplashCollectionViewController ()
@property(nonatomic, weak) UIImageView *largeImage;
@property(nonatomic, weak) UIImageView *largeText;
@property(nonatomic, weak) UIImageView *smallText;
@property(nonatomic, assign) int previousIndex;
@end

@implementation SCSplashCollectionViewController

- (instancetype)init {
  UICollectionViewFlowLayout *layout =
      [[UICollectionViewFlowLayout alloc] init];
  layout.itemSize = kScreenSize.size;
  layout.minimumLineSpacing = 0;
  layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  return [super initWithCollectionViewLayout:layout];
}
static NSString *const reuseIdentifier = @"splash_cell";

- (void)viewDidLoad {
  [super viewDidLoad];

  [self.collectionView registerClass:[SCSplashCollectionViewCell class]
          forCellWithReuseIdentifier:reuseIdentifier];
  self.collectionView.pagingEnabled = YES;
  self.collectionView.showsHorizontalScrollIndicator = NO;
  UIImageView *largeImage =
      [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
  self.largeImage = largeImage;
  UIImageView *largeText = [[UIImageView alloc]
      initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
  self.largeText = largeText;
  largeText.y = kScreenHeight * 0.70;
  UIImageView *smallText = [[UIImageView alloc]
      initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
  smallText.y = kScreenHeight * 0.80;
  self.smallText = smallText;
  [self.collectionView addSubview:largeImage];
  [self.collectionView addSubview:largeText];
  [self.collectionView addSubview:smallText];
    UIImageView *waveImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guideLine"]];
    waveImage.x -= kScreenWidth * 0.6 + 10;
    [self.collectionView addSubview:waveImage];
    UIButton *start = [[UIButton alloc]init];
    [start setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
    [start sizeToFit];
    start.x = kScreenWidth * 3.5 - start.width * 0.5;
    [self.collectionView addSubview:start];
    start.y =kScreenHeight * 0.85;
    [start addTarget:self action:@selector(enterMainPage) forControlEvents:UIControlEventTouchUpInside];
}
-(void)enterMainPage{
    SCTabBarController *tab = [[SCTabBarController alloc]init];
//    [self presentViewController:tab animated:YES completion:nil];
    UIWindow *keyWindow = [[UIApplication sharedApplication]keyWindow];
    [keyWindow setRootViewController:tab];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
  return 4;
}

- (__kindof UICollectionViewCell *)collectionView:
                                       (UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  SCSplashCollectionViewCell *cell =
      [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                forIndexPath:indexPath];
  NSString *imageName =
      [NSString stringWithFormat:@"guide%luBackground", indexPath.row + 1];
  cell.image = [UIImage imageNamed:imageName];
  return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:
    (UICollectionView *)collectionView {
  return 1;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  CGFloat offsetX = scrollView.contentOffset.x;
  int pageIndex = offsetX / kScreenWidth;
  self.largeImage.image = [UIImage
      imageNamed:[NSString stringWithFormat:@"guide%d", pageIndex + 1]];
  self.largeText.image =
      [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d",
                                                     pageIndex + 1]];
  self.smallText.image =
      [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d",
                                                     pageIndex + 1]];
  if (self.previousIndex > pageIndex) {
    self.largeImage.x = offsetX - kScreenWidth;
    self.largeText.x = offsetX - kScreenWidth;
    self.smallText.x = offsetX - kScreenWidth;
  } else {
    self.largeImage.x = offsetX + kScreenWidth;
    self.largeText.x = offsetX + kScreenWidth;
    self.smallText.x = offsetX + kScreenWidth;
  }
  [UIView animateWithDuration:0.25
                   animations:^{
                     self.largeImage.x = offsetX;
                     self.largeText.x = offsetX;
                     self.smallText.x = offsetX;
                     self.previousIndex = pageIndex;
                   }];
}
@end
