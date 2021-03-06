//
//  RPToastView.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/18.
//  Copyright © 2019 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

import UIKit

class RPSubToastView: UIView, DisplayProtocol {    
    var outerLayer: UIColor?
    var innerLayer: UIColor?
    var mode: toastMode?
    var isView: UIView?
    var title: String?
    var dimBackground: Bool?
    var rootView: UIView!
    var centerView: UIView!
    var activityCenterY: NSLayoutConstraint!
    var loopCenterY: NSLayoutConstraint!
    var rotateCenterY: NSLayoutConstraint!
    var showTime: Float?
    var bgColor: UIColor?
    var titleColor: UIColor?
    var isCustomize: Bool?
    
    // MARK: -  Lazy
    lazy var titleLab: UILabel = {
        let titleLab = UILabel.init()
        centerView.addSubview(titleLab)
        titleLab.translatesAutoresizingMaskIntoConstraints = false
        titleLab.leftAnchor.constraint(equalTo: centerView.leftAnchor, constant: 8).isActive = true
        titleLab.rightAnchor.constraint(equalTo: centerView.rightAnchor, constant: -8).isActive = true
        titleLab.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        titleLab.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        titleLab.widthAnchor.constraint(lessThanOrEqualTo: rootView.widthAnchor, multiplier: 0.75).isActive = true
        titleLab.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -12).isActive = true
        titleLab.numberOfLines = 0
        titleLab.font = UIFont.boldSystemFont(ofSize: 15)
        titleLab.textAlignment = .center
        if isCustomize == true {
            titleLab.textColor = self.titleColor
        } else {
            titleLab.textColor = .titleDarkModeTxtColorWith(UIColor(red: 0, green: 0, blue: 0, alpha: 0.75))
        }
        return titleLab
    }()
    
    lazy var activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView.init(style: .whiteLarge)
        centerView.addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityCenterY = activityView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor, constant: 0)
        activityCenterY.isActive = true
        activityView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor, constant: 0).isActive = true
        if isCustomize == true {
            activityView.color = self.titleColor
        } else {
            activityView.color = .activityDarkModeColor
        }
        return activityView
    }()
    
    
    lazy var loopView: RPLodingView = {
        let loopView = RPLodingView(frame: CGRect.zero)
        if isCustomize == true {
            loopView.isCustomize = isCustomize
            loopView.outerLayer = outerLayer
            loopView.innerLayer = innerLayer
        } else {
            loopView.isCustomize = false
        }
        centerView.addSubview(loopView)
        loopView.translatesAutoresizingMaskIntoConstraints = false
        loopCenterY = loopView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor, constant: 0)
        loopCenterY.isActive = true
        loopView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor, constant: 0).isActive = true
        loopView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        loopView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        loopView.clouse = { [weak self] in
            guard let `self` = self else { return }
            self.dismiss(isAnimation: true)
        }
        return loopView
    }()
    
    lazy var rotateView: RPRotateView = {
        let rotateView = RPRotateView(frame: CGRect.init(x: 0, y: 0, width: 36, height: 36))
        centerView.addSubview(rotateView)
        rotateView.translatesAutoresizingMaskIntoConstraints = false
        rotateCenterY = rotateView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor, constant: 0)
        rotateCenterY.isActive = true
        rotateView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor, constant: 0).isActive = true
        rotateView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        rotateView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        return rotateView
    }()

    // MARK: - init UI
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func configToastViewUI() {
        configRootView(isDim: dimBackground)
        configUI(isView: isView!)
        configCenterView(mode: mode!, text: title!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // MARK: - config UI
    func configUI(isView: UIView) {
        isView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: isView.topAnchor, constant: 0).isActive = true
        self.leftAnchor.constraint(equalTo: isView.leftAnchor, constant: 0).isActive = true
        self.rightAnchor.constraint(equalTo: isView.rightAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: isView.bottomAnchor, constant: 0).isActive = true
    }
    
    func configRootView(isDim: Bool?) {
        rootView = UIView()
        self.addSubview(rootView)
        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        rootView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        rootView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        rootView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        if isDim == false {
            rootView.backgroundColor = .subDarkModeViewColor
        }
        rootView.isHidden = true
    }
    
    func configCenterView() {
        centerView = UIView()
        rootView.addSubview(centerView!)

        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.cornerRadius = 10
        centerView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor, constant: 0).isActive = true
        centerView.centerYAnchor.constraint(equalTo: rootView.centerYAnchor, constant: 0).isActive = true

        centerView.layoutIfNeeded()
        
        var effect: UIBlurEffect = UIBlurEffect(style: .light)
        if #available(iOS 13.0, *) {
            effect = UIBlurEffect(style: .systemThickMaterial)
        } else {
            effect = UIBlurEffect(style: .light)
        }
        let effectView: UIVisualEffectView = UIVisualEffectView(effect: effect)
        centerView.addSubview(effectView)
        effectView.frame = centerView.bounds
        effectView.layer.cornerRadius = 10
        effectView.layer.masksToBounds = true
        effectView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue)
    }
    
    func configCenterView(mode: toastMode, text: String) {
        configCenterView()
        if mode == .indeterminateMode {
            configIndeterminateModeUI()
        } else if mode == .onlyTextMode || mode == .mixedMode {
            configOnlyTextOrMixedModeUI(mode: mode, text: text)
        } else if mode == .loopMode {
            configLoopModeUI()
        } else if mode == .loopAndTextMode {
            configLoopAndTextModeUI(text: text)
        } else if mode == .rotateMode {
            configRotateModeUI()
        } else if mode == .rotateAndTextMode {
            configRotatAndTextModeUI(text: text)
        } else {
            centerView.widthAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
            centerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
        }
        centerView.isHidden = true
    }
    
    deinit {
        print("===================deinit")
    }
}


