//
//  SimpleTableViewController.swift
//  SimpleTableViewController
//
//  Created by Michael Mellinger on 3/8/16.
//  Copyright © 2016 h4labs. All rights reserved.
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
    
    var sectionIndex:[String] = []
    var indexDictionary:[String:[String]] = [:]
    
    let CellIdentifier = "Cell"
    // don't presort test data
    let words = ["maple", "apple", "ace", "ant",
                 "banana", "bird",
                 "cat", "corn", "cow",
                 "deer", "dog", "duck",
                 "elk", "elephant", "elm",
                 "fowl", "fruit",
                 "goat",
                 "milk"]
    
    func generateIndex(wordList:[String]) -> ([String], [String:[String]]) {
        
        var indexDictionary:[String:[String]] = [:]
        
        for word in wordList {
            
            let startIndex = word.startIndex
            let firstLetter = "\(word[startIndex])" // Character to String
            
            if let _ = indexDictionary[firstLetter] {
                //var letterWordList:[String] = indexDictionary[firstLetter]!
                //letterWordList.append(word)
                indexDictionary[firstLetter]?.append(word)
                
            } else {
                let letterWordList = [word]
                indexDictionary[firstLetter] = letterWordList
            }
            
//            print(firstLetter)
        }
//        print(indexDictionary)
        
        let keyArray = Array(indexDictionary.keys).sort() // sort
        
//        print(keyArray)
        
        for (key, _) in indexDictionary {
            indexDictionary[key] = indexDictionary[key]?.sort()
            //print("\(key), \(value)")
        }
//        print("Results")
//        print(indexDictionary)
        // sort each array in the dictionary
        return (keyArray, indexDictionary)
    }

    override func viewDidLoad() {
        
        (sectionIndex, indexDictionary) = generateIndex(words)
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier:CellIdentifier)
    }
    
    
}

// Data source delegate

extension SimpleTableViewController {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return sectionIndex.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = sectionIndex[section]
        let anArray = indexDictionary[letter]
        return anArray!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let text:String
        
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier, forIndexPath: indexPath)
        
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

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionIndex[section].uppercaseString
    }

}

