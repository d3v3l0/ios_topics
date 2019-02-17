//
//  ViewController.swift
//  GradientView
//
//  Created by Michael Mellinger on 9/4/16.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Build View

    private func buildView() {
        let v = GradientView(frame: view.bounds)
        view.addSubview(v)
    }
    
    // MARK: - View Management

    override func viewDidLoad() {
        super.viewDidLoad()

        buildView()
        
    }

}

