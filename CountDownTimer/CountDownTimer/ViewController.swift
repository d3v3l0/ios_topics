//
//  ViewController.swift
//  CountDownTimer
//
//  Created by Michael Mellinger on 10/9/16.
//

import UIKit

class ViewController: UIViewController {

    let timerLabel = UILabel()
    var secondsRemaining = 5
    var isTimerRunning = true
    var timer:Timer!
    
    
    func startTimer() {
        timer = Timer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
        secondsRemaining -= 1
        
        if secondsRemaining == 0 {
            isTimerRunning = false
            timer.invalidate()
            timerLabel.text = "Done"
        } else {
            timerLabel.text = "\(secondsRemaining)"
        }
    }
    
    func buildView() {
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(timerLabel)
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            ])
        timerLabel.font = UIFont.systemFont(ofSize: 36)
        timerLabel.text = "\(secondsRemaining)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 90/255.0, green: 200.0/255.0, blue: 250.0/255, alpha: 1.0) // Apple Videos
        buildView()
        
        startTimer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

