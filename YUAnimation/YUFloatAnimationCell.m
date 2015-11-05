//
//  YUFloatAnimationCell.m
//  YUAnimation
//
//  Created by 张洪毓 on 15/11/3.
//  Copyright © 2015年 张洪毓. All rights reserved.
//
#define kScreenSize [UIScreen mainScreen].bounds.size
#import "YUFloatAnimationCell.h"

@interface YUFloatAnimationCell ()

@property (nonatomic,weak) UIImageView *cardImageView;
@property (nonatomic,weak) UIImageView *cardParallaxView;

@end

@implementation YUFloatAnimationCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self= [super initWithFrame:frame];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [self.contentView addSubview:self.imageView];
    
    return self;
    
}

-(void)setImage:(UIImage *)image{
    
    _image = image;
    
    self.imageView.image = self.image;
    
}

@end
