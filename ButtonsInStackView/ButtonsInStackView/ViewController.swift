//
//  ViewController.swift
//  ButtonsInStackView
//
//  Created by Michael Mellinger on 5/31/16.
//

import UIKit

class ViewController: UIViewController {

    private let button1 = UIButton()
    private let button2 = UIButton()
    private let button3 = UIButton()
    private let button4 = UIButton()
    private let label = UILabel()
    

    @objc private func buttonAction(_ button: UIButton) {
        
        let tag = button.tag
        label.text = "\(tag)"
    }
    
    // MARK: - Build View

    private func customizeButtons() {
        
        // Button 1
        button1.setTitle("cornerRadius = 10", for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button1.backgroundColor = .blue
        button1.layer.cornerRadius = 10
        
        button1.setTitleColor(UIColor.white, for: .normal)
        button1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        // Button 2
        button2.setTitle("Border", for: .normal)
        button2.backgroundColor = .gray
        button2.layer.borderWidth = 3
        button2.layer.borderColor = UIColor.black.cgColor
        button2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        
        // Button 3
        button3.backgroundColor = .gray
        button3.setTitle("Custom Font", for: .normal)
        button3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        let fontSize:CGFloat = 20
        let aFontName = "American Typewriter"
        
        if let aFont = UIFont(name: aFontName, size: fontSize) {
            button3.titleLabel?.font = aFont
        }

        // Button 4
        button4.backgroundColor = .gray
        button4.setTitle("Image", for: .normal)
        button4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        let imageName = "star"
        if let image = UIImage(named: imageName) {
            button4.setImage(image, for: .normal)
        }
    }
    
    
    private func createLabel() {
        
        let fontSize:CGFloat = 24
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.text = "0"
        view.addSubview(label)
    }
    
    
    private func buildView() {
        let allButtons = [button1, button2, button3, button4]
        
        var i = 1
        allButtons.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.tag = i
            i += 1
            view.addSubview($0)
        }
        
        customizeButtons()
        createLabel()
        
        let stackView = UIStackView(arrangedSubviews: allButtons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10 // Space between buttons
        view.addSubview(stackView)
        
        // Center vertically, iOS9 style
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20),
            
            // Label
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0),
            ])

    }
    
    // MARK: - View Management

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "AppleBookColor")
        buildView()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

