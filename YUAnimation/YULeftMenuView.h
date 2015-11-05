//
//  YULeftMenuView.h
//  YUAnimation
//
//  Created by 张洪毓 on 15/11/3.
//  Copyright © 2015年 张洪毓. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YULeftMenuView;
@protocol LeftMenuDelegate <NSObject>

@optional

-(void)leftMenu:(YULeftMenuView *)letMenu withButton:(UIButton *)button;


@end

@interface YULeftMenuView : UIView
@property (nonatomic,copy) void(^myBlock)(NSIndexPath *);

@property (nonatomic,strong) id<LeftMenuDelegate> delegate;

@property (nonatomic,assign) BOOL isShow;

+(instancetype)leftView;

@end
