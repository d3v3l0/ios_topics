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
    
    func addArc(){
        
        let layer = CAShapeLayer()
        
        let radius:CGFloat = 50
        let center = CGPointMake(100, 130)
        
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
        // Drawing code
//        addRect(164, y: 164, width: 160, height: 160)
        addCircle(0, y:0, radius:width, color: UIColor.grayColor())
        addCircle(50, y:30, radius:40, color: UIColor.blackColor())

        addCircle(120, y:30, radius:40, color: UIColor.blackColor())
        addTriangle(width/2-20, y: width/2-20, width: 40, height: 40)
        addArc()
        
    }
    

}
