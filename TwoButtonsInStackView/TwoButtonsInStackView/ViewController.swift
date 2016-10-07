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
 
 */
import UIKit

class ViewController: UIViewController {

    let leftBtn = UIButton()
    let rightBtn = UIButton()
    let buttonStackView = UIStackView()
    
    func buildView() {
        [buttonStackView, leftBtn, rightBtn].forEach({$0.translatesAutoresizingMaskIntoConstraints = false})

        //: StackView
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .equalSpacing
        buttonStackView.alignment = .center
        buttonStackView.spacing = 25 // How far to separate the buttons?
        
        //: Buttons
        leftBtn.setTitle("Left", for: .normal)
        rightBtn.setTitle("Right", for: .normal)
        
        leftBtn.layer.borderWidth = 1
        rightBtn.layer.borderWidth = 1
        
        buttonStackView.addArrangedSubview(leftBtn)
        buttonStackView.addArrangedSubview(rightBtn)
        self.view.addSubview(buttonStackView)
        
        //: Button Layout
        // Simply change multiplier to make button wider
        leftBtn.widthAnchor.constraint(equalTo: rightBtn.widthAnchor, multiplier: 1).isActive = true
        
        //: Stackview Layout
        let margins = view.layoutMarginsGuide
        buttonStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        // Move stack above the bottom anchor
        buttonStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGray

        buildView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

