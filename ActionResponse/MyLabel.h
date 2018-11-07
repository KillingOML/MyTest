//
//  MyLabel.h
//  ActionResponse
//
//  Created by susong on 2018/11/2.
//  Copyright © 2018年 susong. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyLabel : UILabel
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
