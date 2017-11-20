//
//  FFTabTitleView.h
//  仿淘宝详情页
//
//  Created by linjianguo on 2017/11/20.
//  Copyright © 2017年 com.justsee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFTabTitleView : UIView
- (instancetype)initWithTitleArray:(NSArray *)titleArray;
- (void)setItemSelected:(NSInteger)colunm;
//


typedef void (^FFTableTitleClickBlock)(NSInteger);

@property (nonatomic, strong)FFTableTitleClickBlock titleClickBlock;

@end
