//
//  ViewController.m
//  ActionResponse
//
//  Created by susong on 2018/10/26.
//  Copyright © 2018年 susong. All rights reserved.
//

#import "ViewController.h"
#import "ViewA.h"
#import "ViewB.h"
#import "ViewC.h"
//#import "EventType.h"
//#import "SS_UIConfigration.h"
//#import "SS_AppConfiguration.h"
//#import "SS_NSConfiguration.h"
//#import "UIResponder+SS_Handler.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //    MyLabel *m = [MyLabel sharedInstance];

    NSDictionary *dic;
    NSString *stri = @"";
    
    if (IOS_VERSION_9) {
        NSLog(@"》9");
    }
    if (IOS_VERSION_10) {
        NSLog(@">10");
    }
    if (IOS_VERSION_11) {
        NSLog(@">11");
    }
    if (IOS_VERSION_12) {
        NSLog(@">12");
    }
    
    NSLog(@"%.1f", 1/[UIScreen mainScreen].scale);
    
    
    
    UILabel *lab;
    lab.font = FONT_(12);
    lab.font = FONT_B(12);
    
    
    NSLog(@"%@ -- %@",self, stri);
    
    if (DICTIONARY_HAS_VALUE(dic)) {
        NSLog(@"是有效的字典");
    }else{
        NSLog(@"非有效字典");
    }
    
    if (STRING_HAS_VALUE(stri)) {
        NSLog(@"有效字符");
    }else{
        NSLog(@"无效字符");
    }
    

    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"123123", nil];
    if (ARRAY_HAS_VALUE(arr)) {
        NSLog(@"1111");
    }else{
        NSLog(@"2222");
    }

    
    ViewA *a = [[ViewA alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 400)];
    [self.view addSubview:a];

    
    
}

- (BOOL)responeWithActionType:(Event_Action_Type)type info:(id)sender{
    NSLog(@"i m vc, i receive sender:%@", sender);
    return YES;
}

@end
