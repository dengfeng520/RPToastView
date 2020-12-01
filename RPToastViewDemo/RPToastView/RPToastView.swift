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
    // Rotate
    case rotateMode
    // Rotate + Text
    case rotateAndTextMode
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
    // backgroudColor
    var bgColor: UIColor? { get }
    var titleColor: UIColor? { get }
    // 是否自定义颜色
    var isCustomize: Bool? { get }
    // 外圈
    var outerLayer: UIColor? { get }
    // 内圈
    var innerLayer: UIColor? { get }
}

public struct Display: DisplayProtocol {
    public var mode: toastMode?
    public var isView: UIView?
    public var title: String?
    public var showTime: Float?
    public var dimBackground: Bool?
    public var bgColor: UIColor?
    public var titleColor: UIColor?
    public var isCustomize: Bool?
    // 外圈
    public var outerLayer: UIColor?
    // 内圈
    public var innerLayer: UIColor?
    static var currentWindows: UIWindow?
    
    public init() {
        
    }
    
    public init(mode: toastMode? = .indeterminateMode, isView: UIView? = nil, title: String? = "Loading...", showTime: Float? = 1.5, isCustomize: Bool? = false, bgColor: UIColor? = .groupTableViewBackground, titleColor: UIColor? = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75),  dimBackground: Bool? = true, roundColor: UIColor? = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)) {
        self.mode = mode
        self.isView = isView
        self.title = title
        self.showTime = showTime
        self.isCustomize = isCustomize
        self.bgColor = bgColor
        self.titleColor = titleColor
        self.dimBackground = dimBackground
    }
}

protocol ShowToastProtocol {
    static func loading<T>(_ r: T) where T : DisplayProtocol
    static func hidden(animation: Bool)
}

public class RPToastView: ShowToastProtocol {
    static var toastView: RPSubToastView!

    public static func loading<T>(_ r: T) where T : DisplayProtocol {
        DispatchQueue.main.async {
            toastView = RPSubToastView()
            toastView.mode = r.mode ?? .onlyTextMode
            toastView.isView = r.isView ?? (currentWindows ?? UIView())
            toastView.title = r.title ?? "Loading..."
            toastView.showTime = r.showTime ?? 1.5
            toastView.dimBackground = r.dimBackground ?? true
            toastView.isCustomize = r.isCustomize ?? false
            toastView.bgColor = r.bgColor ?? .darkModeViewColor
            toastView.titleColor = r.titleColor ?? .titleDrakModeTextColor
            toastView.outerLayer = r.outerLayer ?? .darkModeViewColor
            toastView.innerLayer = r.innerLayer ?? .titleDrakModeTextColor
            toastView.configToastViewUI()
            toastView.showRootView(isShow: true)
        }
    }
    
     public static func hidden(animation: Bool) {
        DispatchQueue.main.async {
            guard let toastView = toastView else { return }
            toastView.dismiss(isAnimation: animation)
            toastView.removeFromSuperview()
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
