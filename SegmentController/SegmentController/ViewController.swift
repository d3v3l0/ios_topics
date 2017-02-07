//
//  ViewController.swift
//  SegmentController
//
//  Created by Michael Mellinger on 2/7/17.
//

import UIKit

class ViewController: UIViewController {

    let segmentedControl = UISegmentedControl()
    let label = UILabel()
    
    func buildView() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(segmentedControl)
        
        
        segmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 150)
        
        //
        let margins = self.view.layoutMarginsGuide
        
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        label.topAnchor.constraint(equalTo: margins.topAnchor, constant: 100).isActive = true
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        buildView()
        
        segmentedControl.tintColor = .blue
        segmentedControl.insertSegment(withTitle: "Spanish", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "English", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "French", at: 1, animated: true)
        
        segmentedControl.addTarget(self, action: #selector(segmentValueDidChange(_:)), for: .valueChanged)
    }

    func segmentValueDidChange(_ sender:UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        let language = sender.titleForSegment(at: value)!
        label.text = "\(value), \(language)"
    }

}

