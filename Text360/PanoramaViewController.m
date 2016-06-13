//
//  PanoramaViewController.m
//  Text360
//
//  Created by Apple on 16/6/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "PanoramaViewController.h"
#import "PanoramaView.h"
@interface PanoramaViewController (){
    PanoramaView *panoramaView;
}

@end

@implementation PanoramaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    panoramaView = [[PanoramaView alloc] init];
    // 尺寸固定的图片
    [panoramaView setImageWithName:@"全景图.jpg"];
    // 是跟随设备 重力感应与否
    [panoramaView setOrientToDevice:NO];
    [panoramaView setTouchToPan:YES];
    [panoramaView setPinchToZoom:YES];
    // 显示 线
    [panoramaView setShowTouches:YES];
    
  
    
    [self setView:panoramaView];

}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [panoramaView draw];

}
@end
