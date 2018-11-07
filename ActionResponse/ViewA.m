//
//  ViewA.m
//  ActionResponse
//
//  Created by susong on 2018/10/26.
//  Copyright © 2018年 susong. All rights reserved.
//

#import "ViewA.h"
#import "ViewB.h"
//#import "SS_UIConfigration.h"
//#import "EventType.h"
//#import "UIResponder+SS_Handler.h"

@implementation ViewA

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.darkGrayColor;
        ViewB *b = [[ViewB alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 300)];
        [self addSubview:b];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch A");
}

- (BOOL)responeWithActionType:(Event_Action_Type)type info:(id)sender{
 
    NSLog(@"i m a; i receive sender:%@", sender);
    return YES;
}

@end
