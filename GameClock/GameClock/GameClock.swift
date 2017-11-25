//
//  GameClock.swift
//  GameClock
//
//  Created by Michael Mellinger on 11/24/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit

class GameClock {
    // MARK: - private
    var gameTime = 0 // Want to allow pausing?
    private var startTimeInterval = Date()
    var timeLabel:UILabel!
    private var timer:Timer!
    private let dateFormatter = DateFormatter()
    
    public func setLabel(label:UILabel) {
        self.timeLabel = label
    }
    
    public func startClock() {
        timer = Timer()
        startTimeInterval = Date()
        dateFormatter.dateFormat = "h:mm:ss a"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        gameTime += 1
        let timeInterval = Date().timeIntervalSince(startTimeInterval)
        if timeLabel != nil {
            let s = timeString(time: timeInterval)
            timeLabel.text = "\(s)"
        }

    }
    
    public func pauseClock() {
        
        timer.invalidate()

    }
    
    public func resetClock() {
        gameTime = 0
        startTimeInterval = Date()

        timer.invalidate()
    }
    
    private func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        let s = String(format:"%02i:%02i",minutes,Int(seconds))
        return s
    }
}
