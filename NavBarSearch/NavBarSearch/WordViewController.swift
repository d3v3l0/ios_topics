//
//  WordViewController.swift
//  NavSearchBar
//
//  Created by Michael Mellinger on 7/21/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit

class WordViewController: UIViewController {

    private let wordList = ["maple", "apple", "ace", "ant",
                 "banana", "bird",
                 "cat", "corn", "cow",
                 "deer", "dog", "duck",
                 "elk", "elephant", "elm",
                 "fowl", "fruit",
                 "goat",
                 "milk"].sorted()
    
    private var filteredWordList:[String] = []
    private var isFiltered = false
    
    private let CellIdentifier = "Cell"

    private let tableViewController = UITableViewController()
    
    func addTable()  {
        tableViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableViewController.view)
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableViewController.view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            tableViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            ])

        self.tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier:CellIdentifier)

        tableViewController.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        addTable()
    }


}

extension WordViewController: UITableViewDelegate {

}

extension WordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let n:Int
        switch isFiltered {
        case true:
            n = filteredWordList.count
        case false:
            n = wordList.count
        }
        return n
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        cell.backgroundColor = .white
        
        // Configure the cell...
        let word:String
        switch isFiltered {
        case true:
           word = filteredWordList[indexPath.row]
        case false:
            word = wordList[indexPath.row]
        }
        cell.textLabel?.text = word
        cell.detailTextLabel?.text = "word"

        return cell

    }
    
}

// MARK: - UISearchResultsUpdating

/*
 Called every time a letter is pressed
 */
extension WordViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
//                print("Searching...")
        if let searchText = searchController.searchBar.text?.lowercased() {
            if !searchText.isEmpty {

                print("Searching: \(searchText)")
                isFiltered = true
                /*
                 If we are using the scope bar, get the index and filter accordingly
                 */
                //let searchOption = searchController.searchBar.selectedScopeButtonIndex
                
                filteredWordList = wordList.filter({$0.contains(searchText)})
            } else {
                print("Not Searching")
                isFiltered = false
            }
            self.tableViewController.tableView.reloadData()

        }
        
    }
}

// MARK: - UISearchBarDelegate

extension WordViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
        if let searchText = searchBar.text {
            print("Scoped changed: \(searchText)")
            filteredWordList = wordList.filter({$0.contains(searchText)})
        }
    }
}

