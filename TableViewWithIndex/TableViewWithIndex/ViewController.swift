//
//  ViewController.swift
//  TableViewWithIndex
//
//  Created by Michael Mellinger on 3/9/16.
//

import UIKit

class ViewController: UIViewController {

    let tableViewController = SimpleTableViewController()
    
    func addTableView() {
        
        tableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableViewController.tableView)
        let guide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            
            tableViewController.tableView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            tableViewController.tableView.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1.0),
            tableViewController.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            tableViewController.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
        self.title = "Table Subclass/Index"
        self.view.backgroundColor = .gray
        
        addTableView()
    }

}

