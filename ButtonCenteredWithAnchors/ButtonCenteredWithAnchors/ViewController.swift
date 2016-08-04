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
        
        centeredButton.setTitle("Am I centered?", for: UIControlState())
        centeredButton.setTitleColor(UIColor.blue, for: UIControlState())
        centeredButton.translatesAutoresizingMaskIntoConstraints = false
        centeredButton.addTarget(self, action: #selector(ViewController.pressed(_:)), for: .touchUpInside)
        
        self.view.addSubview(centeredButton)
        
        centeredButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centeredButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
    }
    
    func pressed(_ sender: UIButton!) {
        
        let title = "Awesome"
        let message = "You did it"
        let alert = UIAlertController(title: title,
                                      message:message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Take Action 1?", style: .default, handler:nil)
        alert.addAction(action)
        
        let action2 = UIAlertAction(title: "Take Action 2?", style: .default, handler:nil)
        alert.addAction(action2)
        
        self.present(alert, animated: true, completion: nil)
        
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

