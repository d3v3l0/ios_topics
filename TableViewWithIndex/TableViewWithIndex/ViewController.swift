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
        
        let viewDictionary:[String:AnyObject] = [
            "tableView": tableViewController.tableView,
            "topLayoutGuide": topLayoutGuide,
            
            ]
        tableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableViewController.tableView)
        
        let metrics:[String:AnyObject] = [:]
        
        let h0Constraint = "H:|-[tableView]-|"
        let v0Constraint = "V:[topLayoutGuide]-[tableView]-|"
        
        [h0Constraint, v0Constraint].forEach {
            
            let constraint = NSLayoutConstraint.constraintsWithVisualFormat($0, options: [], metrics: metrics, views: viewDictionary)
            
            NSLayoutConstraint.activateConstraints(constraint)
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

