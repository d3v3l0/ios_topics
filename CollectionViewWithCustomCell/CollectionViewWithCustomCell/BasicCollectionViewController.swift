//
//  BasicCollectionViewController.swift
//  CollectionViewBasic
//
//  Created by Michael Mellinger on 5/24/16.
//

import UIKit


class BasicCollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        self.collectionView!.register(UINib(nibName:"CustomCollectionViewCell",
            bundle:Bundle.main),
                                        forCellWithReuseIdentifier:reuseIdentifier)
        
    }

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 40
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell:CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
    
        // Configure the cell
        let aColor:UIColor
        let iconName:String
            
        if indexPath.row % 2 == 0 {
            aColor = .orange
            iconName = "fr_icon"
        } else {
            aColor = .green
            iconName = "it_icon"
        }
        cell.backgroundColor = aColor
        if let image = UIImage(named: iconName) {
            cell.imageView.contentMode = .scaleAspectFit  // Can set in Interface Builder
//            cell.imageView.contentMode = .Center
            cell.imageView.image = image

        }
        return cell
    }
}
