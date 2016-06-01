//
//  ViewController.swift
//  PlayAudio
//
//  Created by Michael Mellinger on 6/1/16.

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let centeredButton = UIButton()
    
    var audioPlayer:AVAudioPlayer!
    
    func addButton() {

        centeredButton.setTitle("Play", forState: .Normal)
        centeredButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        centeredButton.translatesAutoresizingMaskIntoConstraints = false
        centeredButton.addTarget(self, action: #selector(ViewController.playAudio(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(centeredButton)
        
        let viewDictionary:Dictionary = ["centeredButton": centeredButton]
        
        let horizontal:[NSLayoutConstraint]! = NSLayoutConstraint.constraintsWithVisualFormat("H:|-50-[centeredButton]-50-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        
        let vertical:[NSLayoutConstraint]! = NSLayoutConstraint.constraintsWithVisualFormat("V:|-100-[centeredButton]-100-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        self.view.addConstraints(horizontal)
        self.view.addConstraints(vertical)
        
    }
    
    func playAudio(sender: UIButton!) {
        playWordAudio("robot02")
    }
    
    func playWordAudio(aWord:String) {
        
        /*
         Audio files came from here:
         http://www.metanetsoftware.com/blog/2016/tools-for-gamemaking-music-loops
         */
        let audioUrl = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(aWord, ofType: "mp3")!)
        
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, withOptions: [])
        try! AVAudioSession.sharedInstance().setActive(true)
        
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOfURL:audioUrl)
            
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.play()
        } catch {
            print("ERROR: Play sound: \(error)")
        }
        //        } else {
        //            print("Sound file not found: \(aWord)")
        //        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

