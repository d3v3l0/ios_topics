//
//  CustomTableViewCell.swift
//  TableViewWithCustomCell
//
//  Created by Michael Mellinger on 5/27/16.
//  Copyright © 2016 Michael Mellinger. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // A regular table cell already has an imageView so rename
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
