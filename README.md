# DWScrollPicture
---
####*此框架封装了新特性功能的实现，通过最少的代码实现理想的功能*
---
#准备工作
###首先将DWScrollPicture文件夹导入到项目中
---
#第一步
####引入头文件
    在AppDelegate.m中引入头文件
    #import "DWScrollPicture.h"
	#import "新特性控制器.h"
	#import "首页控制器.h"
---
#第二步
####在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{}方法中写入以下代码
	 self.window =[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [DWScrollPicture dw_AppdelegateNewFeaturesWindow:self.window newFeaturesVC:[[新特性控制器 alloc] init] mainVC:[[首页控制器 alloc] init]];
	
	return YES;
---
#第三步
####新特性控制器中的实现
#####引入头文件，声明代理方法
	#import "DWScrollPicture.h"
	<DWScrollerPageCountDelegate>
---
####在@interface中添加以下代码
	@property (strong, nonatomic) DWScrollPicture *features;
---
####懒加载
	- (DWScrollPicture *)features {
    
   			 if (!_features) {
        
     	   _features = [[DWScrollPicture alloc] init];
     	   
   		 }	
   		 
    	return _features;
    
	}
---
####在viewDidLoad中实现以下方法
	//设置新特性图片
    [self.features dw_SetNewFeaturesView:self.view 	delegate:self	imageName:@[@"图片名称.JPG"] currentPageIndicatorTintColor:[pageController选中时的颜色] pageIndicatorTintColor:[pageController默认颜色] lastPageWithView:^(UIView *lastPageView) {
        
            //最后一个视图
            
    }];
---
####实现代理方法
	- (void)dw_NewFeaturesPageCount:(double)pageCount imageCount:(NSInteger)imageCount{
	/**
 	 *  @param pageCount  当前所在界面索引
 	 *  @param imageCount 新特性图片总数
 	 */
	}
