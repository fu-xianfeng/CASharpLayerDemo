//
//  ViewController.swift
//  SharpTest
//
//  Created by Xianfeng Fu on 3/31/15.
//  Copyright (c) 2015 xianfeng. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    let kWinSize = UIScreen.mainScreen().bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        var center:CGPoint = CGPointMake(kWinSize.width/2, kWinSize.height/2)
        var radius:CGFloat = (kWinSize.width/4)-30
        var startAngle:CGFloat = 0
        var endAngle:CGFloat = (CGFloat)(M_PI * 2.0)
        
        var path:UIBezierPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        var sharpLayer = CAShapeLayer()
        sharpLayer.path = path.CGPath
        sharpLayer.lineCap = kCALineCapButt
        sharpLayer.lineWidth = radius*2
        sharpLayer.fillColor = UIColor.clearColor().CGColor
        sharpLayer.strokeStart = 0.0
        sharpLayer.strokeEnd = 1.0
        sharpLayer.strokeColor = UIColor.redColor().CGColor
        
        self.view.layer.addSublayer(sharpLayer)
        
        var animation: CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 3
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.removedOnCompletion = true
        sharpLayer.addAnimation(animation, forKey: "maskAnimation")
        
        //self.view.layer.mask = sharpLayer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

