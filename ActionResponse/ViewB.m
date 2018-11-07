//
//  ViewB.m
//  ActionResponse
//
//  Created by susong on 2018/10/26.
//  Copyright © 2018年 susong. All rights reserved.
//

#import "ViewB.h"
#import "ViewC.h"

@implementation ViewB

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.purpleColor;
        ViewC *c = [[ViewC alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 200)];
        [self addSubview:c];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch B");
    [self postResponderWithActionType:Event_Action_B info:@{@"key":@"this is b"}];

}

- (BOOL)responeWithActionType:(Event_Action_Type)type info:(id)sender{
    NSLog(@"i m b, i receive sender:%@", sender);
    return YES;
}


@end
