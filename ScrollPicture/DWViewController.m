//
//  ViewController.m
//  DWScrollPicture
//
//  Created by cdk on 16/8/3.
//  Copyright © 2016年 dwang. All rights reserved.
//

#import "DWViewController.h"
#import "DWScrollPicture.h"

@interface DWViewController ()

@property (strong, nonatomic) DWScrollPicture *rebirth;

@end

@implementation DWViewController

- (DWScrollPicture *)rebirth {
    
    if (!_rebirth) {
        _rebirth = [[DWScrollPicture alloc] init];
    }
    
    return _rebirth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.rebirth setPageSelctColor:[UIColor blueColor]];
    
    [self.rebirth setPageNormalColor:[UIColor whiteColor]];
    
    [self.rebirth dw_SetShufflingFigureView:self.view sizeY:0 height:self.view.frame.size.height/2 pageY:50 imageArray:@[@"IMG_1.JPG",@"IMG_2.JPG",@"IMG_3.JPG",@"IMG_4.JPG"] timeInterval:2.0 animateTimer:1.0];
    
    
    UIButton *stop = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 + 20, 100, 30)];
    
    stop.backgroundColor = [UIColor orangeColor];
    
    [stop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    
    [stop setTitle:@"停止" forState:UIControlStateNormal];
    
    [stop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:stop];
    
    
    
    UIButton *start = [[UIButton alloc] initWithFrame:CGRectMake(200, self.view.frame.size.height/2 + 20, 100, 30)];
    
    start.backgroundColor = [UIColor orangeColor];
    
    [start addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
    [start setTitle:@"开始" forState:UIControlStateNormal];
    
    [start setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:start];

    
    
    UIButton *remove = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 + 70, 100, 30)];
    
    remove.backgroundColor = [UIColor orangeColor];
    
    [remove addTarget:self action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    
    [remove setTitle:@"删除" forState:UIControlStateNormal];
    
    [remove setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view addSubview:remove];

}

//停止自动轮播
- (void)stop {
    
    [self.rebirth dw_stopShuffling];
    
}

//开启自动轮播
- (void)start {
    
    [self.rebirth dw_startShuffling];
    
}

//删除page
- (void)remove {
    
    [self.rebirth dw_removePageControl];
    
}

@end
