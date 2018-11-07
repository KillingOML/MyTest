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
#import "MyLabel.h"




@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[MyLabel sharedInstance] begin];
//    MyLabel *m = [MyLabel sharedInstance];

    ViewA *a = [[ViewA alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 400)];
    [self.view addSubview:a];

    
    LOTAnimationView *animation = [LOTAnimationView animationNamed:@"Lottie"];
    [self.view addSubview:animation];
    [animation playWithCompletion:^(BOOL animationFinished) {
        // Do Something
        NSLog(@"正常");
        ViewA *a = [[ViewA alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 400)];
        [self.view addSubview:a];
    }];
//    ViewB *b = [[ViewB alloc] initWithFrame:CGRectMake(0, a.frame.origin.y+a.frame.size.height+20, SCREEN_WIDTH, 400)];
//    b.backgroundColor = UIColor.blueColor;
//    [self.view addSubview:b];
}

- (BOOL)responeWithActionType:(Event_Action_Type)type info:(id)sender{
    NSLog(@"i m vc, i receive sender:%@", sender);
    return YES;
}

@end
