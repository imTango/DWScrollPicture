//
//  ViewController.h
//  DWScrollPicture
//
//  Created by cdk on 16/8/3.
//  Copyright © 2016年 dwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DWIndexDelegate <NSObject>

@optional
- (void)dw_SetLabelTitle:(NSInteger)index;

@end

@interface DWViewController : UIViewController

@property (assign, nonatomic) id<DWIndexDelegate> delegate;

@end

