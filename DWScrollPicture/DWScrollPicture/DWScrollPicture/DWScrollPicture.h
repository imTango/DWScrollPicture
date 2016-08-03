//
//  DWNewFeatures.h
//  DWNewFeatures
//
//  Created by cdk on 16/8/2.
//  Copyright © 2016年 dwang_sui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol DWScrollerPageCountDelegate <NSObject>

@optional
- (void)dw_NewFeaturesPageCount:(double)pageCount imageCount:(NSInteger)imageCount;

@end

@interface DWScrollPicture : NSObject

/** 代理 */
@property (assign, nonatomic) id <DWScrollerPageCountDelegate>delegate;

/**
 *  设置引导页控制器与主页面控制器
 *
 *  @param window        主window
 *  @param newFeaturesVC 新特性控制器
 *  @param mainVC        主页控制器
 */
+ (void)dw_AppdelegateNewFeaturesWindow:(UIWindow *)window newFeaturesVC:(id)newFeaturesVC mainVC:(id)mainVC;

/**
 *  设置引导图
 *
 *  @param view                          当前控制器View
 *  @param imageNameArray                引导图数组
 *  @param currentPageIndicatorTintColor pageController选中时的颜色
 *  @param pageIndicatorTintColor        pageController默认颜色
 *  @param lastPageView                  最后一个引导图
 */
- (void)dw_SetNewFeaturesView:(UIView *)view imageName:(NSArray *)imageNameArray currentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor pageIndicatorTintColor:(UIColor *)pageIndicatorTintColor lastPageWithView:(void (^) (UIView *lastPageView))lastPageView;

@end
