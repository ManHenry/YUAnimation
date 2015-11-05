//
//  YULeftMenuView.m
//  YUAnimation
//
//  Created by 张洪毓 on 15/11/3.
//  Copyright © 2015年 张洪毓. All rights reserved.
//

#import "YULeftMenuView.h"


@interface YULeftMenuView ()

@property (weak, nonatomic) IBOutlet UIButton *myMenus;
@property (weak, nonatomic) IBOutlet UIImageView *LeftMenuicon;

@end

@implementation YULeftMenuView


+(instancetype)leftView{
    
    return [[NSBundle mainBundle] loadNibNamed:@"YULeftMenu" owner:nil options:nil].lastObject;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.LeftMenuicon.image = [UIImage imageNamed:@"YULeftMenu.bundle/maomi.png"];
    
    CGSize sizeOfSelf = self.bounds.size;
    
    sizeOfSelf = CGSizeMake(100, self.superview.bounds.size.height);
}

- (IBAction)myMenuClicked:(UIButton *)sender {
    
    //    NSArray *arr = self.myMenus.subviews;
    //
    //    NSUInteger integer = [arr indexOfObject:sender];
    
    if ([self.delegate respondsToSelector:@selector(leftMenu:withButton:)]) {
        
        [self.delegate leftMenu:self withButton:sender];
    }
}


@end
