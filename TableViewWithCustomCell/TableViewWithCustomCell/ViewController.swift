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
        
        let viewDictionary:[String:AnyObject] = [
            "tableView": tableViewController.tableView,
            
            ]
        tableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableViewController.tableView)
        
        let metrics:[String:AnyObject] = [:]
        
        let h0Constraint = "H:|-[tableView]-|"
        let v0Constraint = "V:|-50-[tableView]-|"
        
        [h0Constraint, v0Constraint].forEach {
            
            let constraint = NSLayoutConstraint.constraints(withVisualFormat: $0, options: [], metrics: metrics, views: viewDictionary)
            
            NSLayoutConstraint.activate(constraint)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

