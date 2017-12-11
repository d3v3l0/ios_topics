//
//  CustomTableViewCell.swift
//  CoreDataHighScores
//
//  Created by Michael Mellinger on 11/27/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit

class HighScoreTableViewCell: UITableViewCell {
    
    // A regular table cell already has an imageView so rename
//    @IBOutlet weak var imageView1: UIImageView!
    
    public let label1 = UILabel()
    public let label2 = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let views = [label1, label2]
        views.forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        views.forEach(self.addSubview)
//        label1.backgroundColor = .purple
        label1.textAlignment = .center
        label2.textAlignment = .right
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            label2.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            
            label1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            label2.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            label1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4),
            label2.leftAnchor.constraint(equalTo: label1.rightAnchor, constant: 4),
            label2.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -120),
            label2.widthAnchor.constraint(equalTo: label1.widthAnchor, multiplier: 0.5),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
