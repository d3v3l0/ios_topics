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

        centeredButton.translatesAutoresizingMaskIntoConstraints = false
        centeredButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)

        centeredButton.setTitle("Play", for: UIControl.State())
        centeredButton.setTitleColor(UIColor.black, for: UIControl.State())
        centeredButton.addTarget(self, action: #selector(ViewController.playAudio(_:)), for: .touchUpInside)
        
        self.view.addSubview(centeredButton)
        
        centeredButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centeredButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }
    
    @objc func playAudio(_ sender: UIButton!) {
        playWordAudio(fileName: "robot02")
    }
    
    func playWordAudio(fileName:String) {
        
        /*
         Audio files came from here:
         http://www.metanetsoftware.com/blog/2016/tools-for-gamemaking-music-loops
         */
        let audioUrl = URL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: "mp3")!)
        
        
//        try! AVAudioSession.sharedInstance().setCategory(convertFromAVAudioSessionCategory(AVAudioSession.Category.playback), with: [])
        try! AVAudioSession.sharedInstance().setActive(true)
        
        do {
            try self.audioPlayer = AVAudioPlayer(contentsOf:audioUrl)
            
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.play()
        } catch {
            print("ERROR: Play sound: \(error)")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.0, green: 122.0/255.0, blue: 1.0, alpha: 1.0) // Apple blue
        addButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
