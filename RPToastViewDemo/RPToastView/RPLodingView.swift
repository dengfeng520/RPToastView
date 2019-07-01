//
//  RPLodingView.swift
//  RPToastViewDemo
//
//  Created by rp.wang on 2019/7/1.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

typealias RPLoadingViewAnimationStopClose = () -> ()

class RPLodingView: UIView {
    
    var clouse: RPLoadingViewAnimationStopClose?
    public var radius: CGFloat = 36 / 2
    private var backgroundShapeLayer: CAShapeLayer!
    private var progressShapeLayer: CAShapeLayer!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureShapeLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureShapeLayer()
    }
    
    func configureShapeLayer() {
        self.backgroundColor = UIColor.clear
        backgroundShapeLayer = CAShapeLayer()
        progressShapeLayer = CAShapeLayer()
        backgroundShapeLayer.frame = bounds
        progressShapeLayer.frame = bounds
        layer.addSublayer(backgroundShapeLayer)
        layer.addSublayer(progressShapeLayer)
    }
    
    func configurePath() {
        let path = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius),
                                radius: radius,
                                startAngle: -CGFloat.pi / 2,
                                endAngle: CGFloat.pi * 3 / 2,
                                clockwise: true)
        backgroundShapeLayer.path = path.cgPath
        backgroundShapeLayer.strokeColor = UIColor.init(red: 205/255, green: 205/255, blue: 205/255, alpha: 1).cgColor
        backgroundShapeLayer.fillColor = UIColor.clear.cgColor
        backgroundShapeLayer.lineWidth = 2
        backgroundShapeLayer.strokeStart = 0.0
        backgroundShapeLayer.strokeEnd = 1.0
        let startPath = UIBezierPath(arcCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle:0, endAngle: CGFloat.pi / 3, clockwise: true)
        progressShapeLayer.path = startPath.cgPath
        progressShapeLayer.fillColor = UIColor.clear.cgColor
        progressShapeLayer.lineWidth = 2
        
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configurePath()
    }
    
    func configureAnimation() {
        progressShapeLayer.strokeColor = UIColor.black.cgColor
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.repeatCount = .greatestFiniteMagnitude
        animation.duration = 1.0
        animation.fromValue = 0
        animation.isRemovedOnCompletion = false
        animation.toValue = CGFloat.pi * 2
        animation.delegate = self
        layer.add(animation, forKey: "transform.roration")
    }
    
    func start() {
        configureAnimation()
    }
    
    func end() {
        layer.removeAllAnimations()
    }
}

// MARK: - CAAnimationDelegate
extension RPLodingView: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.end()
        if self.clouse != nil {
            self.clouse!()
        }
    }
}
