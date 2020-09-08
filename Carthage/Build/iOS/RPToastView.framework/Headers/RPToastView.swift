//
//  RPLoadingView.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/27.
//  Copyright © 2019 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

import UIKit

public enum toastMode {
    // Only Texts
    case onlyTextMode
    // UIActivityIndicatorView
    case indeterminateMode
    // UIActivityIndicatorView + Text
    case mixedMode
    // Only Loop
    case loopMode
    // Loop + Text
    case loopAndTextMode
    // TODO: progress
    case progressMode
    // TODO: progress + Text
    case progressAndTextMode
}

public class RPToastView:  NSObject {
    
    static var toastView : RPSubToastView!

    public static func show(mode: toastMode, isView: UIView? = nil, text: String? = nil, showTime: Float? = nil, dimBackground: Bool? = nil) {
        DispatchQueue.main.async {
            let addView = isView ?? (isView?.window ?? UIView())
            let title = text ?? ""
            let time = showTime ?? 1.5
            let isBackground = dimBackground ?? true
            self.toastView = RPSubToastView(mode: mode, isView: addView, text: title, showTime: time, dimBackground: isBackground)
            self.toastView.showRootView(isShow: true)
        }
    }
    
    public static func hidden(animation: Bool) {
        DispatchQueue.main.async {
            toastView.dismiss(isAnimation: animation)
            toastView.removeFromSuperview()
        }
    }
}
