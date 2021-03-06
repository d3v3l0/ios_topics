//
//  ViewController.swift
//  NavSearchBar
//
//  Created by Michael Mellinger on 7/21/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let wordViewController = WordViewController()
    
    // MARK: - Build View
    func buildView() {
        
        wordViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(wordViewController.view)
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            wordViewController.view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            wordViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            wordViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            wordViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            ])
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = wordViewController
        searchController.searchBar.scopeButtonTitles = ["French", "English"]
        searchController.searchBar.delegate = wordViewController
        
        navigationItem.searchController = searchController
        // Make searchbar persistent
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.view.backgroundColor = .purple
        self.title = "NavBar Search"
        setupNavBar()
        buildView()
        
    }
    
}
