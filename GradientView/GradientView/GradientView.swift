//
//  GradientView.swift
//  GradientView
//
//  Created by Michael Mellinger on 9/4/16.
//

import UIKit

class GradientView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = UIColor.purple // Also, set solid color in init()
        
        let layer = CAGradientLayer()
        
        layer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor, UIColor.green.cgColor]
        layer.frame = self.bounds // full view
        self.layer.addSublayer(layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
