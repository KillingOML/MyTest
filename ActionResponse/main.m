//
//  main.m
//  ActionResponse
//
//  Created by susong on 2018/10/26.
//  Copyright © 2018年 susong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSNumber *someProperty = @(100.1);
        NSLog(@"%@", someProperty);

        NSMutableArray *testArray = [NSMutableArray array];
        
        testArray[0] = @"0";
        testArray[1] = @"1";
        testArray[2] = @"2";
        testArray[3] = @"3";
//        testArray[5] = @"5";
        NSNumber *number1 = @1;
        NSNumber *number2 = @2;
        NSNumber *number3 = @3;
        NSNumber *numberFFFF = @(0xFFFF);
        
        NSLog(@"number1 pointer is %p", number1);
        NSLog(@"number2 pointer is %p", number2);
        NSLog(@"number3 pointer is %p", number3);
        NSLog(@"numberffff pointer is %p", numberFFFF);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
