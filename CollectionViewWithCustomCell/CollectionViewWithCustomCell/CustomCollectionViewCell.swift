//
//  CustomCollectionViewCell.swift
//  CollectionViewWithCustomCell
//
//  Created by Michael Mellinger on 5/26/16.
//  Copyright © 2016 Michael Mellinger. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet var imageView:UIImageView!
    @IBOutlet weak var wordLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(frame: CGRect) {
        
        super.init(frame:frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
