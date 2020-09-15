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
            return UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        } else {
            return .groupTableViewBackground
        }
    }
    class func configDarkModeViewColor() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        } else {
            return .groupTableViewBackground
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
    class func titleDarkModeTxtColorWith(_ dfaultColor: UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor{(trainCollection) -> UIColor in
                if trainCollection.userInterfaceStyle == .dark {
                    return .white
                } else {
                    return dfaultColor
                }
            }
        } else {
            return dfaultColor
        }
    }
    class var subDarkModeViewColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor{(trainCollection) -> UIColor in
                if trainCollection.userInterfaceStyle == .dark {
                    return UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 0.35)
                } else {
                    return UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
                }
            }
        } else {
            return .groupTableViewBackground
        }
    }
    class func configSubDarkModeViewColor() -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor{(trainCollection) -> UIColor in
                if trainCollection.userInterfaceStyle == .dark {
                    return UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
                } else {
                    return .groupTableViewBackground
                }
            }
        } else {
            return .groupTableViewBackground
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
