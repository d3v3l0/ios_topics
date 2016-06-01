//
//  ViewController.swift
//  ButtonsInStackView
//
//  Created by Michael Mellinger on 5/31/16.
//

import UIKit

class ViewController: UIViewController {

    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let label = UILabel()
    

    func buttonAction(button: UIButton) {
        
        let tag = button.tag
        label.text = "\(tag)"
    }
    
    func customizeButtons() {
        
        // Button 1
        button1.setTitle("cornerRadius = 10", forState: .Normal)
        button1.backgroundColor = UIColor.blueColor()
        button1.layer.cornerRadius = 10
        button1.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        button1.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        
        // Button 2
        button2.setTitle("Border", forState: .Normal)
        button2.backgroundColor = UIColor.grayColor()
        button2.layer.borderWidth = 3
        button2.layer.borderColor = UIColor.blackColor().CGColor
        button2.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        
        
        // Button 3
        
        
        button3.backgroundColor = UIColor.grayColor()
        button3.setTitle("Custom Font", forState: .Normal)
        button3.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        let fontSize:CGFloat = 20
        let aFontName = "American Typewriter"
        
        if let aFont:UIFont = UIFont(name: aFontName, size: fontSize) {
            
            button3.titleLabel?.font = aFont
        }

        // Button 4
        button4.backgroundColor = UIColor.grayColor()
        button4.setTitle("Image", forState: .Normal)
        button4.addTarget(self, action: #selector(buttonAction), forControlEvents: .TouchUpInside)
        let imageName = "star"
        if let image = UIImage(named: imageName) {
            button4.setImage(image, forState: .Normal)
        }
    }
    
    func createLabel() {
        
        let fontSize:CGFloat = 24
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFontOfSize(fontSize)
        label.text = "0"
        view.addSubview(label)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let allButtons = [button1, button2, button3, button4]
        
        var i = 1
        allButtons.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.tag = i
            i += 1
            self.view.addSubview($0)
        }

        customizeButtons()
        createLabel()
     
        let stackView = UIStackView(arrangedSubviews: allButtons)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .Vertical
        stackView.alignment = .Fill
        stackView.spacing = 10 // Space between buttons
        view.addSubview(stackView)

        let margins = view.layoutMarginsGuide
        
        // Center verticall, iOS9 style
//        stackView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        stackView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        stackView.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor, constant: 20).active = true
        stackView.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor, constant: -20).active = true
        
        // Label
        label.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        label.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor,                                                    constant: 50.0).active = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

