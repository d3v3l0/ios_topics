//
//  ViewController.swift
//  CollectionViewDelegate
//
//  Created by Michael Mellinger on 5/25/16.
//

import UIKit

class ViewController: UIViewController {

    private var collectionViewController = BasicCollectionViewController()
    
    // MARK: - Build View

    private func addCollectionView() {
      
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionViewController.view)
        
        let guide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            collectionViewController.view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            collectionViewController.view.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            collectionViewController.view.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 5),
            collectionViewController.view.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -5),
            ])
    }
    
    // MARK: - View Management

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Collection Delegate"

        addCollectionView()
    }
}

