//
//  RPToastView.swift
//  One-Swift
//
//  Created by rp.wang on 2019/6/18.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

class RPSubToastView: UIView {
    
    var rootView: UIView!
    var centerView: UIView!
    var activityCenterY: NSLayoutConstraint!
    var loopCenterY: NSLayoutConstraint!
    var mode: toastMode!
    var showTime: Float?
    
    // MARK: -  Lazy
    lazy var titleLab: UILabel = {
        let titleLab = UILabel.init()
        self.centerView.addSubview(titleLab)
        titleLab.translatesAutoresizingMaskIntoConstraints = false
        titleLab.leftAnchor.constraint(equalTo: self.centerView.leftAnchor, constant: 8).isActive = true
        titleLab.rightAnchor.constraint(equalTo: self.centerView.rightAnchor, constant: -8).isActive = true
        titleLab.heightAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        titleLab.widthAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
        titleLab.widthAnchor.constraint(lessThanOrEqualTo: self.rootView.widthAnchor, multiplier: 0.75).isActive = true
        titleLab.bottomAnchor.constraint(equalTo: centerView!.bottomAnchor, constant: -8).isActive = true
        titleLab.numberOfLines = 0
        titleLab.font = UIFont.boldSystemFont(ofSize: 15)
        titleLab.textAlignment = .center
        titleLab.textColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.75)
        return titleLab
    }()
    
    lazy var activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView.init(style: .whiteLarge)
        self.centerView.addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        self.activityCenterY = activityView.centerYAnchor.constraint(equalTo: self.centerView.centerYAnchor, constant: 0)
        self.activityCenterY.isActive = true
        activityView.centerXAnchor.constraint(equalTo: centerView!.centerXAnchor, constant: 0).isActive = true
        activityView.color = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.75)
        return activityView
    }()
    
    
    lazy var loopView: RPLodingView = {
        let loopView = RPLodingView.init(frame: CGRect.zero)
        self.centerView.addSubview(loopView)
        loopView.translatesAutoresizingMaskIntoConstraints = false
        self.loopCenterY = loopView.centerYAnchor.constraint(equalTo: self.centerView.centerYAnchor, constant: 0)
        self.loopCenterY.isActive = true
        loopView.centerXAnchor.constraint(equalTo: self.centerView.centerXAnchor, constant: 0).isActive = true
        loopView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        loopView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        loopView.clouse = { [weak self] in
            self?.dismiss(isAnimation: true)
        }
        return loopView
    }()

    // MARK: - init UI
    override init(frame: CGRect) {
        super.init(frame: frame)
        configRootView()
    }
    
    convenience init(mode: toastMode, isView: UIView, text: String?, showTime: Float){
        self.init()
        self.mode = mode
        self.showTime = showTime
        configUI(isView: isView)
        configCenterView(mode: mode, text: text)
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
    
    func configRootView() {
        self.rootView = UIView.init()
        self.addSubview(self.rootView)
        self.rootView.translatesAutoresizingMaskIntoConstraints = false
        self.rootView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.rootView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.rootView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        self.rootView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.rootView.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.rootView.isHidden = true
    }
    
    func configCenterView() {
        self.centerView = UIView.init()
        self.rootView.addSubview(self.centerView!)
        self.centerView.backgroundColor = UIColor.groupTableViewBackground
        self.centerView.translatesAutoresizingMaskIntoConstraints = false
        self.centerView.layer.cornerRadius = 10
        self.centerView.centerXAnchor.constraint(equalTo: self.rootView.centerXAnchor, constant: 0).isActive = true
        self.centerView.centerYAnchor.constraint(equalTo: self.rootView.centerYAnchor, constant: 0).isActive = true
    
    }
    
    func configCenterView(mode: toastMode, text: String?) {
        configCenterView()
        if mode == .indeterminateMode {
            configIndeterminateModeUI()
        } else if mode == .onlyTextMode || mode == .mixedMode {
            configOnlyTextOrMixedModeUI(mode: mode, text: text!)
        } else if mode == .loopMode {
            configLoopModeUI()
        }else if mode == .loopAndTextMode {
            configLoopAndTextModeUI(text: text!)
        } else {
            self.centerView.widthAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
            self.centerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true
        }
        self.centerView.isHidden = true
    }
    
    deinit {
        print("===============free memory")
    }
}


extension RPSubToastView {
    
    func configIndeterminateModeUI() {
        self.centerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.centerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.activityView.startAnimating()
    }
    
    func configOnlyTextOrMixedModeUI(mode: toastMode, text: String) {
        self.centerView.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        self.centerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        self.centerView.widthAnchor.constraint(lessThanOrEqualTo: self.rootView.widthAnchor, multiplier: 0.8).isActive = true
        self.titleLab.text = text;
        
        if mode == .onlyTextMode {
            configOnlyTextModeUI()
        } else {
            configMixedModeUI()
        }
    }
    
    func configOnlyTextModeUI() {
        self.titleLab.topAnchor.constraint(equalTo: self.centerView.topAnchor, constant: 12).isActive = true
        self.titleLab.centerYAnchor .constraint(equalTo: self.centerView.centerYAnchor, constant: 0).isActive = true
        dismiss(isAnimation: true)
    }
    
    func configMixedModeUI() {
        self.activityView.removeConstraint(self.activityCenterY)
        self.activityView.topAnchor.constraint(equalTo: self.centerView.topAnchor, constant: 20).isActive = true
        self.activityView.startAnimating()
        
        self.titleLab.topAnchor.constraint(equalTo: self.activityView.bottomAnchor, constant: 15).isActive = true
    }
    
    func configLoopModeUI() {
        self.centerView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.centerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        self.loopView.start()
    }
    
    func configLoopAndTextModeUI(text: String) {
        self.centerView.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        self.centerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        self.centerView.widthAnchor.constraint(lessThanOrEqualTo: self.rootView.widthAnchor, multiplier: 0.8).isActive = true
        
        self.titleLab.text = text;
        
        self.loopView.removeConstraint(self.loopCenterY)
        self.loopView.topAnchor.constraint(equalTo: self.centerView.topAnchor, constant: 20).isActive = true
        self.loopView.bottomAnchor.constraint(equalTo: self.titleLab.topAnchor, constant: -15).isActive = true
        self.loopView.start()
    }
    
}

extension RPSubToastView {
    func showRootView(isShow: Bool) {
        self.rootView.isHidden = false
        self.rootView.alpha = 0
        weak var weakSelf = self
        self.centerView.isHidden = false
        self.centerView.alpha = 0
        UIView.animate(withDuration: 0.35, animations: {
            weakSelf!.rootView.alpha = 1
            weakSelf!.centerView.alpha = 1
        }) { (finished) in
            
        }
    }
    
    func dismiss(isAnimation: Bool) {
        weak var weakSelf = self
        if isAnimation == true {
            UIView.animateKeyframes(withDuration: TimeInterval(0.35), delay: TimeInterval(self.showTime!), options: .calculationModeLinear, animations: {
                weakSelf!.alpha = 0
            }) { (finished) in
                weakSelf!.removeProve()
            }
        } else {
            weakSelf!.removeProve()
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
