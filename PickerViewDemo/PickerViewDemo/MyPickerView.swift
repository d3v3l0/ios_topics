//
//  MyPickerView.swift
//  PickerViewDemo
//
import UIKit

class MyPickerView: NSObject, UIPickerViewDataSource,  UIPickerViewDelegate {
    
    let pickerDataSource = ["10", "20", "50", "100", "500"]
    let pickerMap = [10, 20, 50, 100, 500]
    
    // MARK: - PickerView Datasource
    
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
    }
    
}



