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
        
        let width:CGFloat = 300 // Change me
        NSLayoutConstraint.activate([
            
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            customView.widthAnchor.constraint(equalToConstant: width),
            customView.heightAnchor.constraint(equalToConstant: width),
            ])
//        customView.backgroundColor = .purpleColor()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        addCustomView()
    }

}

