//
//  PanoramaViewController.m
//  Text360
//
//  Created by Apple on 16/6/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "PanoramaViewController.h"
#import "PanoramaView.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH  [UIScreen mainScreen].bounds.size.width
@interface PanoramaViewController (){
    PanoramaView *panoramaView;
    
}
@property (nonatomic ,assign) BOOL isFollow;
@end

@implementation PanoramaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isFollow = NO;
    panoramaView = [[PanoramaView alloc] init];
    // 尺寸固定的图片
    [panoramaView setImageWithName:@"全景图1.jpg"];
    // 是跟随设备 重力感应与否
    [panoramaView setOrientToDevice:self.isFollow];
    [panoramaView setTouchToPan:YES];
    [panoramaView setPinchToZoom:YES];
    // 显示 线
   // [panoramaView setShowTouches:YES];
    
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(50, HEIGHT - 80,100, 40)];
    [btn setTitle:@"跟随模式" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(clickToChooseType:) forControlEvents:UIControlEventTouchUpInside];
    
     [self setView:panoramaView];
    for (NSInteger i = 0 ; i < 9 ; i++) {
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH -100, 40*i+40, 100, 30)];
        [btn setTitle:[NSString stringWithFormat:@"%ld",(i+1)] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor blackColor];
        btn.tag = (i+1);
        [btn addTarget:self action:@selector(clickToChangeImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    
   [self.view insertSubview:btn atIndex:0];

}
- (void)clickToChangeImage:(UIButton *)btn{

   
           [panoramaView setImageWithName:[NSString stringWithFormat:@"全景图%ld.jpg",btn.tag]];
  

    
    NSLog(@"-%@-",[NSString stringWithFormat:@"全景图%ld.jpg",btn.tag]);
   // [self.view reloadInputViews];

}
- (void)clickToChooseType:(UIButton *)btn{
      self.isFollow = !self.isFollow;
    [btn setTitle:[NSString stringWithFormat:@"%@",self.isFollow?@"手动模式":@"跟随模式"] forState:UIControlStateNormal];
  
    
    [panoramaView setOrientToDevice:self.isFollow];


}
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    [panoramaView draw];

}
@end
