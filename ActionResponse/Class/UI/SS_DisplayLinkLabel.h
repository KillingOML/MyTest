//
//  SS_DisplayLinkLabel.h
//  ActionResponse
//
//  Created by susong on 2018/11/7.
//  Copyright © 2018 susong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SS_DisplayLinkLabel : UILabel

/**
 单例
 
 @return
 */
+ (instancetype)sharedInstance;

/**
 开启监测
 */
- (void)begin;

/**
 关闭监测
 */
- (void)stop;

@end

NS_ASSUME_NONNULL_END
