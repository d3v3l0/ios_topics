//
//  ViewController.swift
//  CollectionViewDelegate
//
//  Created by Michael Mellinger on 5/25/16.
//

import UIKit

class ViewController: UIViewController {

    var collectionViewController = BasicCollectionViewController()
    
    func addCollectionView() {
      
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionViewController.view)
        
        let guide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
        collectionViewController.view.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
            collectionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            collectionViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Collection Delegate"

        addCollectionView()
        
    }
}

