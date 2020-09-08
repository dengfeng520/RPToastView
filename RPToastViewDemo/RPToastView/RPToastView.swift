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

public protocol DisplayProtocol {
    var mode: toastMode? { get }
    var isView: UIView? { get }
    var title: String? { get }
    var showTime: Float? { get }
    var dimBackground: Bool? { get }
}

public struct Display: DisplayProtocol {
    public var mode: toastMode?
    public var isView: UIView?
    public var title: String?
    public var showTime: Float?
    public var dimBackground: Bool?
    static var currentWindows: UIWindow?
}

protocol ShowToastProtocol {
    static func loading<T>(_ r: T) where T : DisplayProtocol
    static func hidden(animation: Bool)
}

public class RPToastView: ShowToastProtocol {
    static var toastView: RPSubToastView!

    public static func loading<T>(_ r: T) where T : DisplayProtocol {
        DispatchQueue.main.async {
            let addView = r.isView ?? (currentWindows ?? UIView())
            let title = r.title ?? ""
            let time = r.showTime ?? 1.5
            let isBackground = r.dimBackground ?? true
            self.toastView = RPSubToastView(mode: r.mode ?? .indeterminateMode, isView: addView, text: title, showTime: time, dimBackground: isBackground)
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

extension RPToastView {
    static var currentWindows: UIWindow? {
        var window: UIWindow? = nil
        if #available(iOS 13.0, *) {
            for windowScene: UIWindowScene in ((UIApplication.shared.connectedScenes as? Set<UIWindowScene>)!) {
                if windowScene.activationState == UIScene.ActivationState.foregroundActive {
                    window = windowScene.windows.first
                    break
                }
            }
            return window
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
