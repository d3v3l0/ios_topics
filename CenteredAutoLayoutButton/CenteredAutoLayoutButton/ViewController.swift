//
//  ViewController.swift
//  CenteredAutoLayoutButton
//
//  Created by Michael Mellinger on 8/14/14.
//  Copyright (c) 2014 h4labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var centeredButton: UIButton!

    
    func addButton() {
        centeredButton = UIButton()
        centeredButton.setTitle("Am I centered?", forState: .Normal)
        centeredButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        centeredButton.translatesAutoresizingMaskIntoConstraints = false
        centeredButton.addTarget(self, action: #selector(ViewController.pressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(centeredButton)
        
        let viewDictionary:Dictionary = ["centeredButton": centeredButton]
        
        let horizontal:[NSLayoutConstraint]! = NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[centeredButton]-50-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        
        let vertical:[NSLayoutConstraint]! = NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[centeredButton]-100-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        self.view.addConstraints(horizontal)
        self.view.addConstraints(vertical)
        
    }
    
    func pressed(sender: UIButton!) {

        let title = "Awesome"
        let message = "You did it"
        let alert = UIAlertController(title: title,
                                      message:message,
                                      preferredStyle: .Alert)
        let action = UIAlertAction(title: "Take Action 1?", style: .Default, handler:nil)
        alert.addAction(action)
        
        let action2 = UIAlertAction(title: "Take Action 2?", style: .Default, handler:nil)
        alert.addAction(action2)
        
        self.presentViewController(alert, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

