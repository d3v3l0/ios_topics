//
//  CustomHeaderCell.swift
//  CustomTableViewHeaderCell
//
//  Created by Michael Mellinger on 11/27/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit

class CustomTableViewHeaderCell: UIView {
    
    public var label1 = UILabel()
    public var label2 = UILabel()
    
    private func _setup() {
        let views = [label1, label2]
        views.forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        views.forEach(self.addSubview)
        
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
        label1.textAlignment = .center
        label2.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//
//    }
}
