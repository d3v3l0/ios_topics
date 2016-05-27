//
//  ViewController.swift
//  LineDrawingAnimation
//
//  Created by Michael Mellinger on 5/26/16.
//  Copyright © 2016 Michael Mellinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func addLine(x0: CGFloat, y0: CGFloat, x1: CGFloat, y1: CGFloat) {
        
        let layer = CAShapeLayer()
        
        let startPoint = CGPointMake(x0, y0)
        let endPoint = CGPointMake(x1, y1)
        
        let path = UIBezierPath()
        path.moveToPoint(startPoint)
        path.addLineToPoint(endPoint)
        
        layer.path = path.CGPath
        layer.strokeColor = UIColor.redColor().CGColor
        layer.lineWidth = 2
        view.layer.addSublayer(layer)
        
        
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.repeatCount = 1.0
        
        drawAnimation.fromValue = 0
        drawAnimation.toValue = 1
        
        drawAnimation.duration = 3.0
        
        drawAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        layer.addAnimation(drawAnimation, forKey: "drawLineAnimation")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addLine(20, y0: 20, x1: 250, y1: 500)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

