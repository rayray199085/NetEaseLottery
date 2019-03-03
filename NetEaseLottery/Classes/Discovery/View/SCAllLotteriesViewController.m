//
//  SCAllLotteriesViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 28/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCAllLotteriesViewController.h"
#import "UIView+SCFrame.h"
#import "SCMyTitleButton.h"
@interface SCAllLotteriesViewController ()
- (IBAction)clickTitleViewButton:(id)sender;
@property (weak, nonatomic) IBOutlet SCMyTitleButton *titleViewButton;
@property(nonatomic,weak)UIView *blueView;
@end

@implementation SCAllLotteriesViewController
- (UIView *)blueView{
    if(_blueView == nil){
       UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 0)];
        _blueView = blueView;
        _blueView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:_blueView];
    }
    return _blueView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)clickTitleViewButton:(id)sender {
    [UIView animateWithDuration:0.25 animations:^{
        if(self.blueView.height == 0){
            self.blueView.height = 150;
            self.titleViewButton.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        }else{
            self.blueView.height = 0;
            self.titleViewButton.imageView.transform = CGAffineTransformIdentity;
        }
    }];
}
@end
