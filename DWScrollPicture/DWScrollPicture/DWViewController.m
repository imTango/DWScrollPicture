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

@property (strong, nonatomic) DWScrollPicture *scroller;

@end

@implementation DWViewController

- (DWScrollPicture *)scroller {
    
    if (!_scroller) {
        _scroller = [[DWScrollPicture alloc] init];
    }
    
    return _scroller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.scroller setPageSelctColor:[UIColor blueColor]];
    
    [self.scroller dw_SetShufflingFigureView:self.view sizeY:0 height:self.view.frame.size.height/2 pageY:50 imageArray:@[@"IMG_1.JPG",@"IMG_2.JPG",@"IMG_3.JPG",@"IMG_4.JPG"] timeInterval:2.0 animateTimer:1.0];
    
    [self.scroller dw_removePageControl];
    
    [self.scroller dw_startShufflingTimer];

}

@end
