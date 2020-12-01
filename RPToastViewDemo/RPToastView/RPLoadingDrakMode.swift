//
//  RPLoadingDrakMode.swift
//  RPToastViewDemo
//
//  Created by rp.wang on 2020/9/8.
//  Copyright © 2020 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

import UIKit

public protocol DrakModeProtocol : NSObjectProtocol {
    @available(iOS 13.0, *)
    var traitCollection: UITraitCollection { get }
    
    
    @available(iOS 13.0, *)
    func traitCollectionDidChange(_ traitCollection: UITraitCollection?)
}

extension UIColor {
    class var darkModeViewColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.label.withAlphaComponent(0.7)
        } else {
            return UIColor(white: 0, alpha: 0.7)
        }
    }
    class func configDarkModeViewColor(_ settingColor: UIColor?) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.label.withAlphaComponent(0.7)
        } else {
            return UIColor(white: 0, alpha: 0.7)
        }
    }
    class var titleDrakModeTextColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor{(trainCollection) -> UIColor in
                if trainCollection.userInterfaceStyle == .dark {
                    return .white
                } else {
                    return .black
                }
            }
        } else {
            return .black
        }
    }
    class func titleDarkModeTxtColorWith(_ settingColor: UIColor?) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor{(trainCollection) -> UIColor in
                if trainCollection.userInterfaceStyle == .dark {
                    return .white
                } else {
                    return settingColor!
                }
            }
        } else {
            return settingColor!
        }
    }
    class var subDarkModeViewColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.label.withAlphaComponent(0.7)
        } else {
            return UIColor(white: 0, alpha: 0.7)
        }
    }
    class func configSubDarkModeViewColor() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.label.withAlphaComponent(0.7)
        } else {
            return UIColor(white: 0, alpha: 0.7)
        }
    }
    class var activityDarkModeColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor{(trainCollection) -> UIColor in
                if trainCollection.userInterfaceStyle == .dark {
                    return .white
                } else {
                    return UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
                }
            }
        } else {
            return UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        }
    }
}
