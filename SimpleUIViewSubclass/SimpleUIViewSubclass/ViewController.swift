//
//  ViewController.swift
//  SimpleUIViewSubclass
//
//  Created by Michael Mellinger on 10/7/16.
//

import UIKit

class ViewController: UIViewController {

    private let simpleView = SimpleView()
    
    // MARK: - Build View

    private func buildView() {
        simpleView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(simpleView)
        
        let guide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            simpleView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            simpleView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20),
            simpleView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10),
            simpleView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -10),
            ])

    }
    
    // MARK: - View Management

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "UIView Subclass"

        buildView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

