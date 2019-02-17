//
//  ViewController.swift
//  SwitchController
//
//  Created by Michael Mellinger on 2/12/17.
//

import UIKit

class ViewController: UIViewController {

    private let aSwitch = UISwitch()
    private let label = UILabel()
    
    // MARK: - Build View

    private func addSwitch() {
        
        aSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(aSwitch)
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            aSwitch.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            aSwitch.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            aSwitch.widthAnchor.constraint(equalToConstant: 150),
            ])
        
        aSwitch.tintColor = .blue
        aSwitch.isOn = true
        label.text = "\(aSwitch.isOn)"
        aSwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        
    }
    
    
    @objc private func switchValueDidChange(_ sender:UISwitch) {
        let value = aSwitch.isOn
        label.text = "\(value)"
    }
    
    
    private func buildView() {
        
        addSwitch()
        
        // Add Label        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
        ])
        
    }
    
    // MARK: - View Management

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        buildView()
    }
    

}

