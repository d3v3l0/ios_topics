//
//  ViewController.swift
//  StackViewsInStackViews
//
//  Created by Michael Mellinger on 8/31/16.
//

import UIKit

class ViewController: UIViewController {

    let mainStackView = UIStackView()
    let buttonStackView = UIStackView()
    
    let largeBox = UIView()
    let smallBox = UIView()
    
    func addButtons()  {
        //: Left Button
        let leftButton = UIButton()
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.setTitle("Left", for: .normal)

        //: Right Button
        let rightButton = UIButton()
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.setTitle("Right", for: .normal)
        
        buttonStackView.addArrangedSubview(leftButton)
        buttonStackView.addArrangedSubview(rightButton)
        buttonStackView.backgroundColor = UIColor.lightGray
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purple
        
        addButtons()
        
        [largeBox, smallBox, mainStackView, buttonStackView].forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
        })

        // Add everything to stackview then constrain
        mainStackView.addArrangedSubview(largeBox)
        mainStackView.addArrangedSubview(smallBox)
        mainStackView.addArrangedSubview(buttonStackView)

        largeBox.backgroundColor = UIColor.red
        largeBox.layer.borderWidth = 5
        largeBox.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        largeBox.heightAnchor.constraint(equalTo: mainStackView.heightAnchor,                                                    multiplier: 0.5).isActive = true

//        largeBox.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        smallBox.backgroundColor = UIColor.blue
        smallBox.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
//        smallBox.heightAnchor.constraint(equalToConstant: 50).isActive = true
        smallBox.heightAnchor.constraint(equalTo: mainStackView.heightAnchor,                                                    multiplier: 0.2).isActive = true
     
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 8
        mainStackView.alignment = .center
//        mainStackView.distribution = .equalSpacing
        mainStackView.backgroundColor = UIColor.orange
        
        

        self.view.addSubview(mainStackView)
        
        let margins = self.view.layoutMarginsGuide
        
//        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

