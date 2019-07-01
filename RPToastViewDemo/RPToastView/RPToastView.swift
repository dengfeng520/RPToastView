//
//  RPLoadingView.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/27.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

enum toastMode {
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

class RPToastView:  NSObject {
    
    static var toastView : RPSubToastView!

    public static func show(mode: toastMode, isView: UIView? = nil, text: String? = nil, showTime: Float? = nil) {
        DispatchQueue.main.async {
            let addView = isView ?? (UIApplication.shared.keyWindow ?? UIView())
            let title = text ?? ""
            let time = showTime ?? 1.5
            self.toastView = RPSubToastView.init(mode: mode, isView: addView, text: title, showTime: time)
            self.toastView.showRootView(isShow: true)
        }
    }
    
    public static func hidden(animation: Bool) {
        DispatchQueue.main.async {
            self.toastView.dismiss(isAnimation: animation)
            self.toastView.removeFromSuperview()
        }
    }
    
}
