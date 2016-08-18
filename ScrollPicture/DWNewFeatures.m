//
//  NewFeatures.m
//  DWScrollPicture
//
//  Created by cdk on 16/8/3.
//  Copyright © 2016年 dwang. All rights reserved.
//

#import "DWNewFeatures.h"
#import "DWScrollPictures.h"
#import "DWViewController.h"

@interface DWNewFeatures ()<DWScrollerPictureDelegate>

@property (strong, nonatomic) DWScrollPictures *features;

@end

//获取屏幕 宽度、高度
#define DWScreen_Width [UIScreen mainScreen].bounds.size.width
#define DWScreen_Height [UIScreen mainScreen].bounds.size.height


@implementation DWNewFeatures

- (DWScrollPictures *)features {
    
    if (!_features) {
        
        _features = [[DWScrollPictures alloc] init];
    }
    return _features;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

#warning ---网络图片
//    [self.features dw_SetNetworkingNewFeaturesView:self.view delegate:self imageLinkArray:@[@"http://d.hiphotos.baidu.com/image/pic/item/38dbb6fd5266d01622b0017d9f2bd40735fa353d.jpg",@"http://d.hiphotos.baidu.com/image/pic/item/bd315c6034a85edf66e6617e41540923dd547501.jpg",@"http://b.hiphotos.baidu.com/image/pic/item/ae51f3deb48f8c547d26527232292df5e1fe7ff2.jpg"] pageImageView:^(UIView *pageImageView, int imageCount, int imageAllCount) {
//
//        
//                if (imageCount == imageAllCount) {
//        
//                    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(DWScreen_Width / 2 - 50, DWScreen_Height - 150, 100, 35)];
//        
//                    [button setTitle:@"进入主页" forState:UIControlStateNormal];
//        
//                    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        
//                    button.backgroundColor = [UIColor orangeColor];
//        
//                    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//        
//                    [pageImageView addSubview:button];
//                    
//                }
//
//        
//    }];
    
    //设置新特性图片
    [self.features dw_SetNewFeaturesView:self.view delegate:self imageName:@[@"IMG_1.JPG",@"IMG_2.JPG",@"IMG_3.JPG",@"IMG_4.JPG"] pageImageView:^(UIView *pageImageView, int imageCount, int imageAllCount) {
        
        if (imageCount == imageAllCount) {
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(DWScreen_Width / 2 - 50, DWScreen_Height - 150, 100, 35)];
            
            [button setTitle:@"进入主页" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            button.backgroundColor = [UIColor orangeColor];
            
            [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
            
            [pageImageView addSubview:button];
            
        }
        
        
    }];
    
}


- (void)dw_nowPageCount:(double)pageCount imageAllCount:(NSInteger)imageAllCount{
    
    NSLog(@"%f",pageCount);
    
    NSLog(@"%ld",imageAllCount);
    
    //最后一张新特性图片
    if (pageCount > imageAllCount) {
        
        //跳转到首页控制器
        [self presentViewController:[DWViewController new] animated:YES completion:nil];
        
        //删除当前控制器
        [self removeFromParentViewController];
        
    }
    
}

- (void)click {
    
    //跳转到首页控制器
    [self presentViewController:[DWViewController new] animated:YES completion:nil];
    
}
@end
