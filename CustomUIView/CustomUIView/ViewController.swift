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
        
        customView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        let width:CGFloat = 300 // Change me
        customView.widthAnchor.constraint(equalToConstant: width).isActive = true
        customView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
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

