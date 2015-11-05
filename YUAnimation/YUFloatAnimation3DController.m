//
//  YUFloatAnimation3DController.m
//  YUAnimation
//
//  Created by 张洪毓 on 15/11/3.
//  Copyright © 2015年 张洪毓. All rights reserved.
//


//
//  ViewController.m
//  GirlAnimation
//
//  Created by 张洪毓 on 15/10/12.
//  Copyright © 2015年 张洪毓. All rights reserved.
//

#define kScreenSize [UIScreen mainScreen].bounds.size
#define kCellIdentifier @"YUPicCollectionViewCell"
#import "YUFloatAnimation3DController.h"
#import "YUFloatAnimationView.h"
#import "YUFloatAnimationCell.h"
#import "YUFlowLayout.h"


@interface YUFloatAnimation3DController ()

@property (nonatomic,weak) UIImageView *cardImageView;
@property (nonatomic,weak) UIImageView *cardParallaxView;
@property (nonatomic,strong) NSMutableArray *images;

@end

@implementation YUFloatAnimation3DController

-(NSMutableArray *)images{
    
    if (!_images) {
        
        _images = [NSMutableArray array];
        for (int i = 0; i < 7; i++) {
            NSString *path = [NSString stringWithFormat:@"3DFloatAnimation.bundle/MyPhotos/IMG_%02d.JPG",i+1];
            [_images addObject:path];
        }
    }
    return _images;
}

-(UIImage *)getRandomIMG{
    
    int randomNumber = arc4random_uniform(17)+1;
    NSString *IMGName = [NSString stringWithFormat:@"3DFloatAnimation.bundle/backgroundIMG/%02d.jpg",randomNumber];
    UIImage *image = [UIImage imageNamed:IMGName];
    return image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layoutMargins = UIEdgeInsetsMake(44, 0, 0, 0);
    
    UIImage *IMG = [self getRandomIMG];
    self.view.layer.contents = (__bridge id _Nullable)(IMG.CGImage);

    YUFlowLayout *flowLayout = [[YUFlowLayout alloc] init];
    
    YUFloatAnimationView *collectionView = [[YUFloatAnimationView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.bounds.size.height, kScreenSize.width, 100) collectionViewLayout:flowLayout];
    collectionView.images = self.images;
    collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:collectionView];
    
    [self setLayerWithIMG:self.images[0]];
    collectionView.myBlock = ^(NSInteger row){
        UIImage *IMG = [self getRandomIMG];
        self.view.layer.contents = (__bridge id _Nullable)(IMG.CGImage);
        [self.cardImageView removeFromSuperview];
        [self setLayerWithIMG:self.images[row]];
    };
 
//    NSLog(@"collectionView%@",NSStringFromCGRect(collectionView.frame));
    
}


-(void)setLayerWithIMG:(NSString *)imageName{
    
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    self.view.layer.shadowOffset = CGSizeMake(0, 50);
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowOpacity = 0.3f;
    
    CGFloat h = kScreenSize.height - 44 - 100;
    
    CGFloat height = h - 2* 30;
    
    UIImageView *cardImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 280, height)];
    cardImageView.center = CGPointMake(self.view.center.x, 410);
    UIImage *image = [UIImage imageNamed:imageName];
    cardImageView.image = image;
    cardImageView.layer.cornerRadius = 50.0f;
    cardImageView.clipsToBounds = YES;
    self.cardImageView = cardImageView;
    [self.view addSubview:cardImageView];
    
    [UIView animateWithDuration:0.5 animations:^{
        cardImageView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        cardImageView.transform = CGAffineTransformMakeScale(1, 1);
    }];
    
    //    [self.view bringSubviewToFront:cardImageView];
    
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panInCard:)];
    [self.view addGestureRecognizer:panGes];
    
}


-(void)panInCard:(UIPanGestureRecognizer *)panGes{
    
    CGPoint touchPoint = [panGes locationInView:self.view];
    
    if (panGes.state == UIGestureRecognizerStateChanged) {
        
        CGFloat xFactor = MIN(1, MAX(-1,(touchPoint.x - (self.view.bounds.size.width/2)) / (self.view.bounds.size.width/2)));
        CGFloat yFactor = MIN(1, MAX(-1,(touchPoint.y - (self.view.bounds.size.height/2)) / (self.view.bounds.size.height/2)));
        
        self.cardImageView.layer.transform = [self transformWithM34:1.0/-500 xf:xFactor yf:yFactor];
        self.cardParallaxView.layer.transform = [self transformWithM34:1.0/-250 xf:xFactor yf:yFactor];
        
        
    }else if (panGes.state == UIGestureRecognizerStateEnded){
        
        [UIView animateWithDuration:0.3 animations:^{
            self.cardImageView.layer.transform = CATransform3DIdentity;
            self.cardParallaxView.layer.transform = CATransform3DIdentity;
        } completion:NULL];
        
    }
    
}

-(CATransform3D )transformWithM34:(CGFloat)m34 xf:(CGFloat)xf yf:(CGFloat)yf{
    
    CATransform3D t = CATransform3DIdentity;
    t.m34  = m34;
    t = CATransform3DRotate(t, M_PI/8 * xf, 0, 1, 0);
    t = CATransform3DRotate(t, M_PI/8 * yf, -1, 0, 0);
    
    return t;
    
}



@end
