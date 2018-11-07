//
//  UIResponder+Action.m
//  ActionResponse
//
//  Created by susong on 2018/10/26.
//  Copyright © 2018年 susong. All rights reserved.
//

#import "UIResponder+Action.h"

@implementation UIResponder (Action)

/**
 抛出 事件类型&&数据源
 
 @param type 事件类型
 @param sender 数据源
 */
- (void)postResponderWithActionType:(Event_Action_Type)type info:(id)sender{
    UIResponder *nextResponder = self.nextResponder;
    while (nextResponder) {
        // 是否继续寻找响应者
        BOOL searchingNext = YES;
        if ([nextResponder respondsToSelector:@selector(responeWithActionType:info:)]) {
            searchingNext = [(id <ActionResponse>)nextResponder responeWithActionType:type info:sender];
        }
        // 判断是否跳出响应者链
        if (!searchingNext) {
            break;
        }
        nextResponder = nextResponder.nextResponder;
    }
}

@end
