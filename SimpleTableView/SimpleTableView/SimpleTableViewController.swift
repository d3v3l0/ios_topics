//
//  SimpleTableViewController.swift
//  SimpleTableViewController
//
//  Created by Michael Mellinger on 3/8/16.
//

import UIKit

class  SimpleTableViewController: UITableViewController {
    
    let rowData = ["one", "two", "three"]
    let CellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = UIColor(red: 90/255.0, green: 200.0/255.0, blue: 250.0/255, alpha: 1.0) // Apple Videos
        
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView() // Remove "empty" table centers in footer
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier:CellIdentifier)
    }
    
}

// Data source delegate

extension SimpleTableViewController {

    // We can skip overriding this function and it will default to 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rowData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor(red: 90/255.0, green: 120.0/255.0, blue: 250.0/255, alpha: 1.0)
        // Configure the cell...
        cell.textLabel?.text = rowData[indexPath.row]
        
        return cell

    }
}

// Header Cell

extension SimpleTableViewController {
    //: Optional Header title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = .orange
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
}
