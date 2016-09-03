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
        [widthLabel, heightLabel, stackView].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
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
        // Do any additional setup after loading the view, typically from a nib.
        buildView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if self.view.backgroundColor == UIColor.red {
            self.view.backgroundColor = UIColor.green
        } else {
            self.view.backgroundColor = UIColor.red
        }
        
    }

}
