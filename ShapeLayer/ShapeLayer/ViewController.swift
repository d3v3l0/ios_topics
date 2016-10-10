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

    /*
     
     */
    func addLine(x0: CGFloat, y0: CGFloat, x1: CGFloat, y1: CGFloat) {
        
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
    }
    

    /*
      Set cornerRadius=1 to make normal rectangle
     */
    func addRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 164, y: 164, width: 160, height: 160), cornerRadius: 1).cgPath
        layer.fillColor = UIColor.blue.cgColor
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 2

        view.layer.addSublayer(layer)

    }
    
    /*
     
     */
    func addRoundedRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let layer = CAShapeLayer()
        
        let cornerRadius:CGFloat = 10
        
        layer.path = UIBezierPath(roundedRect: CGRect(x: 64, y: 64, width: 160, height: 160), cornerRadius: cornerRadius).cgPath
        layer.fillColor = UIColor.red.cgColor
        view.layer.addSublayer(layer)
    }
    
    /*
     We draw it this way if we need to animate drawing the circle
     */
    func addCircleWithArc(){
        
        let layer = CAShapeLayer()
        
        let radius:CGFloat = 50
        let center = CGPoint(x: 100, y: 500)
        
        let startAngle:CGFloat = 1
        let endAngle:CGFloat = 360
        let clockwise = true
        
        layer.path = UIBezierPath(arcCenter: center,
                                  radius: radius,
                                  startAngle: toRadians(degrees: startAngle),
                                  endAngle:toRadians(degrees: endAngle),
                                  clockwise: clockwise).cgPath
        
        layer.fillColor = UIColor.blue.cgColor
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 2
        view.layer.addSublayer(layer)
        
    }
    
    /*

     */
    func addArc() {
        
        let layer = CAShapeLayer()
        
        let radius:CGFloat = 50
        let center = CGPoint(x: 300, y: 500)
        
        let startAngle:CGFloat = 1
        let endAngle:CGFloat = 120
        let clockwise = true
        
        layer.path = UIBezierPath(arcCenter: center,
                                  radius: radius,
                                  startAngle: toRadians(degrees: startAngle),
                                  endAngle:toRadians(degrees: endAngle),
                                  clockwise: clockwise).cgPath
        
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = UIColor.red.cgColor
        layer.lineWidth = 5
        view.layer.addSublayer(layer)
        
    }


    /*
     
     */
    func addCircle(x: CGFloat, y: CGFloat, radius: CGFloat){
        
        let layer = CAShapeLayer()
        
        let path = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: radius, height: radius))
        layer.fillColor = UIColor.orange.cgColor

        layer.path = path.cgPath

        view.layer.addSublayer(layer)
    }

    func addEllipse(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        
        let layer = CAShapeLayer()
        
        let path = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: height, height: width))
        
        layer.path = path.cgPath
        
        view.layer.addSublayer(layer)
    }

    /*
     
     */
    func addTriangle(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat){
        
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
        view.layer.addSublayer(layer)
    }
    
    /*
     
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0) // Apple blue

        addLine(x0: 20, y0: 20, x1: 25, y1: 500)
        addRect(x: 164, y: 164, width: 160, height: 160)
        addRoundedRect(x: 64, y: 64, width: 160, height: 160)
        addArc()
        addCircleWithArc()
        addCircle(x: 90, y:260, radius:40)
        addEllipse(x: 290, y:360, width: 80, height: 40)
        addTriangle(x: 40, y: 400, width: 40, height: 40)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

