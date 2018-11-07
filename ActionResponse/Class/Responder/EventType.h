//
//  EventType.h
//  ActionResponse
//
//  Created by susong on 2018/10/26.
//  Copyright © 2018年 susong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    Event_Action_Null = 0,
    Event_Action_A,
    Event_Action_B,
    Event_Action_C
} Event_Action_Type;

typedef enum : NSUInteger {
    Event_HAHA = 1,
    Event_XIXI
} Event_TEST;

@interface EventType : NSObject

@end

NS_ASSUME_NONNULL_END
