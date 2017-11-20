//
//  FFIgnoreHeadTouchTableView.m
//  仿淘宝详情页
//
//  Created by linjianguo on 2017/11/20.
//  Copyright © 2017年 com.justsee. All rights reserved.
//

#import "FFIgnoreHeadTouchTableView.h"

@implementation FFIgnoreHeadTouchTableView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //如果是head并且点击的范围在head之内取消点击事件
    if (self.tableHeaderView && CGRectContainsPoint(self.tableHeaderView.frame, point)) {
        return NO;
        
    }
    return [super pointInside:point withEvent:event];
}


@end
