//
//  ViewController.swift
//  SwitchController
//
//  Created by Michael Mellinger on 2/12/17.
//

import UIKit

class ViewController: UIViewController {

    let aSwitch = UISwitch()
    let label = UILabel()
    
    func buildView() {
        
        addSwitch()
        
        // Add Label
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
    }
    
    func addSwitch() {
        
        aSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(aSwitch)
        
        aSwitch.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        aSwitch.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        aSwitch.widthAnchor.constraint(equalToConstant: 150)

        aSwitch.tintColor = .blue
        aSwitch.isOn = true
        label.text = "\(aSwitch.isOn)"
        aSwitch.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        
    }
    
    @objc func switchValueDidChange(_ sender:UISwitch) {
        let value = aSwitch.isOn
        label.text = "\(value)"
    }


}

