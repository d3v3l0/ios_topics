//
//  BasicViewController.swift
//  CollectionViewDelegate
//
//  Created by Michael Mellinger on 5/26/16.
//

import UIKit

class BasicCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    var collectionView:UICollectionView!

    private let reuseIdentifier = "Cell"

//    required init?(coder aDecoder: NSCoder) {
//        fatalError("NSCoding not supported")
//        //        super.init(coder: aDecoder)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()

        let flowLayout=UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.minimumLineSpacing = 2
        
        collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        
        let viewDictionary:[String:AnyObject] = [
            "collectionView": collectionView,
            "topLayoutGuide": topLayoutGuide,
            ]
        let metrics:[String:AnyObject] = [:]

        ["H:|-0-[collectionView]-0-|",
         "V:|-[collectionView]-|"].forEach {
            
            let constraint = NSLayoutConstraint.constraintsWithVisualFormat($0, options: [], metrics: metrics, views: viewDictionary)
            
            NSLayoutConstraint.activateConstraints(constraint)
    }
    
        collectionView.backgroundColor = UIColor.grayColor()
        // Register cell classes
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: UICollectionViewDataSource

extension BasicCollectionViewController {
    
     func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
}

// MARK: UICollectionViewDelegate

extension BasicCollectionViewController {

     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        // Configure the cell
        let aColor = indexPath.row % 2 == 0 ? UIColor.orangeColor() : UIColor.greenColor()
        cell.backgroundColor = aColor
        
        return cell
    }

}
