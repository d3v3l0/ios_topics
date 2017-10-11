//
//  ViewController.swift
//  PickerViewDemo
//
//

import UIKit

class ViewController: UIViewController {

    private let pickerDataSource = ["10", "20", "50", "100", "500"]
    private let pickerMap = [10, 20, 50, 100, 500]
    
    private let languagePickerView = UIPickerView()
    private let resultLabel = UILabel()
    
    func buildView() {
        self.view.backgroundColor = .purple
        
        languagePickerView.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
                
        languagePickerView.dataSource = self
        languagePickerView.delegate = self
        
        self.view.addSubview(languagePickerView)
        self.view.addSubview(resultLabel)

        languagePickerView.backgroundColor = .white
        resultLabel.backgroundColor = .white
        resultLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            languagePickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            languagePickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: languagePickerView.bottomAnchor, constant: 50),
            resultLabel.widthAnchor.constraint(equalToConstant: 100),
            ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildView()
        resultLabel.text = "\(pickerMap[0])"

    }

}

extension ViewController: UIPickerViewDataSource,  UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        let i = pickerMap[row]
        print(i)
        resultLabel.text = "\(pickerMap[row])"

    }

}
