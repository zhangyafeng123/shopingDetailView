//
//  FFTabItemBaseView.h
//  仿淘宝详情页
//
//  Created by linjianguo on 2017/11/20.
//  Copyright © 2017年 com.justsee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFTabItemBaseView : UIView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, assign)BOOL canScroll;
@property (nonatomic, strong)NSDictionary *info;

- (void)renderUIWithInfo:(NSDictionary *)info;

@end
