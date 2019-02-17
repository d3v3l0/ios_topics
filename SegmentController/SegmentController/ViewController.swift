//
//  ViewController.swift
//  SegmentController
//
//  Created by Michael Mellinger on 2/7/17.
//

import UIKit

class ViewController: UIViewController {

    private let segmentedControl = UISegmentedControl()
    private let label = UILabel()
    
    // MARK: - Actions
    
    @objc private func segmentValueDidChange(_ sender:UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        let language = sender.titleForSegment(at: value)!
        label.text = "\(value), \(language)"
    }
    

    // MARK: - Build View

    func buildView() {
        [segmentedControl, label].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        [segmentedControl, label].forEach(view.addSubview)

        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            segmentedControl.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: guide.centerYAnchor, constant: -100),
            //        segmentedControl.widthAnchor.constraint(equalToConstant: 150)
            
            label.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            
            ])        
    }

    // MARK: - View Management

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        buildView()
        
        segmentedControl.tintColor = .blue
        segmentedControl.insertSegment(withTitle: "Spanish", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "French", at: 1, animated: true)
        segmentedControl.insertSegment(withTitle: "English", at: 2, animated: true)
        
        segmentedControl.selectedSegmentIndex = 0 // Default selection

        segmentedControl.addTarget(self, action: #selector(segmentValueDidChange(_:)), for: .valueChanged)
    }

}

