//
//  BasicViewController.swift
//  CollectionViewDelegate
//
//  Created by Michael Mellinger on 5/26/16.
//

import UIKit

class BasicCollectionViewController: UIViewController {

    private var collectionView:UICollectionView!

    fileprivate let reuseIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 2
        flowLayout.minimumLineSpacing = 2
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        
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
         "V:|[topLayoutGuide]-[collectionView]-|"].forEach {
            
            let constraint = NSLayoutConstraint.constraints(withVisualFormat: $0, options: [], metrics: metrics, views: viewDictionary)
            
            NSLayoutConstraint.activate(constraint)
    }
    
        collectionView.backgroundColor = UIColor.gray
        // Register cell classes
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }
    
}

// MARK: - UICollectionViewDataSource

extension BasicCollectionViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 150
    }
}

// MARK: - UICollectionViewDelegate

extension BasicCollectionViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        // Configure the cell
        let aColor = indexPath.row % 2 == 0 ? UIColor.orange : UIColor.green
        cell.backgroundColor = aColor
        
        return cell
    }

}
