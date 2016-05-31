//
//  ViewController.swift
//  TapGesture
//
//  Created by Michael Mellinger on 3/15/16.
//

import UIKit

class ViewController: UIViewController {

    let view1 = UIView()
    
    func addTapView() {
        
        let height = 100
        let width = 100
    
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = UIColor.cyanColor()
        self.view.addSubview(view1)
        
        let viewDictionary:Dictionary<String,UIView> = ["view1": view1]
        
        let metrics:Dictionary<String,Int> = ["width": width, "height": height]
        
        let h0Constraint = "H:[view1(==width)]"
        let v0Constraint = "V:[view1(==height)]"
        
      
        [h0Constraint, v0Constraint].forEach {
            
            let constraint = NSLayoutConstraint.constraintsWithVisualFormat($0, options: [], metrics: metrics, views: viewDictionary)
            
            NSLayoutConstraint.activateConstraints(constraint)
        }
        
        // Center, iOS9 style
        view1.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        view1.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true

        
    }
    
    func handleSingleTap(recognizer:UITapGestureRecognizer) {
        
        let aColor = view1.backgroundColor
        
        if aColor == UIColor.cyanColor() {
            view1.backgroundColor = UIColor.grayColor()
        } else {
            view1.backgroundColor = UIColor.cyanColor()
        }
    }
    
    func addTapGesture() {
        let singleTap =
            UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(_:)))
        
        self.view1.addGestureRecognizer(singleTap)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTapView()
        addTapGesture()
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

