//
//  TodayViewController.m
//  Widget
//
//  Created by Rephontil on 17/12/26.
//  Copyright © 2017年 Rephontil. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

#define kScreenW  [UIScreen mainScreen].bounds.size.width

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.preferredContentSize = CGSizeMake(kScreenW, 150);
    
    if ([[UIDevice currentDevice] systemVersion].intValue >= 10) {
        
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
        
//        NCWidgetDisplayModeCompact //固定高度
    }
    
    self.preferredContentSize = CGSizeMake(kScreenW, 100);
    
    [self setUpUI];
}


- (void)setUpUI{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
//    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor cyanColor];
    btn.frame = CGRectMake(10, 30, 60, 60);
    btn.layer.cornerRadius = 30;
    [btn setBackgroundImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
    btn.contentMode = UIViewContentModeScaleAspectFit;
    [btn addTarget:self action:@selector(openApp) forControlEvents:UIControlEventTouchUpInside];
}

- (void)openApp{
    NSLog(@"打开APP");
    NSString *schemeString =  @"rephontil://actionName?paramName=paramValue";
    
    [self.extensionContext openURL:[NSURL URLWithString:schemeString] completionHandler:^(BOOL success) {
        
          NSLog(@"scanBtnTapped   open url result:%d",success);
    }];
    
    
}

//默认向右便宜30，做个校正
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//点击折叠和打开时，会触发下面这个方法，在这个方法中可以修改对应状态的高度
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        
        self.preferredContentSize = CGSizeMake(maxSize.width, 110);
    }
    else {
        
        self.preferredContentSize = CGSizeMake(maxSize.width, 200);
    }
}

//在下面的方法中更新视图
-(void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    //    NCUpdateResultNewData   新的内容需要重新绘制视图
    //    NCUpdateResultNoData    部件不需要更新
    //    NCUpdateResultFailed    更新过程中发生错误
    completionHandler(NCUpdateResultNoData);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
