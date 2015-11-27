//
//  ViewController.m
//  ShareSDK-JS
//
//  Created by admin on 15/11/27.
//  Copyright © 2015年 ShengQiangLiu. All rights reserved.
//

#import "ViewController.h"
#import "ShareSDKJSBridge.h"


@interface ViewController () <UIWebViewDelegate>
{
    ShareSDKJSBridge *_bridge;
}
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Sample" ofType:@"html"];
    NSURL *htmlURL = [NSURL fileURLWithPath:path];
    
    self.webView = [[UIWebView alloc] init];
    self.webView .delegate = self;
    [self.webView  loadRequest:[NSURLRequest requestWithURL:htmlURL]];
    [self.view addSubview:self.webView ];

}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.webView.frame = self.view.frame;
    
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    
    return ![[ShareSDKJSBridge sharedBridge] captureRequest:request webView:webView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
