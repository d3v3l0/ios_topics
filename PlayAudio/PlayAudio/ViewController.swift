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

        centeredButton.setTitle("Play", for: UIControlState())
        centeredButton.setTitleColor(UIColor.blue, for: UIControlState())
        centeredButton.translatesAutoresizingMaskIntoConstraints = false
        centeredButton.addTarget(self, action: #selector(ViewController.playAudio(_:)), for: .touchUpInside)
        
        self.view.addSubview(centeredButton)
        
        centeredButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centeredButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    func playAudio(_ sender: UIButton!) {
        playWordAudio("robot02")
    }
    
    func playWordAudio(_ aWord:String) {
        
        /*
         Audio files came from here:
         http://www.metanetsoftware.com/blog/2016/tools-for-gamemaking-music-loops
         */
        let audioUrl = URL(fileURLWithPath: Bundle.main.path(forResource: aWord, ofType: "mp3")!)
        
        
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: [])
        try! AVAudioSession.sharedInstance().setActive(true)
        
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOf:audioUrl)
            
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