extension RPSubToastView {
    
    func configIndeterminateModeUI() {
        centerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        centerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        activityView.startAnimating()
    }
    
    func configOnlyTextOrMixedModeUI(mode: toastMode, text: String) {
        titleLab.text = text
        
        centerView.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        centerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        centerView.widthAnchor.constraint(lessThanOrEqualTo: rootView.widthAnchor, multiplier: 0.8).isActive = true
        
        if mode == .onlyTextMode {
            configOnlyTextModeUI()
        } else {
            configMixedModeUI()
        }
    }
    
    func configOnlyTextModeUI() {
        titleLab.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 12).isActive = true
        titleLab.centerYAnchor .constraint(equalTo: centerView.centerYAnchor, constant: 0).isActive = true
        dismiss(isAnimation: true)
    }
    
    func configMixedModeUI() {
        activityView.startAnimating()
        activityCenterY.constant = -12
        
        titleLab.topAnchor.constraint(equalTo: activityView.bottomAnchor, constant: 10).isActive = true
    }
    
    func configLoopModeUI() {
        centerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        centerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        loopView.start()
    }
    
    func configLoopAndTextModeUI(text: String) {
        centerView.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        centerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        centerView.widthAnchor.constraint(lessThanOrEqualTo: rootView.widthAnchor, multiplier: 0.8).isActive = true
        
        titleLab.text = text;
        
        loopView.removeConstraint(loopCenterY)
        loopView.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20).isActive = true
        loopView.bottomAnchor.constraint(equalTo: titleLab.topAnchor, constant: -15).isActive = true
        loopView.start()
    }
    
    func configRotateModeUI() {
        centerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        centerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        rotateView.startLoading()
    }
    
    func configRotatAndTextModeUI(text: String) {
        centerView.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        centerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        centerView.widthAnchor.constraint(lessThanOrEqualTo: self.rootView.widthAnchor, multiplier: 0.8).isActive = true
        
        titleLab.text = text;
        
        rotateView.removeConstraint(rotateCenterY)
        rotateView.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 20).isActive = true
        rotateView.bottomAnchor.constraint(equalTo: titleLab.topAnchor, constant: -15).isActive = true
        
        rotateView.startLoading()
    }
}

extension RPSubToastView {
    func showRootView(isShow: Bool) {
        self.rootView.isHidden = false
        self.rootView.alpha = 0
        self.centerView.isHidden = false
        self.centerView.alpha = 0
        UIView.animate(withDuration: 0.35, animations: { [weak self] in
            guard let `self` = self else { return }
            self.rootView.alpha = 1
            self.centerView.alpha = 1
        }) { (finished) in
            
        }
    }
    
    func dismiss(isAnimation: Bool) {
        if isAnimation == true {
            UIView.animateKeyframes(withDuration: TimeInterval(0.35), delay: TimeInterval(self.showTime!), options: .calculationModeLinear, animations: { [weak self] in
            guard let `self` = self else { return }
                self.alpha = 0
            }) {  [weak self] (finished) in
                guard let `self` = self else { return }
                self.removeProve()
            }
        } else {
            removeProve()
        }
    }
    
    func removeProve() {
        if self.mode == .loopMode {
            self.loopView.end()
            self.loopView.removeFromSuperview()
        }
        self.titleLab.removeFromSuperview()
        self.centerView.removeFromSuperview()
        self.removeFromSuperview()
    }
}
