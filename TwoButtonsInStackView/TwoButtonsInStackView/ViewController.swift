//
//  ViewController.swift
//  TwoButtonsInStackView
//
//  Created by Michael Mellinger on 10/7/16.
//

/* 
 Buttons are equal size
 StackView is centered horizontally
 StackView 10 points above bottom anchor
 Add some extra padding to button width and height
 */
import UIKit

class ViewController: UIViewController {

    let leftBtn = UIButton()
    let rightBtn = UIButton()
    let buttonStackView = UIStackView()
    
    func buildView() {
        [buttonStackView, leftBtn, rightBtn].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}

        //: StackView
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .equalSpacing
        buttonStackView.alignment = .center
        buttonStackView.spacing = 25 // How far to separate the buttons?
        
        //: Buttons
        leftBtn.setTitle("Left", for: .normal)
        rightBtn.setTitle("Right", for: .normal)
        
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 36)
        
        leftBtn.layer.borderWidth = 1
        rightBtn.layer.borderWidth = 1

        leftBtn.layer.cornerRadius = 15
        // Add some extra padding
        rightBtn.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5)
        
        buttonStackView.addArrangedSubview(leftBtn)
        buttonStackView.addArrangedSubview(rightBtn)
        self.view.addSubview(buttonStackView)
        
        //: Button Layout
        // Simply change multiplier to make button wider
        NSLayoutConstraint.activate([
            leftBtn.widthAnchor.constraint(equalTo: rightBtn.widthAnchor, multiplier: 1),
            leftBtn.heightAnchor.constraint(equalTo: rightBtn.heightAnchor, multiplier: 1),
            ])
        
        //: Stackview Layout
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            // Move stack above the bottom anchor
            buttonStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "Apple News")!
            
        buildView()
    }
}

