//
//  ViewController.m
//  corner
//
//  Created by 黄少华 on 15/8/18.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.blueView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(20, 0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = self.blueView.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    self.blueView.layer.mask = maskLayer;
    
    self.blueView.layer.cornerRadius = 5.f;
    self.blueView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
