//
//  YULeftMenuController.m
//  YUAnimation
//
//  Created by 张洪毓 on 15/11/3.
//  Copyright © 2015年 张洪毓. All rights reserved.
//

#import "YULeftMenuController.h"
#import "YULeftMenuView.h"
@interface YULeftMenuController ()  <LeftMenuDelegate>

@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@property (nonatomic,strong) YULeftMenuView *leftMenu;

@end

@implementation YULeftMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)showButton:(id)sender {
    
    if (self.leftMenu == nil) {
        
        [self showLeftMenu];
    }
    
    CGRect frame = self.leftMenu.frame;
    
    //    NSLog(@"%@",NSStringFromCGRect(frame));
    
    if (self.leftMenu.isShow == NO) {
        
        frame.origin.x = 0;
        
        self.leftMenu.isShow = YES;
        
        
    }else if (self.leftMenu.isShow == YES){
        
        
        frame.origin.x = -frame.size.width;
        
        self.leftMenu.isShow = NO;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.leftMenu.frame = frame;
        
    }];
    
}


-(void)showLeftMenu{
    
    YULeftMenuView *leftMenu = [YULeftMenuView leftView];
    
    leftMenu.delegate = self;
    
    CGRect frame = leftMenu.frame;
    
    //    CGPoint leftMenuPoint = frame.origin;
    //
    //    leftMenuPoint.x = -frame.size.width;
    
    frame.origin.x = - frame.size.width;
    
    frame.size.height = self.view.bounds.size.height;
    
    leftMenu.frame = frame;
    
    //    NSLog(@"%f",leftMenuPoint.x);
    
    [self.view addSubview:leftMenu];
    
    self.leftMenu = leftMenu;
    
}

#pragma LeftMenuDelegate

-(void)leftMenu:(YULeftMenuView *)letMenu withButton:(UIButton *)button{
    
    self.showLabel.text = [NSString stringWithFormat:@"这是我的：%@",button.titleLabel.text];
}


@end
