//
//  ViewController.m
//  DWScrollPicture
//
//  Created by cdk on 16/8/3.
//  Copyright © 2016年 dwang. All rights reserved.
//

#import "DWViewController.h"
#import "DWScrollPictures.h"

@interface DWViewController ()

@property (strong, nonatomic) DWScrollPictures *rebirth;

@property (strong, nonatomic) DWScrollPictures *networkongrebirth;

@end

@implementation DWViewController

- (DWScrollPictures *)rebirth {
    
    if (!_rebirth) {
        _rebirth = [[DWScrollPictures alloc] init];
    }
    
    return _rebirth;
}

- (DWScrollPictures *)networkongrebirth {
    
    if (!_networkongrebirth) {
        _networkongrebirth = [[DWScrollPictures alloc] init];
    }
    
    return _networkongrebirth;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.rebirth setPageSelctColor:[UIColor blueColor]];
    
    [self.rebirth setPageNormalColor:[UIColor whiteColor]];
    
    [self.networkongrebirth setPageSelctColor:[UIColor blueColor]];
    
    [self.networkongrebirth setPageNormalColor:[UIColor whiteColor]];
    
    [self.rebirth dw_SetShufflingFigureView:self.view sizeY:0 height:self.view.frame.size.height/2 pageY:self.view.frame.size.height/2 + 50 imageNameArray:@[@"IMG_1.JPG",@"IMG_2.JPG",@"IMG_3.JPG",@"IMG_4.JPG"] timeInterval:2.0 animateTimer:1.0];
    
    
    [self.networkongrebirth dw_SetNetworkingShufflingFigureView:self.view sizeY:self.view.frame.size.height/2 height:self.view.frame.size.height/2 pageY:self.view.frame.size.height / 20 imageLinkArray:@[@"http://d.hiphotos.baidu.com/image/pic/item/38dbb6fd5266d01622b0017d9f2bd40735fa353d.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/bd315c6034a85edf66e6617e41540923dd547501.jpg",@"http://b.hiphotos.baidu.com/image/pic/item/ae51f3deb48f8c547d26527232292df5e1fe7ff2.jpg"] timeInterval:1.25 animateTimer:1.0];
    
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
   
     [self.networkongrebirth dw_stopShuffling];
    
    
}

//开启自动轮播
- (void)start {
    
    [self.rebirth dw_startShuffling];
    
    [self.networkongrebirth dw_startShuffling];
    
    
}

//删除page
- (void)remove {
    
    [self.rebirth dw_removePageControl];
    
    [self.networkongrebirth dw_removePageControl];
    
}

@end
