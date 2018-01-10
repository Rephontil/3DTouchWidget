//
//  ViewController.m
//  3D_TOUCH
//
//  Created by Rephontil on 2018/1/5.
//  Copyright © 2018年 Rephontil. All rights reserved.
//

#import "ViewController.h"
#import "BSTableViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UILabel *test_3DLabel;

@end

@implementation ViewController


- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    
    //3D touch是否支持
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
    
    self.title = @"3D Tocuh Demo";
   
    [self graphicsTest];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(125, 80, 150, 50);
    [btn.titleLabel setFont:[UIFont fontWithName:@"SnellRoundhand-Bold" size:30]];

    [btn setTitle:@"Click Me" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(ClickMe:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    

//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(90, 350, 195, 60);
//    btn.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:btn];
//    [btn setTitle:@"减少一个shortcutItem" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//
//    [self test_3DLabel];
//
//
//    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    nextBtn.frame = CGRectMake(90, 250, 195, 60);
//    nextBtn.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:nextBtn];
//    [nextBtn setTitle:@"Peek and PoP" forState:UIControlStateNormal];
//    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [nextBtn addTarget:self action:@selector(peekAndPop) forControlEvents:UIControlEventTouchUpInside];
}

- (void)ClickMe:(UIButton *)click{
    [self graphicsTest];
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
//    self.test_3DLabel.text = [NSString stringWithFormat:@"压力大小为：0"];
//    NSLog(@"maximumPossibleForce = : %ff",touches.anyObject.maximumPossibleForce);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
//    NSLog(@"moved:%ff",touches.anyObject.force);
//    self.test_3DLabel.text = [NSString stringWithFormat:@"压力大小为： %ff",touches.anyObject.force];
}

- (void)btnClick{
    
    NSArray *shortcutItems = [UIApplication sharedApplication].shortcutItems;

    [UIApplication sharedApplication].shortcutItems = @[shortcutItems.firstObject];
}

- (void)peekAndPop{
    
    [self.navigationController pushViewController:[[BSTableViewController alloc]init] animated:YES];
}

- (UILabel *)test_3DLabel{
    if (!_test_3DLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 100, 205, 100)];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor yellowColor];
        label.text = @"压力大小：0";
        [self.view addSubview:label];
        _test_3DLabel = label;
    }
    return _test_3DLabel;
}


- (void)graphicsTest{
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    UIImage *testImage = [self imageWithUIView:[self viewForGraphicsTest]];
    
    [testImage drawInRect:CGRectMake(50, 364, 275, 100)];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    view.image = resultImage;
    
}


//将UIView转换成UIImage对象
- (UIImage*)imageWithUIView:(UIView*)view{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:currnetContext];
    // 从当前context中创建一个改变大小后的图片
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    return image;
}


- (UIView *)viewForGraphicsTest{
    //50
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 275, 100)];
    contentView.backgroundColor = [UIColor cyanColor];
    
    UILabel* label1 = [self label:NSTextAlignmentLeft];
    label1.frame = CGRectMake(0, 0, 200, 50);
    [contentView addSubview:label1];
    
    UILabel *label2 = [self label:NSTextAlignmentRight];
    label2.frame = CGRectMake(0, 50, 200, 50);
    [contentView addSubview:label2];
    
    return contentView;
}


- (UILabel *)label:(NSTextAlignment)aligement{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    label.textAlignment = aligement;
    label.font = [UIFont systemFontOfSize:18];
    label.backgroundColor = [UIColor yellowColor];
    label.text = @"LABEL";
    
    return label;
}


//我们应该怎么去画出这些东西呢？


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
