//
//  ViewController.m
//  WKWebViewTrySample
//
//  Created by Zyroball on 2016/10/19.
//  Copyright © 2016年 TomFactory. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <WKNavigationDelegate>

// webView
@property (strong, nonatomic) WKWebView *webView;

@end

// property
static NSString * const InitialURL = @"https://www.google.co.jp";

@implementation ViewController

#pragma mark - Life Cycle
- (void)loadView
{
    [super loadView];
    
    // Create WKWebView inctance
    self.webView = [WKWebView new];
    
    // Set to Auto Layout
    // Fill set to Auto Layout over self display.
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:@[
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeWidth
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeWidth
                                                            multiplier:1.0
                                                              constant:0],
                                [NSLayoutConstraint constraintWithItem:self.webView
                                                             attribute:NSLayoutAttributeHeight
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.view
                                                             attribute:NSLayoutAttributeHeight
                                                            multiplier:1.0
                                                              constant:0]
                                ]];
    
    // Set delegate into viewController
    self.webView.navigationDelegate = self;

    // A flip property set
    self.webView.allowsBackForwardNavigationGestures = YES;
    
    // WKWebView instance into self view
    [self.view insertSubview:self.webView atIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // load to initial URL in first show view of Life Cycle
    NSURL *url = [NSURL URLWithString:InitialURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
