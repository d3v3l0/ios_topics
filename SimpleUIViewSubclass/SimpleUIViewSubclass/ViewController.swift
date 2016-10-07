//
//  ViewController.swift
//  SimpleUIViewSubclass
//
//  Created by Michael Mellinger on 10/7/16.
//

import UIKit

class ViewController: UIViewController {

    let simpleView = SimpleView()
    
    func buildView() {
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(simpleView)

        let margins = view.layoutMarginsGuide

        simpleView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
        simpleView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10).isActive = true
        simpleView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        simpleView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -10).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        buildView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

