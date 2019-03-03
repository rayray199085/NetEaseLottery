//
//  SCHelpAnswersViewController.m
//  NetEaseLottery
//
//  Created by Stephen Cao on 2/3/19.
//  Copyright © 2019 Stephen Cao. All rights reserved.
//

#import "SCHelpAnswersViewController.h"

@interface SCHelpAnswersViewController ()<UIWebViewDelegate>

@end

@implementation SCHelpAnswersViewController
- (void)loadView{
    self.view = [[UIWebView alloc]initWithFrame:kScreenSize];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    NSURL *url = [[NSBundle mainBundle]URLForResource:self.questionItem.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    [webView loadRequest:request];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *findPosition = [NSString stringWithFormat:@"document.location.href = '#%@'",self.questionItem.ID];
    [webView stringByEvaluatingJavaScriptFromString:findPosition];
}
@end
