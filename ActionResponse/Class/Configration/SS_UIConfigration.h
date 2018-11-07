//
//  SS_UIConfigration.h
//  ActionResponse
//
//  Created by susong on 2018/11/7.
//  Copyright © 2018 susong. All rights reserved.
//

#ifndef SS_UIConfigration_h
#define SS_UIConfigration_h

#define SCREEN_WIDTH    [[[UIApplication sharedApplication] delegate] window].frame.size.width
#define SCREEN_HEIGHT   [[[UIApplication sharedApplication] delegate] window].frame.size.height
#define SCREEN_SCALE    1/[UIScreen mainScreen].scale

#define FONT_(size)     [UIFont systemFontOfSize:size]
#define FONT_B(size)    [UIFont boldSystemFontOfSize:size]



#endif /* SS_UIConfigration_h */
