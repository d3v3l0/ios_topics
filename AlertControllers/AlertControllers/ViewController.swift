//
//  ViewController.swift
//  AlertControllers
//
//  Created by Michael Mellinger on 6/1/16.
//

import UIKit

class ViewController: UIViewController {

    let button1 = UIButton()
    let label1 = UILabel()
    
    func addLabel() {
        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "Click the Alert button"
        label1.textColor = UIColor.gray
        label1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40).isActive = true

    }
    
    func addButton() {
        view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Alert", for: UIControl.State())
        button1.addTarget(self, action: #selector(ViewController.showGameOverAlert(_:)), for: .touchUpInside)
        
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
        
    }
    
    @objc func showGameOverAlert(_ button: UIButton) {

        let alertController = UIAlertController(title: "Game Over", message: "Play again?", preferredStyle: .alert)
        
        // Using closure handler
        let action1 = UIAlertAction(title: "Yes", style: .default) { (action) -> Void in
            self.label1.text = "Starting new game."
        }
        
        // Calling function handler
        let action2 = UIAlertAction(title: "No", style: .default, handler: noHandler(_:))
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func noHandler(_ action: UIAlertAction) {
        label1.text = "That's all folks!"

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.purple
        addButton()
        addLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

