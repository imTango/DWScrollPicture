//
//  ViewController.m
//  DWScrollPicture
//
//  Created by cdk on 16/8/3.
//  Copyright © 2016年 dwang. All rights reserved.
//

#import "DWViewController.h"
#import "DWScrollPictures.h"
#import "DWPictureController.h"

@interface DWViewController ()<DWScrollerPictureDelegate>

//本地
@property (strong, nonatomic) DWScrollPictures *rebirth;

//网络
@property (strong, nonatomic) DWScrollPictures *networkongRebirth;

@property (weak, nonatomic) UILabel *label;


@end

@implementation DWViewController

//本地
- (DWScrollPictures *)rebirth {
    
    if (!_rebirth) {
        _rebirth = [[DWScrollPictures alloc] init];
    }
    
    return _rebirth;
}

//网络
- (DWScrollPictures *)networkongRebirth {
    
    if (!_networkongRebirth) {
        _networkongRebirth = [[DWScrollPictures alloc] init];
    }
    
    return _networkongRebirth;
}


- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.rebirth setPageSelctColor:[UIColor blueColor]];
    
    [self.rebirth setPageNormalColor:[UIColor whiteColor]];
    
    [self.networkongRebirth setPageSelctColor:[UIColor blueColor]];
    
    [self.networkongRebirth setPageNormalColor:[UIColor whiteColor]];
    
#warning ---遵循代理
    self.rebirth.delegate = self;
    
    self.networkongRebirth.delegate = self;
    
#warning ---设置轮播图走向
    [self.rebirth setDirection:DWGoAgainstShuffling];
    
#warning ---本地图片
    [self.rebirth dw_SetShufflingFigureView:self.view
                  sizeY:0
                  height:self.view.frame.size.height/2
                  pageY:self.view.frame.size.height/2 + 50
                  imageNameArray:@[
                  @"IMG_1.JPG",
                  @"IMG_2.JPG",
                  @"IMG_3.JPG",
                  @"IMG_4.JPG"]
                  timeInterval:2.0
                  animateTimer:1.0
                  pageImageView:^(UIView *pageImageView, int imageCount, int imageAllCount) {
                  
                      NSLog(@"%d,imageAllCount===%d",imageCount,imageAllCount);
                      
                  }];
    
#warning ---网络图片
    [self.networkongRebirth dw_SetNetworkingShufflingFigureView:self.view
                            sizeY:self.view.frame.size.height/2
                            height:self.view.frame.size.height/2
                            pageY:self.view.frame.size.height / 20 imageLinkArray:@[
                            @"http://file.ipadown.com/uploads/jiecao/20160125022502217.jpg",
                            @"http://file.ipadown.com/uploads/jiecao/20160124022501270.jpg",
                            @"http://file.ipadown.com/uploads/jiecao/20160123022502287.jpg",
                            @"http://file.ipadown.com/uploads/jiecao/20160122022502736.jpg",
                            @"http://file.ipadown.com/uploads/jiecao/20160121022506212.jpg"]
                            timeInterval:1.25
                            animateTimer:1.0
                            pageImageView:^(UIView *pageImageView, int imageCount, int imageAllCount) {}];
    
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
   
     [self.networkongRebirth dw_stopShuffling];
    
    
}

//开启自动轮播
- (void)start {
    
    [self.rebirth dw_startShuffling];
    
    [self.networkongRebirth dw_startShuffling];
    
    
}

//删除page
- (void)remove {
    
    [self.rebirth dw_removePageControl];
    
    [self.networkongRebirth dw_removePageControl];
    
}

#pragma mark ---点击图片Delegate
- (void) dw_ShufflingFigureSelectImageCount:(NSInteger)index {
    
    DWPictureController *picVC = [[DWPictureController alloc] init];
    
    self.delegate = picVC;
    
    if ([self.delegate respondsToSelector:@selector(dw_SetLabelTitle:)]) {
        
        [self.delegate dw_SetLabelTitle:index];
        
    }
    [self presentViewController:picVC animated:YES completion:nil];
    
}

#pragma mark ---获取当前轮播图所在视图
- (void)dw_ShufflingFigureNowPageCount:(double)pageCount pageViewArray:(NSArray *)pageViewArray pageView:(UIView *)pageView {
    
    NSLog(@"%f",pageCount);
    
    NSLog(@"%ld",pageViewArray.count);

    
    if (pageCount == 2) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:pageView.frame];
        
        self.label = label;
        
        pageView = pageViewArray[2];
        
        label.textAlignment = NSTextAlignmentCenter;
        
        label.textColor = [UIColor redColor];
        
        label.font = [UIFont systemFontOfSize:25];
        
        label.text = @"在这里";
        
        [self.view addSubview:label];
        
    }
    
    if (pageCount != 2) {
        
        for (UIView *v in self.label.subviews) {
            
            [v removeFromSuperview];
            
        }
        
}
    
}

@end
