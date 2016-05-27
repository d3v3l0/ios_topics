//
//  ViewController.swift
//  ShapeLayer
//
//  Created by Michael Mellinger on 3/19/16.
//

import UIKit

class ViewController: UIViewController {
 
    func toRadians(degrees:CGFloat) -> CGFloat {
        return degrees * CGFloat(M_PI)/180
    }

    func addLine(x0: CGFloat, y0: CGFloat, x1: CGFloat, y1: CGFloat) {
        
        let layer = CAShapeLayer()
        
        let startPoint = CGPointMake(x0, y0)
        let endPoint = CGPointMake(x1, y1)
        
        let path = UIBezierPath()
        path.moveToPoint(startPoint)
        path.addLineToPoint(endPoint)
        
        layer.path = path.CGPath
        //        layer.fillColor = UIColor.blueColor().CGColor
        layer.strokeColor = UIColor.redColor().CGColor
        layer.lineWidth = 2
        view.layer.addSublayer(layer)
    }
    

    // Set cornerRadius=1 to make normal rectangle
    func addRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 164, y: 164, width: 160, height: 160), cornerRadius: 1).CGPath
        layer.fillColor = UIColor.blueColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        layer.lineWidth = 2

        view.layer.addSublayer(layer)

    }
    
    func addRoundedRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let layer = CAShapeLayer()
        
        let cornerRadius:CGFloat = 10
        
        layer.path = UIBezierPath(roundedRect: CGRect(x: 64, y: 64, width: 160, height: 160), cornerRadius: cornerRadius).CGPath
        layer.fillColor = UIColor.redColor().CGColor
        view.layer.addSublayer(layer)
    }
    
    /*
     We draw it this way if we need to animate drawing the circle
     */
    func addCircleWithArc(){
        
        let layer = CAShapeLayer()
        
        let radius:CGFloat = 50
        let center = CGPointMake(100, 500)
        
        let startAngle:CGFloat = 1
        let endAngle:CGFloat = 360
        let clockwise = true
        
        layer.path = UIBezierPath(arcCenter: center,
                                  radius: radius,
                                  startAngle: toRadians(startAngle),
                                  endAngle:toRadians(endAngle),
                                  clockwise: clockwise).CGPath
        
        layer.fillColor = UIColor.blueColor().CGColor
        layer.strokeColor = UIColor.redColor().CGColor
        layer.lineWidth = 2
        view.layer.addSublayer(layer)
        
    }



    func addCircle(x: CGFloat, y: CGFloat, radius: CGFloat){
        
        let layer = CAShapeLayer()
        
        let path = UIBezierPath(ovalInRect: CGRectMake(x, y, radius, radius))
        layer.fillColor = UIColor.orangeColor().CGColor

        layer.path = path.CGPath

        view.layer.addSublayer(layer)
    }

    func addEllipse(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        
        let layer = CAShapeLayer()
        
        let path = UIBezierPath(ovalInRect: CGRectMake(x, y, height, width))
        
        layer.path = path.CGPath
        
        view.layer.addSublayer(layer)
    }

    func addTriangle(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat){
        
        let center = CGPointMake(width/2 + x, y)
        let bottomLeft = CGPointMake(x, height + y)
        let bottomRight = CGPointMake(width + x, height + y)
        
        let layer = CAShapeLayer()
        
        let path = UIBezierPath()
        path.moveToPoint(center)
        path.addLineToPoint(bottomLeft)
        path.addLineToPoint(bottomRight)
        path.closePath()
        layer.path = path.CGPath
        view.layer.addSublayer(layer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addLine(20, y0: 20, x1: 25, y1: 500)
        addRect(164, y: 164, width: 160, height: 160)
        addRoundedRect(64, y: 64, width: 160, height: 160)
        addCircleWithArc()
        addCircle(90, y:260, radius:40)
        addEllipse(290, y:360, width: 80, height: 40)
        addTriangle(40, y: 400, width: 40, height: 40)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

