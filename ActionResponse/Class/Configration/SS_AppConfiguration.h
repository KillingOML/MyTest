//
//  SS_AppConfiguration.h
//  ActionResponse
//
//  Created by susong on 2018/11/7.
//  Copyright © 2018 susong. All rights reserved.
//

#ifndef SS_AppConfiguration_h
#define SS_AppConfiguration_h

#define APP_VERSION         [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]

// device
#define IOS_VERSION_9       [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0
#define IOS_VERSION_10      [[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0
#define IOS_VERSION_11      [[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0
#define IOS_VERSION_12      [[[UIDevice currentDevice] systemVersion] floatValue] >= 12.0

#endif /* SS_AppConfiguration_h */
