//
//  ViewController.swift
//  SimpleTableView
//
//  Created by Michael Mellinger on 3/8/16.
//  Copyright © 2016 h4labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableViewController = SimpleTableViewController()
    
    func addTableView() {

        tableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableViewController.tableView)
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableViewController.tableView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
            tableViewController.tableView.bottomAnchor.constraintEqualToSystemSpacingBelow(view.bottomAnchor, multiplier: 1.0),

            tableViewController.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            tableViewController.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "TableView/Custom Cell"
        addTableView()
    }

}

