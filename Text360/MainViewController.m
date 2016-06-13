//
//  MainViewController.m
//  Text360
//
//  Created by Apple on 16/6/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "MainViewController.h"
#import "PanoramaViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)enterThenextContro:(UIButton *)sender {
    PanoramaViewController *panVC = [PanoramaViewController new];
    
    [self presentViewController:panVC animated:YES completion:nil];
    
    
}


@end
