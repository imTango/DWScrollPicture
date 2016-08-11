//
//  AppDelegate.m
//  DWScrollPicture
//
//  Created by cdk on 16/8/3.
//  Copyright © 2016年 dwang. All rights reserved.
//

#import "DWAppDelegate.h"
#import "DWScrollPictures.h"
#import "DWViewController.h"
#import "DWNewFeatures.h"

@interface DWAppDelegate ()

@end

@implementation DWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window =[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [DWScrollPictures dw_AppdelegateNewFeaturesWindow:self.window
                                                      newFeaturesVC:[[DWNewFeatures alloc] init]
                                                             mainVC:[[DWViewController alloc] init]];
    
    return YES;
}

@end
