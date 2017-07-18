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
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 30)
//        flowLayout.scrollDirection = .horizontal // Default: .vertical
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            ])
        
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
