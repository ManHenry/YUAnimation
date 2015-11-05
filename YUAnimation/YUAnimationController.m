//
//  YUAnimationController.m
//  YUAnimation
//
//  Created by 张洪毓 on 15/11/3.
//  Copyright © 2015年 张洪毓. All rights reserved.
//

#import "YUAnimationController.h"
#import "YUFloatAnimation3DController.h"
#import "YULeftMenuController.h"

@interface YUAnimationController ()

@property (nonatomic,strong) NSArray *animations;

@end

@implementation YUAnimationController

-(NSArray *)animations{
    
    if (!_animations) {
        
        _animations = [[NSArray alloc] initWithObjects:@"YUFloat3DAnimation",@"YULeftMenu",@"test3",@"test4",nil];
    }
    return _animations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.animations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"animation";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"YUFloat3DAnimation";
        
    }else{
        cell.textLabel.text = @"Animation Show";
    }
    
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.backgroundColor = [self getRandomColor];
    cell.textLabel.layer.cornerRadius = 10;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.layer.masksToBounds = YES;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

-(UIColor *)getRandomColor{
    
    CGFloat r = (CGFloat)arc4random_uniform(256)/255.0;
    CGFloat g = (CGFloat)arc4random_uniform(256)/255.0;
    CGFloat b = (CGFloat)arc4random_uniform(256)/255.0;
    
    UIColor *color = [UIColor colorWithRed:r green:g blue:b alpha:1];
    
    return color;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        //        [[NSNotificationCenter defaultCenter] postNotificationName:@"one" object:indexPath];
        YUFloatAnimation3DController *yu = [[YUFloatAnimation3DController alloc] init];
        [self.navigationController pushViewController:yu animated:NO];
    }else if (indexPath.row == 1){
        
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"YULeftMenu" bundle:nil];
        YULeftMenuController *vc = sb.instantiateInitialViewController;
        vc.title = @"YULeftMenu";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

@end
