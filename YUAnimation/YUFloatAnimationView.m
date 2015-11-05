//
//  YUFloatAnimationView.m
//  YUAnimation
//
//  Created by 张洪毓 on 15/11/3.
//  Copyright © 2015年 张洪毓. All rights reserved.
//

#define kScreenSize [UIScreen mainScreen].bounds.size
#define kCellIdentifier @"YUPicCollectionViewCell"
#import "YUFloatAnimationView.h"
#import "YUFloatAnimationCell.h"


@interface YUFloatAnimationView () <UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,weak) UIImageView *cardImageView;
@property (nonatomic,weak) UIImageView *cardParallaxView;
@property(nonatomic ,assign) NSInteger index;
@property(nonatomic ,strong) NSTimer *timer;

@end

@implementation YUFloatAnimationView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    [self registerClass:[YUFloatAnimationCell class] forCellWithReuseIdentifier:kCellIdentifier];
    self.dataSource = self;
    self.delegate = self;
    //    self.pagingEnabled = YES;
    self.bounces = YES;
//    self.backgroundColor = [UIColor colorWithRed:0.51 green:0.51 blue:0.51 alpha:0.94];
    [self addTimer];
    
    return self;
}

- (void)addTimer
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(scollImage) userInfo:nil repeats:YES];
    
    self.timer = timer;
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)deleteTimer
{
    [self.timer invalidate];
    
    self.timer = nil;
}

-(void)scollImage
{
    self.index ++;
    
    if (self.index == self.images.count) {
        self.index = 0;
    }
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:self.index inSection:0];
    
    [self scrollToItemAtIndexPath:indexpath atScrollPosition:0 animated:YES];
    
    [self collectionView:self didSelectItemAtIndexPath:indexpath];
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self deleteTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger offset = (scrollView.contentOffset.x / scrollView.bounds.size.width);
    
    self.index = offset;
    
    [self addTimer];
}

#pragma UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YUFloatAnimationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    cell.image = [UIImage imageNamed:self.images[indexPath.row]];
    
    return cell;
}

#pragma UICollectionViewDelegate

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.myBlock) {
        self.myBlock(indexPath.row);
    }
    
}



@end
