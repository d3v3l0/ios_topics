//
//  ViewController.swift
//  GameClock
//
//  Created by Michael Mellinger on 11/24/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let timerLabel = UILabel()
    private let stopButton = UIButton()
    private var isRunning = true
    
    private var gameClock = GameClock()
    
    private func buildView() {
        
        let views = [timerLabel,stopButton]
        views.forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        views.forEach(self.view.addSubview)
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            stopButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stopButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant:100),
            ])
        timerLabel.font = UIFont.systemFont(ofSize: 36)
        timerLabel.text = "00:00"
        
        stopButton.setTitle("Stop", for: .normal)
        stopButton.addTarget(self, action: #selector(stopClock), for: .touchUpInside)
        
    }
    
    @objc func stopClock() {
        switch isRunning {
        case true:
            isRunning = false
            gameClock.pauseClock()
            stopButton.setTitle("Restart", for: .normal)

        case false:
            isRunning = true
            gameClock.resetClock()
            gameClock.startClock()
            stopButton.setTitle("Stop", for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 90/255.0, green: 200.0/255.0, blue: 250.0/255, alpha: 1.0) // Apple Videos
        buildView()
        gameClock.setLabel(label: timerLabel)
        gameClock.startClock()
    }

}

