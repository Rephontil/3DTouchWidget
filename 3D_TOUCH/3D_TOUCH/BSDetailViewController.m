//
//  BSDetailViewController.m
//  3DTouchDemo
//
//  Created by 周勇 on 17/12/26.
//  Copyright © 2017年 周勇. All rights reserved.
//

#import "BSDetailViewController.h"

@interface BSDetailViewController ()

@end

@implementation BSDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.navTitle;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(86, 100, 200, 150)];
    imageView.image = [UIImage imageNamed:@"HelloWorld"];
    UILabel *githubName = [[UILabel alloc] init];
    githubName.text = @"ITBigSea";
    githubName.textColor = [UIColor blueColor];
    githubName.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    githubName.frame = CGRectMake(136, 270, 100, 30);
    githubName.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:imageView];
    [self.view addSubview:githubName];
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//3Dtouch会自动调用
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    //
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"删除" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        if ([self.delegate respondsToSelector:@selector(detailViewController:DidSelectedDeleteItem:)]) {
            [self.delegate detailViewController:self DidSelectedDeleteItem:self.navTitle];
        }
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"返回" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        if ([self.delegate respondsToSelector:@selector(detailViewControllerDidSelectedBackItem:)]) {
            [self.delegate detailViewControllerDidSelectedBackItem:self];
        }
    }];
    
    UIPreviewAction *tap1 = [UIPreviewAction actionWithTitle:@"按钮 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 1 selected");
    }];
    
    UIPreviewAction *tap2 = [UIPreviewAction actionWithTitle:@"按钮 2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 2 selected");
    }];
    
    
    NSArray *actions = @[action1,action2];
    
    NSArray *taps = @[tap1,tap2];
    
    
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"一组事件" style:UIPreviewActionStyleDefault actions:actions];
    UIPreviewActionGroup *group2 = [UIPreviewActionGroup actionGroupWithTitle:@"一组按钮" style:UIPreviewActionStyleDefault actions:taps];
    
    NSArray *group = @[group1,group2];

    
    return group;
}
@end

