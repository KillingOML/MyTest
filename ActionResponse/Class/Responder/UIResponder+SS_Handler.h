//
//  UIResponder+SS_Handler.h
//  ActionResponse
//
//  Created by susong on 2018/11/7.
//  Copyright © 2018 susong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HandlerResponse <NSObject>

/**
 响应事件回调
 
 @param type 事件类型
 @param sender 数据源
 @return 响应者链是否继续传递 YES：继续传递 ； NO：break掉
 */
- (BOOL)responeWithActionType:(Event_Action_Type)type info:(id)sender;

@end

@interface UIResponder (SS_Handler)

/**
 抛出 事件类型&&数据源
 
 @param type 事件类型
 @param sender 数据源
 */
- (void)postResponderWithActionType:(Event_Action_Type)type info:(id)sender;

@end

NS_ASSUME_NONNULL_END
