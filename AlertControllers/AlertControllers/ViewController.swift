//
//  ViewController.swift
//  AlertControllers
//
//  Created by Michael Mellinger on 6/1/16.
//

import UIKit

class ViewController: UIViewController {

    private let button1 = UIButton()
    private let label1 = UILabel()
    
    // MARK: - Build View

    private func addLabel() {
        view.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "Click the Alert button"
        label1.textColor = .gray
        
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            ])

    }
    
    
    private func addButton() {
        view.addSubview(button1)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Alert", for: UIControl.State())
        button1.addTarget(self, action: #selector(ViewController.showGameOverAlert(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            ])

    }
    
    
    @objc private func showGameOverAlert(_ button: UIButton) {

        let alertController = UIAlertController(title: "Game Over", message: "Play again?", preferredStyle: .alert)
        
        // Using closure handler
        let action1 = UIAlertAction(title: "Yes", style: .default) { (action) -> Void in
            self.label1.text = "Starting new game."
        }
        
        // Calling function handler
        let action2 = UIAlertAction(title: "No", style: .default, handler: noHandler(_:))
        
        [action1, action2].forEach(alertController.addAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    private func noHandler(_ action: UIAlertAction) {
        label1.text = "That's all folks!"
    }
    
    // MARK: - View Management

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        addButton()
        addLabel()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

