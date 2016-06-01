//
//  ViewController.swift
//  AlertControllers
//
//  Created by Michael Mellinger on 6/1/16.
//

import UIKit

class ViewController: UIViewController {

    let button1 = UIButton()
    
    func addButton() {
        view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Alert", forState: .Normal)
        
        button1.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        button1.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        // Initialize Alert Controller
        let alertController = UIAlertController(title: "Alert", message: "Are you okay?", preferredStyle: .Alert)
        
        // Initialize Actions
        let yesAction = UIAlertAction(title: "Yes", style: .Default) { (action) -> Void in
            print("The user is okay.")
        }
        
        let noAction = UIAlertAction(title: "No", style: .Default) { (action) -> Void in
            print("The user is not okay.")
        }
        
        // Add Actions
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        // Present Alert Controller
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purpleColor()
        addButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

