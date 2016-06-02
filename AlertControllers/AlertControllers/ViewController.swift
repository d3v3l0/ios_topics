//
//  ViewController.swift
//  AlertControllers
//
//  Created by Michael Mellinger on 6/1/16.
//

import UIKit

class ViewController: UIViewController {

    let button1 = UIButton()
    let label1 = UILabel()
    
    func addLabel() {
        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "Click the Alert button"
        label1.textColor = .grayColor()
        label1.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        label1.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor, constant: 40).active = true

    }
    
    func addButton() {
        view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Alert", forState: .Normal)
        button1.addTarget(self, action: #selector(ViewController.showGameOverAlert(_:)), forControlEvents: .TouchUpInside)
        
        button1.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        button1.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor, constant: -40).active = true
        
    }
    
    func showGameOverAlert(button: UIButton) {

        let alertController = UIAlertController(title: "Game Over", message: "Play again?", preferredStyle: .Alert)
        
        // Using closure handler
        let action1 = UIAlertAction(title: "Yes", style: .Default) { (action) -> Void in
            self.label1.text = "Starting new game."
        }
        
        // Calling function handler
        let action2 = UIAlertAction(title: "No", style: .Default, handler: noHandler(_:))
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func noHandler(action: UIAlertAction) {
        label1.text = "That's all folks!"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purpleColor()
        addButton()
        addLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

