//
//  ViewController.swift
//  CenteredAutoLayoutButton
//
//  Created by Michael Mellinger on 8/14/14.
//

import UIKit

class ViewController: UIViewController {
    
    var centeredButton = UIButton()
    
    func addButton() {
        
        centeredButton.setTitle("Am I centered?", forState: .Normal)
        centeredButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        centeredButton.translatesAutoresizingMaskIntoConstraints = false
        centeredButton.addTarget(self, action: #selector(ViewController.pressed(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(centeredButton)
        
        centeredButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        centeredButton.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor, constant: -40).active = true
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

