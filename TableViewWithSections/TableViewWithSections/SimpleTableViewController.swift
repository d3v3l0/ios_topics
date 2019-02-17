//
//  SimpleTableViewController.swift
//  SimpleTableViewController
//
//  Created by Michael Mellinger on 3/8/16.
//

/*
 a: ace, ant, apple
 b: banana, bird,
 c: cat, corn, cow
 d: deer, dog, duck
 e: elephant, elk, elm
 f: fowl, fruit
 g: goat
 m: milk, maple
 
 a b c

 // don't presort test data

 let words = ["apple", "ace", "ant",
 "banana", "bird",
 "cat", "corn", "cow",
 "deer", "dog", "duck",
 "elephant", "elk", "elm",
 "fowl", "fruit",
 "goat",
 "milk", "maple"]
 */

import UIKit

class  SimpleTableViewController: UITableViewController {
    
    private var sectionIndex:[String] = []
    private var indexDictionary:[String:[String]] = [:]
    
    private let cellIdentifier = "Cell"
    // don't presort test data
    private let words = ["maple", "apple", "ace", "ant",
                 "banana", "bird",
                 "cat", "corn", "cow",
                 "deer", "dog", "duck",
                 "elk", "elephant", "elm",
                 "fowl", "fruit",
                 "goat",
                 "milk"]
    
    private func generateIndex(_ wordList:[String]) -> ([String], [String:[String]]) {
        
        var indexDictionary:[String:[String]] = [:]
        
        for word in wordList {
            
            let startIndex = word.startIndex
            let firstLetter = "\(word[startIndex])" // Character to String
            
            if let _ = indexDictionary[firstLetter] {
                indexDictionary[firstLetter]?.append(word)
                
            } else {
                let letterWordList = [word]
                indexDictionary[firstLetter] = letterWordList
            }
            
//            print(firstLetter)
        }
//        print(indexDictionary)
        
        let keyArray = Array(indexDictionary.keys).sorted() // sort
        
        for (key, _) in indexDictionary {
            indexDictionary[key] = indexDictionary[key]?.sorted()
            //print("\(key), \(value)")
        }
        // sort each array in the dictionary
        return (keyArray, indexDictionary)
    }

    // MARK: - View Management

    override func viewDidLoad() {
        
        (sectionIndex, indexDictionary) = generateIndex(words)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier:cellIdentifier)
    }
    
    
}

// MARK: - Data source delegate

extension SimpleTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionIndex.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = sectionIndex[section]
        let anArray = indexDictionary[letter]
        return anArray!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let text:String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let letter = sectionIndex[indexPath.section]
        if let anArray = indexDictionary[letter] {
            text = anArray[indexPath.row]
        } else {
            text = ""
        }
        
        // Configure the cell...
        cell.textLabel?.text = text
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionIndex[section].uppercased()
    }

}
