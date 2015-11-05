//
//  YUFlowLayout.m
//  YUAnimation
//
//  Created by 张洪毓 on 15/11/3.
//  Copyright © 2015年 张洪毓. All rights reserved.
//

#import "YUFlowLayout.h"

@interface YUFlowLayout ()

@property (nonatomic,assign) CGSize size;

@end

@implementation YUFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.itemSize = CGSizeMake(100, 100);
        
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        self.minimumLineSpacing = 0;

        self.minimumInteritemSpacing = 0;

        self.size = self.itemSize;
        
    }
    return self;
}

//-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    UICollectionViewLayoutAttributes *attributes = [[UICollectionViewLayoutAttributes alloc] init];
//    
//    attributes.size = self.size;
//    
//    return attributes;
//}

@end
