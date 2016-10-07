//
//  SimpleView.swift
//  SimpleUIViewSubclass
//
//  Created by Michael Mellinger on 10/7/16.
//

import UIKit

class SimpleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
