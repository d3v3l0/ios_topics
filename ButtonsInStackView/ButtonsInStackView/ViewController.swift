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
    

    func buttonAction(_ button: UIButton) {
        
        let tag = button.tag
        label.text = "\(tag)"
    }
    
    func customizeButtons() {
        
        // Button 1
        button1.setTitle("cornerRadius = 10", for: UIControlState())
        button1.backgroundColor = UIColor.blue
        button1.layer.cornerRadius = 10
        button1.setTitleColor(UIColor.orange, for: UIControlState())
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        // Button 2
        button2.setTitle("Border", for: UIControlState())
        button2.backgroundColor = UIColor.gray
        button2.layer.borderWidth = 3
        button2.layer.borderColor = UIColor.black.cgColor
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        // Button 3
        
        
        button3.backgroundColor = UIColor.gray
        button3.setTitle("Custom Font", for: UIControlState())
        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        let fontSize:CGFloat = 20
        let aFontName = "American Typewriter"
        
        if let aFont:UIFont = UIFont(name: aFontName, size: fontSize) {
            
            button3.titleLabel?.font = aFont
        }

        // Button 4
        button4.backgroundColor = UIColor.gray
        button4.setTitle("Image", for: UIControlState())
        button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        let imageName = "star"
        if let image = UIImage(named: imageName) {
            button4.setImage(image, for: UIControlState())
        }
    }
    
    func createLabel() {
        
        let fontSize:CGFloat = 24
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: fontSize)
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

        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10 // Space between buttons
        view.addSubview(stackView)

        let margins = view.layoutMarginsGuide
        
        // Center verticall, iOS9 style
//        stackView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        
        // Label
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor,                                                    constant: 50.0).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

