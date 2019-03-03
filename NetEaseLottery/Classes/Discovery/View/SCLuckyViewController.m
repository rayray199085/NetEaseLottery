//
//  SCLuckyViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 28/2/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCLuckyViewController.h"
#import "SCWheelViewController.h"

@interface SCLuckyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightImage;
- (IBAction)enterLuckyWheel:(id)sender;

@end

@implementation SCLuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.lightImage.animationImages = @[[UIImage imageNamed:@"lucky_entry_light0"],[UIImage imageNamed:@"lucky_entry_light1"]];
    self.lightImage.animationDuration = 1;
    [self.lightImage startAnimating];
}

- (IBAction)enterLuckyWheel:(id)sender {
    SCWheelViewController *wheelController = [[SCWheelViewController alloc]init];
    wheelController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBackToPrevious)];
    wheelController.navigationItem.title = @"Lucky Wheel";
    [self.navigationController pushViewController:wheelController animated:YES];
}
-(void)goBackToPrevious{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
