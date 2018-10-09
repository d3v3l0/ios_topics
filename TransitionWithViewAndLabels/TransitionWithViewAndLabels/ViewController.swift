//
//  ViewController.swift
//  TransitionWithViewAndLabels
//
//  Created by Michael Mellinger on 4/30/15.
//  Copyright (c) 2015 h4labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*
    Need to use a container as described here:
    
    http://stackoverflow.com/questions/29923061/trying-to-curl-up-curl-down-with-two-views-using-autolayout-in-swift?noredirect=1#comment47975892_29923061
    
    http://stackoverflow.com/questions/9524048/how-to-flip-an-individual-uiview-without-flipping-the-parent-view
    
    */
    var container:UIView! // Place cardFront/cardBack in this container
    
    var cardFront:UIView!
    var cardBack:UIView!
    
    func centerViewXY(_ parent: UIView, child: UIView) {
        
        let constX = NSLayoutConstraint(item: child, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parent, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        parent.addConstraint(constX)
        
        let constY = NSLayoutConstraint(item: child, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: parent, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
        parent.addConstraint(constY)
        
    }
    
    func addStandardConstraints(_ view:UIView, constraint:String, viewDictionary:Dictionary<String,AnyObject>, metrics:Dictionary<String, Int>) {
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: constraint, options: [], metrics: metrics, views: viewDictionary))
        
    }
    
    @objc func curlUp() {
        let transitionOptions = UIView.AnimationOptions.transitionCurlUp
        
        UIView.transition(from: cardFront,
            to: cardBack,
            duration: 5.0,
            options: transitionOptions,
            completion: { _ in
                
                let transitionOptions = UIView.AnimationOptions.transitionCurlDown
                
                UIView.transition(from: self.cardBack,
                    to: self.cardFront,
                    duration: 5.0,
                    options: transitionOptions,
                    completion: { _ in
                        //
                })
                
        })
        
    }
    
    func addLabelToCardBack() {
        let height = 40
        let width = 100
        
        let label = UILabel()

        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        cardBack.addSubview(label)
        
        let h0Constraint = "H:[label(==width)]"
        let v0Constraint = "V:[label(==height)]"
        let metrics:Dictionary<String,Int> = ["width": width, "height": height]
        let viewDictionary:Dictionary<String,UIView> = ["label": label]

        addStandardConstraints(cardBack, constraint: h0Constraint, viewDictionary: viewDictionary, metrics: metrics)
        addStandardConstraints(cardBack, constraint: v0Constraint, viewDictionary: viewDictionary, metrics: metrics)
        
        centerViewXY(cardBack, child: label)
        label.text = "Hello World"
    }
    
    func buildView() {
        
        let height = 200
        let width = 200
        
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.black
        self.view.addSubview(container)
        
        cardBack = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height)))
        // WARNING: Accidently leave this set and you'll be in for a little hurt when you add the uilabel with autolayout
//        cardBack.setTranslatesAutoresizingMaskIntoConstraints(false)
        cardBack.backgroundColor = UIColor.red
        container.addSubview(cardBack)
        cardBack.layer.borderWidth = 2
        cardBack.layer.borderColor = UIColor.black.cgColor
        
        cardFront = UIView(frame: CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height)))
//        cardFront.setTranslatesAutoresizingMaskIntoConstraints(false)
        cardFront.backgroundColor = UIColor.green
        container.addSubview(cardFront)
        cardFront.layer.borderWidth = 2
        cardFront.layer.borderColor = UIColor.black.cgColor
        
        
        let viewDictionary:Dictionary<String,UIView> = ["container": container]
        
        let metrics:Dictionary<String,Int> = ["width": width, "height": height]
        
        let h0Constraint = "H:[container(==width)]"
        let v0Constraint = "V:[container(==height)]"
        
        addStandardConstraints(self.view, constraint: h0Constraint, viewDictionary: viewDictionary, metrics: metrics)
        addStandardConstraints(self.view, constraint: v0Constraint, viewDictionary: viewDictionary, metrics: metrics)
        
        centerViewXY(self.view, child: container)
        
        addLabelToCardBack()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.curlUp), userInfo: nil, repeats: false)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.purple
        buildView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



