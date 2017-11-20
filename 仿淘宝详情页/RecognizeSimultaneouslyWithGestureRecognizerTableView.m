//
//  RecognizeSimultaneouslyWithGestureRecognizerTableView.m
//  仿淘宝详情页
//
//  Created by linjianguo on 2017/11/20.
//  Copyright © 2017年 com.justsee. All rights reserved.
//

#import "RecognizeSimultaneouslyWithGestureRecognizerTableView.h"

@implementation RecognizeSimultaneouslyWithGestureRecognizerTableView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}


@end
