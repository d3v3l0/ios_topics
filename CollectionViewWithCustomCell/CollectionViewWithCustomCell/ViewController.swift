//
//  ViewController.swift
//  CollectionViewBasic
//
//  Created by Michael Mellinger on 5/24/16.
//

import UIKit

class ViewController: UIViewController {

    private var collectionViewController:BasicCollectionViewController!
    
    // MARK: - Build View

    private func addCollectionView() {
        
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionViewController.view)
        
        let guide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
        collectionViewController.view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            collectionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            collectionViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            ])

    }
    
    // MARK: - View Management

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.purple
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "UICollectionViewCell"

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.minimumLineSpacing = 5
        flowLayout.scrollDirection = .vertical

        // Must create with a FlowLayout if we create UICollectionViewController programatically
        
        collectionViewController = BasicCollectionViewController(collectionViewLayout: flowLayout)
        
        addCollectionView()

    }

}

