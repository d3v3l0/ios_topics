//
//  ViewController.swift
//  GradientView
//
//  Created by Michael Mellinger on 9/4/16.
//

import UIKit

class ViewController: UIViewController {

    func buildView() {
        let v = GradientView(frame: self.view.bounds)
        self.view.addSubview(v)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        buildView()
        
    }

}

