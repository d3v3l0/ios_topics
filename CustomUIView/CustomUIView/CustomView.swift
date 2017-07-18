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
        self.backgroundColor = UIColor.orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addTriangle(_ x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat){
        
        let center = CGPoint(x: width/2 + x, y: y)
        let bottomLeft = CGPoint(x: x, y: height + y)
        let bottomRight = CGPoint(x: width + x, y: height + y)
        
        let layer = CAShapeLayer()
        
        let path = UIBezierPath()
        path.move(to: center)
        path.addLine(to: bottomLeft)
        path.addLine(to: bottomRight)
        path.close()
        layer.path = path.cgPath
        self.layer.addSublayer(layer)
    }
    
    func addCircle(_ x: CGFloat, y: CGFloat, radius: CGFloat, color:UIColor){
        
        let layer = CAShapeLayer()
        
        let path = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: radius, height: radius))
        layer.fillColor = color.cgColor
        
        layer.path = path.cgPath
        
        self.layer.addSublayer(layer)
    }
    
    // Set cornerRadius=1 to make normal rectangle
    func addRect(_ x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 10, y: 10, width: 160, height: 160), cornerRadius: 1).cgPath
        layer.fillColor = UIColor.blue.cgColor
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 2
        
        self.layer.addSublayer(layer)
        
    }
    
    func toRadians(_ degrees:CGFloat) -> CGFloat {
        return degrees * CGFloat(Double.pi)/180
    }
    
    func addArc(_ radius:CGFloat, center:CGPoint){
        
        let layer = CAShapeLayer()
        
        let startAngle:CGFloat = 0
        let endAngle:CGFloat = 180
        let clockwise = true
        
        layer.path = UIBezierPath(arcCenter: center,
                                  radius: radius,
                                  startAngle: toRadians(startAngle),
                                  endAngle:toRadians(endAngle),
                                  clockwise: clockwise).cgPath
        
        layer.fillColor = UIColor.white.cgColor
        layer.strokeColor = UIColor.gray.cgColor
        layer.lineWidth = 2
        self.layer.addSublayer(layer)
        
    }
    
    override func draw(_ rect: CGRect) {
        let width = self.frame.width
        let eyeRadius = width * 40/200
        // Drawing code
        addCircle(0, y:0, radius:width, color: UIColor.gray)
        addCircle(width*0.25, y:width*0.15, radius:eyeRadius, color: UIColor.black)

        addCircle(width*0.6, y:width*0.15, radius:eyeRadius, color: UIColor.black)
        addTriangle(width/2 - eyeRadius/2, y: width/2 - eyeRadius/2, width: eyeRadius, height: eyeRadius)
        let mouthRadius:CGFloat = width/4
        let mounthCenter = CGPoint(x: width/2, y: width*0.65)

        addArc(mouthRadius, center: mounthCenter)
        
    }

}
