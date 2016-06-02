//
//  ViewController.swift
//  CustomUIView
//
//  Created by Michael Mellinger on 6/2/16.
//

import UIKit

class ViewController: UIViewController {

    let customView = CustomView()
    
    
    func addCustomView() {
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(customView)
        
        customView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        customView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        customView.widthAnchor.constraintEqualToConstant(300).active = true
        customView.heightAnchor.constraintEqualToConstant(300).active = true
        
//        customView.backgroundColor = .purpleColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        addCustomView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

