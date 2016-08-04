//
//  ViewController.swift
//  LineDrawingAnimation
//
//  Created by Michael Mellinger on 5/26/16.
//

import UIKit

class ViewController: UIViewController {

    func addLine(_ x0: CGFloat, y0: CGFloat, x1: CGFloat, y1: CGFloat) {
        
        let layer = CAShapeLayer()
        
        let startPoint = CGPoint(x: x0, y: y0)
        let endPoint = CGPoint(x: x1, y: y1)
        
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        layer.path = path.cgPath
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 2
        view.layer.addSublayer(layer)
        
        
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.repeatCount = 1.0
        
        drawAnimation.fromValue = 0
        drawAnimation.toValue = 1
        
        drawAnimation.duration = 3.0
        
        drawAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        
        layer.add(drawAnimation, forKey: "drawLineAnimation")
        
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

