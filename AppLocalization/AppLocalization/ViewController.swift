//
//  ViewController.swift
//  AppLocalization
//
//  Created by Michael Mellinger on 12/1/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let timerLabel = UILabel()

    private func buildView() {
        
        let views = [timerLabel]
        views.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        views.forEach(self.view.addSubview)
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
//            stopButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            stopButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:100),
            ])
        timerLabel.font = UIFont.systemFont(ofSize: 36)
        let greeting = NSLocalizedString("Hello", comment: "")

        timerLabel.text = greeting
        
//        stopButton.setTitle("Stop", for: .normal)
//        stopButton.addTarget(self, action: #selector(stopClock), for: .touchUpInside)
        
    }

    private func findAppLanguage() {
        let localeIdentifier = Locale.current.identifier
        print("Locale: \(localeIdentifier)")
        
        let preferredLanguage = Bundle.main.preferredLocalizations.first!
        print("preferredLanguage: \(preferredLanguage)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "HomeScreenColor")
        findAppLanguage()
        buildView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

