//
//  ViewController.swift
//  AppRotation
//
//  Created by Michael Mellinger on 9/3/16.
//

import UIKit

class ViewController: UIViewController {

    let widthLabel = UILabel()
    let heightLabel = UILabel()
    let stackView = UIStackView()
    
    func buildView() {
        [widthLabel, heightLabel, stackView].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})
        
//        [widthLabel,heightLabel].forEach(stackView.addArrangedSubview)
        stackView.addArrangedSubview(widthLabel)
        stackView.addArrangedSubview(heightLabel)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        widthLabel.text = "0"
        heightLabel.text = "Rotate screen"
        
        self.view.addSubview(stackView)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        buildView()
    }

}

extension ViewController {

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        print("\(self) \(#function)")
        //        let transitionToWide = size.width > size.height
        let w = size.width
        let h = size.height
        
        print("\nToSize: \(w), \(h)\n")
        self.view.backgroundColor = self.view.backgroundColor == .red ? UIColor.green : UIColor.red
    }
}
