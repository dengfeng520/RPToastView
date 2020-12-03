//
//  RPRotateView.swift
//  RPToastViewDemo
//
//  Created by rp.wang on 2020/12/1.
//  Copyright © 2020 Beijing Physical Fitness Sport Science and Technology Co.,Ltd. All rights reserved.
//

import UIKit

class RPRotateView: UIView {

    /// 圆弧半径：默认18
    let radius: CGFloat = 18
    /// 线条宽度：默认2.5
    let lineWidth: CGFloat = 2.5
    /// 圆弧的背景颜色：默认半透明黑色
    let bgColor: UIColor = UIColor.black.withAlphaComponent(0.5)
    /// 进度的颜色：默认白色
    let strokeColor: UIColor = .white
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configLayer() {
        backgroundLayer.strokeColor = bgColor.cgColor
        backgroundLayer.lineWidth = lineWidth
        animatedLayer.strokeColor = strokeColor.cgColor
        animatedLayer.lineWidth = lineWidth
        layoutIfNeeded()
        layoutAnimatedLayer()
    }
    
    /// 半径layer
    lazy var backgroundLayer: CAShapeLayer = {
        let arcCenter: CGPoint = layerCenter()
        var smoothedPath: UIBezierPath = UIBezierPath.init(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(-Double.pi / 2), endAngle: CGFloat(Double.pi + Double.pi / 2), clockwise: true)
        $0.contentsScale = UIScreen.main.scale
        $0.frame = CGRect(x: 0, y: 0, width: arcCenter.x * 2, height: arcCenter.y * 2)
        $0.fillColor = UIColor.clear.cgColor
        $0.strokeColor = bgColor.cgColor
        $0.lineWidth = lineWidth
        $0.lineCap = .round
        $0.lineJoin = .bevel
        $0.path = smoothedPath.cgPath
        $0.strokeEnd = 1.0
        return $0
    }(CAShapeLayer())
    
    
    /// 动画layer
    lazy var animatedLayer: CAShapeLayer = {
        self.layer.addSublayer(self.backgroundLayer)
        let arcCenter = layerCenter()
        $0.contentsScale = UIScreen.main.scale
        $0.frame = CGRect.init(x: 0, y: 0, width: arcCenter.x * 2, height: arcCenter.y * 2)
        $0.fillColor = UIColor.clear.cgColor
        $0.strokeColor = strokeColor.cgColor
        $0.lineWidth = lineWidth
        $0.lineCap = .round
        $0.lineJoin = .bevel
        setupIndeterminateMaskAnim(layer: $0)
        return $0
    }(CAShapeLayer())
    
    func layerCenter() -> CGPoint {
        let xy = self.radius + self.lineWidth * 0.5 + 5
        return CGPoint.init(x: xy, y: xy)
    }
    
    func setupIndeterminateMaskAnim(layer: CAShapeLayer) {
        let arcCenter: CGPoint = layerCenter()
        let smoothedPath: UIBezierPath = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(Double.pi * 3 / 2), endAngle: CGFloat(Double.pi / 2 + Double.pi * 5), clockwise: true)
        layer.path = smoothedPath.cgPath
        let maskLayer: CALayer = CALayer()
        maskLayer.contents = bundleImageNamed("angle-mask")?.cgImage
        maskLayer.frame = layer.bounds
        layer.mask = maskLayer
    }
    
    func bundleImageNamed(_ filename: String) -> UIImage? {
        let pathName = "maskImage.bundle/image/\(filename)"
        let url = "\(Bundle.main.resourcePath ?? "")/\(pathName)"
        return UIImage(contentsOfFile: url )
    }
}

extension RPRotateView: CAAnimationDelegate {
    func layoutAnimatedLayer() {
        self.layer.addSublayer(self.animatedLayer)
        let viewWidth = self.bounds.width
        let viewHeight = self.bounds.height
        let layerW = self.animatedLayer.bounds.width
        let layerH = self.animatedLayer.bounds.height
        
        let widthDiff = viewWidth - layerW
        let heightDiff = viewHeight - layerH
        
        let positionX = viewWidth - layerW * 0.5 - widthDiff * 0.5
        let positionY = viewHeight - layerH * 0.5 - heightDiff * 0.5
        
        self.animatedLayer.position = CGPoint(x: positionX, y: positionY)
        backgroundLayer.position = self.animatedLayer.position
    }
    
    func startLoading() {
        let animationDuration: TimeInterval = 1
        let linearCurve: CAMediaTimingFunction = CAMediaTimingFunction.init(name: .linear)
        let animation: CABasicAnimation = CABasicAnimation.init(keyPath: "transform.rotation")
        animation.fromValue = 0
        animation.toValue = Double.pi * 2
        animation.duration = animationDuration
        animation.timingFunction = linearCurve
        animation.isRemovedOnCompletion = false
        animation.repeatCount = HUGE
        animation.fillMode = .forwards
        animation.autoreverses = false
        self.animatedLayer.mask?.add(animation, forKey: "rotate")
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = animationDuration
        animationGroup.repeatCount = HUGE
        animationGroup.isRemovedOnCompletion = false
        animationGroup.timingFunction = linearCurve
        
        let startAnimation = CABasicAnimation.init(keyPath: "strokeStart")
        startAnimation.fromValue = 0.015
        startAnimation.toValue = 0.515
        
        let endAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        endAnimation.fromValue = 0.485
        endAnimation.toValue = 0.985
        
        animationGroup.animations = [startAnimation, endAnimation]
        animatedLayer.add(animationGroup, forKey: "progress")
    }
}
