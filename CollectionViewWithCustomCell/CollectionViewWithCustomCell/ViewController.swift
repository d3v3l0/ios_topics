//
//  ViewController.swift
//  CollectionViewBasic
//
//  Created by Michael Mellinger on 5/24/16.
//

import UIKit

class ViewController: UIViewController {

    var collectionViewController:BasicCollectionViewController!
    
    func addCollectionView() {
        
        let viewDictionary:[String:AnyObject] = [
            "collectionView": collectionViewController.view,
            "topLayoutGuide": topLayoutGuide,
            
            ]
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionViewController.view)
        
        let metrics:[String:AnyObject] = [:]
        
        let h0Constraint = "H:|-[collectionView]-|"
        let v0Constraint = "V:[topLayoutGuide]-[collectionView]-|"
        
        [h0Constraint, v0Constraint].forEach {
            
            let constraint = NSLayoutConstraint.constraints(withVisualFormat: $0, options: [], metrics: metrics, views: viewDictionary)
            
            NSLayoutConstraint.activate(constraint)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        
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

