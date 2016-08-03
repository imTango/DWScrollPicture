//
//  DWNewFeatures.m
//  DWNewFeatures
//
//  Created by cdk on 16/8/2.
//  Copyright © 2016年 dwang_sui. All rights reserved.
//

#import "DWScrollPicture.h"
#import "UIView+Extension.h"

@interface DWScrollPicture ()<UIScrollViewDelegate>

//获取屏幕大小
#define DWScreen_Frame [UIScreen mainScreen].bounds
//偏好设置
#define DWUser_Defaults [NSUserDefaults standardUserDefaults]

/** pageController */
@property (weak, nonatomic) UIPageControl *pageControl;

/** 图片数组 */
@property (strong, nonatomic) NSArray *imageNameArray;


@end

#define key_ShortVersion @"key_ShortVersion"
@implementation DWScrollPicture

#pragma mark ---Appdelegate设置引导页控制器
- (void)dw_AppdelegateNewFeaturesWindow:(UIWindow *)window newFeaturesVC:(id)newFeaturesVC mainVC:(id)mainVC {
    
    //本地保存的版本号
    NSString *localShortVersionStr = [[NSUserDefaults standardUserDefaults] objectForKey:key_ShortVersion];
    
    //取出当前app的版本号
    NSString *currentShortVersionStr = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];

    //判断当前本地保存的版本号为空,或者本地保存的版本号小于当前app的版本号,就直接进入到新特性页面
    if (!localShortVersionStr || [localShortVersionStr compare:currentShortVersionStr] == NSOrderedAscending || ![DWUser_Defaults boolForKey:@"lastPage"]) {
        
        //进入新特性控制器之前,保存一下当前app的版本号,以便下次进入的时候判断
        [[NSUserDefaults standardUserDefaults] setObject:currentShortVersionStr forKey:key_ShortVersion];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        //加载新特性页面
        window.rootViewController = newFeaturesVC;
        
    }else{
        
        //加载首页控制器
        window.rootViewController = mainVC;
        
    }
    
    [window makeKeyAndVisible];
}

#pragma mark ---设置引导页
- (void)dw_SetNewFeaturesView:(UIView *)view imageName:(NSArray *)imageNameArray currentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor pageIndicatorTintColor:(UIColor *)pageIndicatorTintColor lastPageWithView:(void (^) (UIView *lastPageView))lastPageView {
    
    self.imageNameArray = imageNameArray;
    
    //初始化一个ScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:DWScreen_Frame];
    
    //隐藏水平方向的滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //开启分页
    scrollView.pagingEnabled = YES;
    
    //监听滑动-->成为代理
    scrollView.delegate = self;
    
    for (int i = 0; i < [imageNameArray count]; i ++) {
        
        //循环添加imageView
        UIImageView *imageView = [[UIImageView alloc] init];
        
        imageView.image = [UIImage imageNamed:imageNameArray[i]];
        
        //设置大小与位置
        imageView.size = scrollView.size;
        
        imageView.x = i * scrollView.width;
        
        [scrollView addSubview:imageView];
        
        
        //最后一个页面
        if (i == [imageNameArray count] - 1) {
          
            if (lastPageView) {
                
                imageView.userInteractionEnabled = true;
                
                lastPageView(imageView);
                
            }
            
        }
    }
    
    //设置scrollView的内容大小
    [scrollView setContentSize:CGSizeMake([imageNameArray count] * scrollView.width, 0)];
    
    [view addSubview:scrollView];
    
    
    //添加pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    
    //设置显示几页
    pageControl.numberOfPages = [imageNameArray count];
    
    //设置选中的颜色与默认的颜色
    pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
    pageControl.pageIndicatorTintColor = pageIndicatorTintColor;
    
    [view addSubview:pageControl];
    
    self.pageControl = pageControl;
    
    //设置位置
    pageControl.centerX = view.centerX;
    pageControl.y = view.height - 100;

    
}

#pragma mark ---scrollerViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //计算滑动到第几页
    double page = scrollView.contentOffset.x / scrollView.width;
    
    self.pageControl.currentPage = (int)(page + 0.5);
    
    if (page >= self.imageNameArray.count - 1) {
        
        [DWUser_Defaults setBool:YES forKey:@"lastPage"];
        
    }
    
    //代理方法
    if ([self.delegate respondsToSelector:@selector(dw_NewFeaturesPageCount:imageCount:)]) {
        
        [self.delegate dw_NewFeaturesPageCount:page imageCount:self.imageNameArray.count - 1];
        
    }
    
}


@end
