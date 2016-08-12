//
//  DWPictureController.m
//  DWScrollPicture
//
//  Created by cdk on 16/8/12.
//  Copyright © 2016年 dwang. All rights reserved.
//

#import "DWPictureController.h"
#import "DWViewController.h"
#import "DWSwipeGestures.h"

@interface DWPictureController ()<DWIndexDelegate>

@property (strong, nonatomic) DWViewController *vc;

@property (strong, nonatomic) DWSwipeGestures *backSwipe;

@end

@implementation DWPictureController

#pragma mark ---
- (DWViewController *) vc {
    
    if (!_vc) {
        _vc = [[DWViewController alloc] init];
    }
    return _vc;
}

- (DWSwipeGestures *)backSwipe {
    
    if (!_backSwipe) {
        
        _backSwipe = [[DWSwipeGestures alloc] init];
        
    }
    
    return _backSwipe;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.vc.delegate = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.backSwipe dw_SwipeGestureType:DWRightSwipeGestures Target:self Action:@selector(backVC) AddView:self.view BackSwipeGestureTypeString:^(NSString * _Nonnull backSwipeGestureTypeString) {}];
    
}

- (void)dw_SetLabelTitle:(NSInteger)index {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [label setFont:[UIFont systemFontOfSize:30]];
    
    [label setTextAlignment:NSTextAlignmentCenter];
    
    [label setNumberOfLines:0];
    
    [label setText:[NSString stringWithFormat:@"此为点击第%ld张图片的跳转\n右滑返回上一页",index]];
    
    [self.view addSubview:label];

}

- (void)backVC {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
