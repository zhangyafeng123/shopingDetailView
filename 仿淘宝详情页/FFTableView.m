//
//  FFTableView.m
//  仿淘宝详情页
//
//  Created by linjianguo on 2017/11/20.
//  Copyright © 2017年 com.justsee. All rights reserved.
//

#import "FFTableView.h"
#import "FF.h"
#import "FFTabTitleView.h"
#import "FFTabItemBaseView.h"
@interface FFTableView ()<UIScrollViewDelegate>

@property (nonatomic, strong)FFTabTitleView *tabTitleView;
@property (nonatomic, strong)UIScrollView *tabContentView;

@end


@implementation FFTableView

- (instancetype)initWithTabConfigArray:(NSArray *)tabConfigArray
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - kBottomBarHeight - kTopBarHeight);
        NSMutableArray *titleArray = [NSMutableArray new];
        for (int i = 0; i <tabConfigArray.count; i++) {
            NSDictionary *itemDic = tabConfigArray[i];
            [titleArray addObject:itemDic[@"title"]];
        }
        _tabTitleView = [[FFTabTitleView alloc] initWithTitleArray:titleArray];
        __weak typeof(self) weakSelf = self;
        _tabTitleView.titleClickBlock = ^(NSInteger row) {
            if (weakSelf.tabContentView) {
                weakSelf.tabContentView.contentOffset = CGPointMake(SCREEN_WIDTH * row, 0);
            }
        };
        [self addSubview:_tabTitleView];
        _tabContentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_tabTitleView.frame), SCREEN_WIDTH, CGRectGetHeight(self.frame) - CGRectGetHeight(_tabTitleView.frame))];
        _tabContentView.contentSize = CGSizeMake(CGRectGetWidth(_tabContentView.frame)*titleArray.count, CGRectGetWidth(_tabContentView.frame));
        _tabContentView.pagingEnabled = YES;
        _tabContentView.bounces = NO;
        _tabContentView.showsHorizontalScrollIndicator = NO;
        _tabContentView.delegate = self;
        [self addSubview:_tabContentView];
        
        for (int i = 0; i < tabConfigArray.count; i++) {
            NSDictionary *info = tabConfigArray[i];
            NSString *clazzName = info[@"view"];
            Class clazz = NSClassFromString(clazzName);
            FFTabItemBaseView *itemBaseView = [[clazz alloc] init];
            [itemBaseView renderUIWithInfo:tabConfigArray[i]];
            [_tabContentView addSubview:itemBaseView];
        }
    }
    return self;
}
//设置scrollview横向整页滚动并且和上面自定义的title向对应
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger pageNum = offsetX/SCREEN_WIDTH;
    //NSLog(@"pageNum == %zi",pageNum);
    [_tabTitleView setItemSelected:pageNum];
}

@end
