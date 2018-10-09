//
//  ViewController.swift
//  CenteredAutoLayoutButton
//
//  Created by Michael Mellinger on 8/14/14.
//

import UIKit

class ViewController: UIViewController {
    
    var centeredButton: UIButton = UIButton()

    func addButton() {
        
        centeredButton.translatesAutoresizingMaskIntoConstraints = false

        centeredButton.setTitle("Am I centered?", for: UIControl.State())
        centeredButton.setTitleColor(UIColor.white, for: UIControl.State())
        centeredButton.addTarget(self, action: #selector(ViewController.pressed(_:)), for: .touchUpInside)
        
        self.view.addSubview(centeredButton)
        
        let viewDictionary:[String:AnyObject] = ["centeredButton": centeredButton]
        
        let horizontal:[NSLayoutConstraint]! = NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[centeredButton]-50-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        
        let vertical:[NSLayoutConstraint]! = NSLayoutConstraint.constraints(withVisualFormat: "V:|-100-[centeredButton]-100-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        self.view.addConstraints(horizontal)
        self.view.addConstraints(vertical)
        
    }
    
    @objc func pressed(_ sender: UIButton!) {

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

        self.view.backgroundColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0) // Apple blue
        addButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

