//
//  ViewController.swift
//  CoreDataHighScores
//
//  Created by Michael Mellinger on 11/25/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit
import CoreData

//struct HighScore {
//    var name = ""
//    var time = 0
//
//}
class ViewController: UIViewController {

    private var highScores: [NSManagedObject] = []
    private let tableViewController = SimpleTableViewController()

    func addTableView() {
        
        tableViewController.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableViewController.tableView)
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableViewController.tableView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
            tableViewController.tableView.bottomAnchor.constraintEqualToSystemSpacingBelow(view.bottomAnchor, multiplier: 1.0),
            tableViewController.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            tableViewController.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        save(numBoardRows: 8, numBoardCols: 8, numberWords: 10, actualNumberWords: 10, isDirectionEastSouth: true, isDirectionWestNorth: false, isDirectionDiagonal: false, score: 10)
        save(numBoardRows: 8, numBoardCols: 8, numberWords: 10, actualNumberWords: 10, isDirectionEastSouth: true, isDirectionWestNorth: false, isDirectionDiagonal: false, score: 100)
        save(numBoardRows: 8, numBoardCols: 8, numberWords: 10, actualNumberWords: 10, isDirectionEastSouth: true, isDirectionWestNorth: true, isDirectionDiagonal: false, score: 20)

        addTableView()
    }

    private func loadData() {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "HighScore")
        
        do {
            highScores = try managedContext.fetch(fetchRequest)
            print("count=\(highScores.count)")
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "HighScore")
        
        do {
            highScores = try managedContext.fetch(fetchRequest)
            print("count=\(highScores.count)")

            for s in highScores {

                if let numBoardRows = s.value(forKey: "numBoardRows") as! Int?,
                    let numBoardCols = s.value(forKey: "numBoardCols"),
                    let numberWords = s.value(forKey: "numberWords"),
                    let actualNumberWords = s.value(forKey: "actualNumberWords"),
                    let isDirectionEastSouth = s.value(forKey: "isDirectionEastSouth"),
                    let isDirectionWestNorth = s.value(forKey: "isDirectionWestNorth"),
                    let isDirectionDiagonal = s.value(forKey: "isDirectionDiagonal"),
                    let score = s.value(forKey: "score"),
                    let gameTime = s.value(forKey: "gameTime") {
                    print("Result:\(numBoardRows)x\(numBoardCols), \(numberWords), \(actualNumberWords), \(isDirectionEastSouth), \(isDirectionWestNorth),\(isDirectionDiagonal),  \(gameTime), \(score)")
                }
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    /*
     Score is the time in seconds
     */
    func save(numBoardRows:Int, numBoardCols:Int, numberWords:Int, actualNumberWords:Int, isDirectionEastSouth:Bool, isDirectionWestNorth:Bool, isDirectionDiagonal:Bool, score:Int) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "HighScore",
                                       in: managedContext)!
        
        let highScore = NSManagedObject(entity: entity,
                                     insertInto: managedContext)
        
        highScore.setValue(numBoardRows, forKeyPath: "numBoardRows")
        highScore.setValue(numBoardCols, forKeyPath: "numBoardCols")
        highScore.setValue(numberWords, forKeyPath: "numberWords")
        highScore.setValue(actualNumberWords, forKeyPath: "actualNumberWords")
        highScore.setValue(score, forKeyPath: "score")
        highScore.setValue(Date(), forKeyPath: "gameTime")
        highScore.setValue(isDirectionEastSouth, forKeyPath: "isDirectionEastSouth")
        highScore.setValue(isDirectionWestNorth, forKeyPath: "isDirectionWestNorth")
        highScore.setValue(isDirectionDiagonal, forKeyPath: "isDirectionDiagonal")

        do {
            try managedContext.save()
            highScores.append(highScore)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}
