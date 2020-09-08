//
//  LTToastView.h
//  CatchU
//
//  Created by rp.wang on 2019/7/4.
//  Copyright © 2019 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: - toast mode
typedef NS_ENUM(NSInteger, toastMode) {
    warningMode,
    perfectionMode,
    loadingMode,
};
// TODO: 后期预留
typedef NS_ENUM(NSInteger, pathMode) {
    centerMode,
    topMode,
    bottomMode,
};

@interface LTToastView : UIView

+ (instancetype)showWithMode:(toastMode)mode body:(NSString *)context;
+ (instancetype)showWithMode:(toastMode)mode body:(NSString *)context isTime:(CGFloat)time;
+ (instancetype)showWithMode:(toastMode)mode body:(NSString *)context isView:(UIView *)view;
+ (instancetype)showWithMode:(toastMode)mode body:(NSString *)context isView:(UIView *)view isTime:(CGFloat)time;
+ (LTToastView *)toastForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
