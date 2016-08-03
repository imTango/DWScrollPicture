//
//  ViewController.m
//  DWScrollPicture
//
//  Created by cdk on 16/8/3.
//  Copyright © 2016年 dwang. All rights reserved.
//

#import "DWViewController.h"

@interface DWViewController ()

@end

@implementation DWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.font = [UIFont systemFontOfSize:32];
    
    label.text = @"This's MainView!!!";
    
    label.textColor = [UIColor orangeColor];
    
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
