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
        
        let guide = view.safeAreaLayoutGuide
        let margins = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            simpleView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
            simpleView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            simpleView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10),
            simpleView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10),
            ])

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "UIView Subclass"

        buildView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

