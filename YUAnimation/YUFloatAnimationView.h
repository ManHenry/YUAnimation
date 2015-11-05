//
//  YUFloatAnimationView.h
//  YUAnimation
//
//  Created by 张洪毓 on 15/11/3.
//  Copyright © 2015年 张洪毓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YUFloatAnimationView : UICollectionView

@property (nonatomic,strong) NSMutableArray *images;
@property (nonatomic,copy) void(^myBlock)(NSInteger row);

@end
