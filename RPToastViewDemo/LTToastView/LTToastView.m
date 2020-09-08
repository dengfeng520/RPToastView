//  LTToastView.m
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

#import "LTToastView.h"

#define UIColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface LTToastView ()

@property (strong, nonatomic) UILabel *contextLab;
/// 判断视图是否已经加载
@property (nonatomic, assign, getter=hasFinished) BOOL finished;

@end

@implementation LTToastView

+ (instancetype)showWithMode:(toastMode)mode body:(NSString *)context {
   return [LTToastView showWithMode:mode body:context isView:[LTToastView convertWindow] isTime:2];
}
+ (instancetype)showWithMode:(toastMode)mode body:(NSString *)context isView:(UIView *)view {
    return [LTToastView showWithMode:mode body:context isView:view isTime:2];
}
+ (instancetype)showWithMode:(toastMode)mode body:(NSString *)context isTime:(CGFloat)time {
    return [LTToastView showWithMode:mode body:context isView:[LTToastView convertWindow] isTime:time];
}
+ (instancetype)showWithMode:(toastMode)mode body:(NSString *)context isView:(UIView *)view isTime:(CGFloat)time {
    __block LTToastView *toastView = [[LTToastView alloc] initWithMode:mode];
    if (view == nil) {
        view = [LTToastView convertWindow];
    }
    [view addSubview:toastView];
    toastView.translatesAutoresizingMaskIntoConstraints = false;
    [[toastView.heightAnchor constraintGreaterThanOrEqualToConstant:26] setActive:true];
    NSLayoutConstraint *top;
    if (@available(iOS 11.0, *)) {
       top = [toastView.topAnchor constraintEqualToAnchor:view.safeAreaLayoutGuide.topAnchor constant:-36];
    } else {
        // Fallback on earlier versions
        top = [toastView.topAnchor constraintEqualToAnchor:view.topAnchor constant:-26];
    }
    [top setActive:true];
    [[toastView.centerXAnchor constraintEqualToAnchor:view.centerXAnchor constant:0] setActive:true];
    [[toastView.widthAnchor constraintGreaterThanOrEqualToConstant:100] setActive:true];
    [[toastView.widthAnchor constraintLessThanOrEqualToAnchor:view.widthAnchor multiplier:1] setActive:true];
    
    
    toastView.contextLab.text = [NSString stringWithFormat:@"%@",context];
    toastView.finished = true;
    
    
    [toastView.superview layoutIfNeeded];
    [UIView animateWithDuration:0.3 animations:^{
        top.constant = 50;
        [toastView.superview layoutIfNeeded];
    } completion:nil];
    
    
    if (!time || time == 0) {
        time = 2;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.3 animations:^{
            top.constant = -50;
            [toastView.superview layoutIfNeeded];
        } completion:^(BOOL finished) {
            toastView.finished = false;
            [toastView removeFromSuperview];
        }];
    });
    
    return toastView;
}

- (void)dealloc {
    printf("\n========================dealloc");
}

- (instancetype)initWithMode:(toastMode)mode {
    self = [super init];
    if (self) {
        UIView *rootView = [[UIView alloc] init];
        [self addSubview:rootView];
        rootView.translatesAutoresizingMaskIntoConstraints = false;
        [[rootView.heightAnchor constraintEqualToConstant:26] setActive:true];
        [[rootView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor constant:0] setActive:true];
        [[rootView.topAnchor constraintEqualToAnchor:self.topAnchor constant:0] setActive:true];
        [[rootView.widthAnchor constraintGreaterThanOrEqualToConstant:100] setActive:true];
        [[rootView.widthAnchor constraintLessThanOrEqualToAnchor:self.widthAnchor multiplier:0.8] setActive:true];
        
        
        self.contextLab = [[UILabel alloc] init];
        [rootView addSubview:self.contextLab];
        self.contextLab.translatesAutoresizingMaskIntoConstraints = false;
        [[self.contextLab.leftAnchor constraintEqualToAnchor:rootView.leftAnchor constant:15] setActive:true];
        [[self.contextLab.rightAnchor constraintEqualToAnchor:rootView.rightAnchor constant:-15] setActive:true];
        [[self.contextLab.heightAnchor constraintEqualToConstant:26] setActive:true];
        [[self.contextLab.widthAnchor constraintGreaterThanOrEqualToConstant:100] setActive:true];
        [[self.contextLab.widthAnchor constraintLessThanOrEqualToAnchor:rootView.widthAnchor constant:1] setActive:true];
        self.contextLab.numberOfLines = 1;
        self.contextLab.font = [UIFont systemFontOfSize:10];
        self.contextLab.textColor = UIColorWithRGBA(255, 255, 255, 1);
        self.contextLab.textAlignment = NSTextAlignmentCenter;
        
        
        rootView.layer.masksToBounds = true;
        rootView.layer.cornerRadius = 13;
        if (mode == warningMode) {
            rootView.backgroundColor = UIColorWithRGBA(248, 73, 73, 1);
        } else {
            rootView.backgroundColor = UIColorWithRGBA(48, 48, 48, 1);
        }
    }
    return self;
}

+ (UIWindow *)convertWindow {
    UIApplication *application = [UIApplication sharedApplication];
    if ([application.delegate respondsToSelector:@selector(window)]) {
        return [application.delegate window];
    } else {
        return [application keyWindow];
    }
}

+ (LTToastView *)toastForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            LTToastView *hud = (LTToastView *)subview;
            if (hud.hasFinished == false) {
                return hud;
            }
        }
    }
    return nil;
}

@end
