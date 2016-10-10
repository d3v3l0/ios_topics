//
//  ViewController.swift
//  SimpleTableView
//
//  Created by Michael Mellinger on 3/8/16.
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
            
            let constraint = NSLayoutConstraint.constraints(withVisualFormat: $0, options: [], metrics: metrics, views: viewDictionary)
            
            NSLayoutConstraint.activate(constraint)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 90/255.0, green: 200.0/255.0, blue: 250.0/255, alpha: 1.0) // Apple Videos

        addTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

