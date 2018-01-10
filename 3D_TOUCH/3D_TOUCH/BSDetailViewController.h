//
//  BSDetailViewController.h
//  3DTouchDemo
//
//  Created by 周勇 on 17/12/26.
//  Copyright © 2017年 周勇. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BSDetailViewController;

@protocol BSDetailViewControllerDelegate <NSObject>

@required
// 删除按钮点击
- (void)detailViewController:(BSDetailViewController *)detailVC DidSelectedDeleteItem:(NSString *)navTitle;
// 返回按钮点击
- (void)detailViewControllerDidSelectedBackItem:(BSDetailViewController *)detailVC;

@end

@interface BSDetailViewController : UIViewController

@property (nonatomic,copy)NSString *navTitle;

@property (nonatomic,weak)id<BSDetailViewControllerDelegate> delegate;

@end

