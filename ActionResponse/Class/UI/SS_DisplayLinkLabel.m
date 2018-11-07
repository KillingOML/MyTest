//
//  SS_DisplayLinkLabel.m
//  ActionResponse
//
//  Created by susong on 2018/11/7.
//  Copyright © 2018 susong. All rights reserved.
//

#import "SS_DisplayLinkLabel.h"
#import "SS_CPUInfo.h"

@interface SS_DisplayLinkLabel (){
    CADisplayLink *_displayLink;
    NSInteger _count;
    NSTimeInterval _lastTime;
    UIFont *_font;
    UIFont *_subFont;
    SS_CPUInfo *_cpuInfo;
}

@end

@implementation SS_DisplayLinkLabel


static SS_DisplayLinkLabel *_sharedFPSLabel = nil;
+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedFPSLabel = [[super allocWithZone:NULL] init];
    });
    return _sharedFPSLabel;
}

- (void)endDisplayLink{
    if (_displayLink) {
        [_displayLink invalidate];
        _displayLink = nil;
    }
}

/**
 开启监测
 */
- (void)begin{
    [self endDisplayLink];
    if (!_cpuInfo) {
        _cpuInfo = [[SS_CPUInfo alloc] init];
    }
    
    // 计数复原
    _lastTime = 0;
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

/**
 关闭监测
 */
- (void)stop{
    [self endDisplayLink];
    if ([SS_DisplayLinkLabel sharedInstance].superview) {
        [[SS_DisplayLinkLabel sharedInstance] removeFromSuperview];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size = CGSizeMake(120, 22);
    }
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 5.f;
        self.clipsToBounds = YES;
        self.textAlignment = NSTextAlignmentCenter;
        self.userInteractionEnabled = NO;
        self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.700];
        
        _font = [UIFont fontWithName:@"Menlo" size:14];
        if (_font) {
            _subFont = [UIFont fontWithName:@"Menlo" size:4];
        } else {
            _font = [UIFont fontWithName:@"Courier" size:14];
            _subFont = [UIFont fontWithName:@"Courier" size:4];
        }
        
    }
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDeviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
    
    return self;
}

- (void)handleDeviceOrientationDidChange:(NSNotification*)noti{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (orientation == UIDeviceOrientationPortrait) {
        NSLog(@"正常");
        [UIView animateWithDuration:0.3 animations:^{
            [SS_DisplayLinkLabel sharedInstance].frame = CGRectMake(20, [UIApplication sharedApplication].delegate.window.frame.size.height-100, [SS_DisplayLinkLabel sharedInstance].frame.size.width, [SS_DisplayLinkLabel sharedInstance].frame.size.height);
        }];
    } else if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight) {
        NSLog(@"放倒");
        [UIView animateWithDuration:0.3 animations:^{
            [SS_DisplayLinkLabel sharedInstance].frame = CGRectMake(20, [UIApplication sharedApplication].delegate.window.frame.size.height-80, [SS_DisplayLinkLabel sharedInstance].frame.size.width, [SS_DisplayLinkLabel sharedInstance].frame.size.height);
        }];
    } else {
        
    }
}



// 刷新事件间隔
NSTimeInterval refreshTime = 0.5;

- (void)tick:(CADisplayLink *)link
{
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < refreshTime) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;
    
    if (![SS_DisplayLinkLabel sharedInstance].superview) {
        [[[UIApplication sharedApplication] delegate].window addSubview:[SS_DisplayLinkLabel sharedInstance]];
    }
    [[[UIApplication sharedApplication] delegate].window bringSubviewToFront:[SS_DisplayLinkLabel sharedInstance]];
    
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d FPS  cppu:%.0f",(int)round(fps), [_cpuInfo appCPUUsage]]];
    [self changeText:text setColor:color range:NSMakeRange(0, text.length - 3)];
    [self changeText:text setColor:[UIColor whiteColor] range:NSMakeRange(text.length - 3, 3)];
    [self changeText:text setAttribute:NSFontAttributeName value:_font range:NSMakeRange(0, text.length)];
    [self changeText:text setAttribute:NSFontAttributeName value:_subFont range:NSMakeRange(text.length - 4, 1)];
    self.attributedText = text;
}

- (void)changeText:(NSMutableAttributedString *)text  setColor:(UIColor *)color range:(NSRange)range
{
    //    [self changeText:text setAttribute:(id)kCTForegroundColorAttributeName value:(id)color.CGColor range:range];
    [self changeText:text setAttribute:NSForegroundColorAttributeName value:color range:range];
}

- (void)changeText:(NSMutableAttributedString *)text setAttribute:(NSString *)name value:(id)value range:(NSRange)range
{
    if (!name || [NSNull isEqual:name]) return;
    if (value && ![NSNull isEqual:value]) {
        [text addAttribute:name value:value range:range];
    }
    else {
        [text removeAttribute:name range:range];
    }
}


@end
