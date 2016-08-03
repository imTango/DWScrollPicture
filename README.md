# DWScrollPicture
---
####*此框架封装了新特性功能的实现，通过最少的代码实现理想的功能*
---
#准备工作
###首先将DWScrollPicture文件夹导入到项目中
---
#第一步
    在AppDelegate.m中引入头文件
    #import "DWScrollPicture.h"
	#import "新特性控制器.h"
	#import "首页控制器.h"
---
#第二步
####在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{}方法中写入以下代码
	 self.window =[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [[[DWScrollPicture alloc] init] 
   	dw_AppdelegateNewFeaturesWindow:self.window 
    newFeaturesVC:[[DWNewFeatures alloc] init] mainVC:
    [[DWViewController alloc] init]];