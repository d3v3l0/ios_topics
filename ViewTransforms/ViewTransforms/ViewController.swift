//
//  ViewController.swift
//  ViewTransforms
//
//  Created by Michael Mellinger on 12/16/16.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let aBtn  = UIButton()
    let aView = UIView()
    
    func buildView() {
        
        aView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(aView)
        aView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        aView.backgroundColor = .brown
        aView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100).isActive = true
        aView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        aView.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
        //
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        label.text = "foo"
        
        //
        aBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(aBtn)
        aBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        aBtn.setTitle("Transform", for: .normal)
        aBtn.layer.borderWidth = 1
        
        aBtn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        aBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true
        aBtn.addTarget(self, action: #selector(scaleIt(sender:)), for: .touchUpInside)
    }
    
    @objc func scaleIt(sender:UIButton) {
        //
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                        
                        var transform = CGAffineTransform.identity
                        transform = transform.scaledBy(x: 4, y: 4)
                        self.label.transform = transform
                        self.aView.transform = CGAffineTransform(scaleX: 6, y: 6)
        }, completion: {_ in
            self.rotateIt()
        })
    }
    
    func rotateIt() {
        //
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                        
                        let transform = CGAffineTransform.identity.rotated(by: .pi)
                        
                        self.label.transform = CGAffineTransform(rotationAngle: .pi)
                        
                        self.aView.transform = transform
        }, completion: {_ in
            
            self.fadeIt()
        })
    }
    
    
    func fadeIt() {
        
        UIView.animate(withDuration: 2,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: {
                        
                        self.aView.alpha = 0
                        
        }, completion: {_ in
            
            UIView.animate(withDuration: 2,
                           delay: 0,
                           options: .curveEaseInOut,
                           animations: {
                            
                            self.aView.alpha = 1
            }, completion: {_ in
                
            })
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
        buildView()
        
    }
    
}

