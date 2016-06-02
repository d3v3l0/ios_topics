//
//  CustomView.swift
//  CustomUIView
//
//  Created by Michael Mellinger on 6/2/16.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.orangeColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        self.layer.addSublayer(layer)
    }
    
    func addCircle(x: CGFloat, y: CGFloat, radius: CGFloat, color:UIColor){
        
        let layer = CAShapeLayer()
        
        let path = UIBezierPath(ovalInRect: CGRectMake(x, y, radius, radius))
        layer.fillColor = color.CGColor
        
        layer.path = path.CGPath
        
        self.layer.addSublayer(layer)
    }
    
    // Set cornerRadius=1 to make normal rectangle
    func addRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 10, y: 10, width: 160, height: 160), cornerRadius: 1).CGPath
        layer.fillColor = UIColor.blueColor().CGColor
        layer.strokeColor = UIColor.blackColor().CGColor
        layer.lineWidth = 2
        
        self.layer.addSublayer(layer)
        
    }
    
    func toRadians(degrees:CGFloat) -> CGFloat {
        return degrees * CGFloat(M_PI)/180
    }
    
    func addArc(radius:CGFloat, center:CGPoint){
        
        let layer = CAShapeLayer()
        
        let startAngle:CGFloat = 0
        let endAngle:CGFloat = 180
        let clockwise = true
        
        layer.path = UIBezierPath(arcCenter: center,
                                  radius: radius,
                                  startAngle: toRadians(startAngle),
                                  endAngle:toRadians(endAngle),
                                  clockwise: clockwise).CGPath
        
        layer.fillColor = UIColor.whiteColor().CGColor
        layer.strokeColor = UIColor.grayColor().CGColor
        layer.lineWidth = 2
        self.layer.addSublayer(layer)
        
    }
    

    override func drawRect(rect: CGRect) {
        let width = self.frame.width
        let eyeRadius = width * 40/200
        // Drawing code
        addCircle(0, y:0, radius:width, color: UIColor.grayColor())
        addCircle(width*0.25, y:width*0.15, radius:eyeRadius, color: UIColor.blackColor())

        addCircle(width*0.6, y:width*0.15, radius:eyeRadius, color: UIColor.blackColor())
        addTriangle(width/2 - eyeRadius/2, y: width/2 - eyeRadius/2, width: eyeRadius, height: eyeRadius)
        let mouthRadius:CGFloat = width/4
        let mounthCenter = CGPointMake(width/2, width*0.65)

        addArc(mouthRadius, center: mounthCenter)
        
    }
    

}
