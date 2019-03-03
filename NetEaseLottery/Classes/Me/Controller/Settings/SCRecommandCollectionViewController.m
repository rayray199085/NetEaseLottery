//
//  SCRecomandCollectionViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 1/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCRecommandCollectionViewController.h"
#import "SCProductItem.h"
#import "SCRecommandCollectionViewCell.h"

@interface SCRecommandCollectionViewController ()
@property(nonatomic,strong)NSArray *productGroup;
@end

@implementation SCRecommandCollectionViewController
- (NSArray *)productGroup{
    if(_productGroup == nil){
        NSString *path =[[NSBundle mainBundle]pathForResource:@"more_project.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *tempGroup = [NSMutableArray arrayWithCapacity:array.count];
        for(NSDictionary *dict in array){
            SCProductItem *item = [SCProductItem productItemWithDictionary:dict];
            [tempGroup addObject:item];
        }
        _productGroup = tempGroup;
    }
    return _productGroup;
}
static NSString * const reuseIdentifier = @"product_cell";
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset = UIEdgeInsetsMake(16, 0, 0, 0);
    return [super initWithCollectionViewLayout:layout];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"SCRecommandCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:0.93 green:0.91 blue:0.91 alpha:1];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.productGroup.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SCRecommandCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.productItem = self.productGroup[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SCProductItem *item = self.productGroup[indexPath.row];
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@",item.customUrl,item.ID]];
//    if([application canOpenURL:url]){
//        [application openURL:url];
//    }else{
//        [application openURL:[NSURL URLWithString:item.url]];
//    }
    if(![application openURL:url]){
        [application openURL:[NSURL URLWithString:item.url]];
    }
}
@end
