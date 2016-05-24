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
            
            let constraint = NSLayoutConstraint.constraintsWithVisualFormat($0, options: [], metrics: metrics, views: viewDictionary)
            
            NSLayoutConstraint.activateConstraints(constraint)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let flowLayout=UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSizeMake(100, 100)
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.minimumLineSpacing = 5
        flowLayout.scrollDirection = .Vertical

        // Must create with a FlowLayout if we create UICollectionView programatically
        
        collectionViewController = BasicCollectionViewController(collectionViewLayout: flowLayout)
        
        addCollectionView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

