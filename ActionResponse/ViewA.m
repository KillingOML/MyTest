//
//  ViewA.m
//  ActionResponse
//
//  Created by susong on 2018/10/26.
//  Copyright © 2018年 susong. All rights reserved.
//

#import "ViewA.h"
#import "ViewB.h"

@implementation ViewA

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.darkGrayColor;
        ViewB *b = [[ViewB alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 300)];
//        [self addSubview:b];
        
     

    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(10, 10)];
//    [path addLineToPoint:CGPointMake(200, 80)];
//
//    path.lineWidth = 5.0;
//    path.lineCapStyle = kCGLineCapRound; //线条拐角
//    path.lineJoinStyle = kCGLineJoinRound; //终点处理
//
//    [path stroke];
    
    
    NSMutableArray *drawPoints = @[[NSValue valueWithCGPoint:CGPointMake(10, 10)],
                                   [NSValue valueWithCGPoint:CGPointMake(200, 10)],
                                   [NSNull null], // 代表上个点位和下个点位不需要连接,只要不是 NSValue 类型的都会判断为断点
                                   [NSValue valueWithCGPoint:CGPointMake(10, 30)],
                                   [NSValue valueWithCGPoint:CGPointMake(200, 30)],
                                   [NSNull null] // 断点
                                   ].mutableCopy;
    // 示例完毕，后边就直接循环创建吧
    for (int i = 0 ; i < 20; i ++) {
        [drawPoints addObject:[NSValue valueWithCGPoint:CGPointMake(10, i * 10 + 50)]];
        [drawPoints addObject:[NSValue valueWithCGPoint:CGPointMake(200, i * 10 + 50)]];
        [drawPoints addObject:[NSNull null]]; // 断点
    }
    // 创建绘制动作路径
    UIBezierPath *bezierPath = [AxcDrawPath AxcDrawLineArray:drawPoints // 绘制的点位
                                                   clockwise:YES];       // 是否顺序绘制
    [bezierPath stroke];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch A");
}

- (BOOL)responeWithActionType:(Event_Action_Type)type info:(id)sender{
 
    NSLog(@"i m a; i receive sender:%@", sender);
    return YES;
}

@end
