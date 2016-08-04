//
//  SimpleTableViewController.swift
//  SimpleTableViewController
//
//  Created by Michael Mellinger on 3/8/16.
//  Copyright © 2016 h4labs. All rights reserved.
//

import UIKit

class  SimpleTableViewController: UITableViewController {
    
    let rowData = ["one", "two", "three"]
    let CellIdentifier = "Cell"
    
    override func viewDidLoad() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier:CellIdentifier)
    }
    
}

// Data source delegate

extension SimpleTableViewController {

    // We can skip overriding this function and it will default to 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rowData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = rowData[(indexPath as NSIndexPath).row]
        
        return cell

    }

    //: Optional Header title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }

}
