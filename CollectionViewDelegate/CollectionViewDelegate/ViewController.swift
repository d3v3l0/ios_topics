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
        
        let viewDictionary:[String:AnyObject] = [
            "collectionView": collectionViewController.view,
            "topLayoutGuide": topLayoutGuide,
            ]
        collectionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(collectionViewController.view)
        
        let metrics:[String:AnyObject] = [:]
        
        ["H:|-1-[collectionView]-1-|",
         "V:[topLayoutGuide]-[collectionView]-|"].forEach {
            
            let constraint = NSLayoutConstraint.constraints(withVisualFormat: $0, options: [], metrics: metrics, views: viewDictionary)
            
            NSLayoutConstraint.activate(constraint)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.purple
//        let flowLayout=UICollectionViewFlowLayout()
//        flowLayout.itemSize = CGSizeMake(100, 100)
//        flowLayout.minimumInteritemSpacing = 2
//        flowLayout.minimumLineSpacing = 5
//        flowLayout.scrollDirection = .Vertical
//        
//        // Must create with a FlowLayout if we create UICollectionViewController programatically
//        
//        collectionViewController = BasicCollectionViewController(collectionViewLayout: flowLayout)
        
        addCollectionView()
        
    }
}

