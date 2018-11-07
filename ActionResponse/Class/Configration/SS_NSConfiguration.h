//
//  SS_NSConfiguration.h
//  ActionResponse
//
//  Created by susong on 2018/11/7.
//  Copyright © 2018 susong. All rights reserved.
//

#ifndef SS_NSConfiguration_h
#define SS_NSConfiguration_h

#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"[%s  [line:%d]] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define NSLog(FORMAT, ...) nil
#endif

#define STRING_HAS_VALUE(string)    (string != nil && string != NULL && string.length > 0) ? YES : NO
#define ARRAY_HAS_VALUE(array)      (array != nil && array != NULL && [array isKindOfClass:[NSArray class]] && array.count != 0) ? YES : NO
#define DICTIONARY_HAS_VALUE(dic)   (dic != nil && dic != NULL && ![dic isKindOfClass:[NSNull class]] && [dic allKeys].count > 0) ? YES : NO



#endif /* SS_NSConfiguration_h */
