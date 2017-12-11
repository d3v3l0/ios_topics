//
//  ViewController.swift
//  CoreDataHighScores
//
//  Created by Michael Mellinger on 11/25/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    private var highScores: [NSManagedObject] = []
    private let tableViewController = HighScoreTableViewController()

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
    
    func addRandomGameScore() {
        
        let isDirectionEastSouth = arc4random_uniform(2) == 1 ? true : false // 0 or 1
        let isDirectionWestNorth = arc4random_uniform(2) == 1 ? true : false // 0 or 1
        let isDirectionDiagonal = arc4random_uniform(2) == 1 ? true : false // 0 or 1
        let gameLanguage = 1
        
        let highScoreDAO = HighScoreDAO()
        
        highScoreDAO.save(numBoardRows: 8, numBoardCols: 8, numberWords: 10, actualNumberWords: 10, isDirectionEastSouth: isDirectionEastSouth, isDirectionWestNorth: isDirectionWestNorth, isDirectionDiagonal: isDirectionDiagonal, gameLanguage: gameLanguage, score: 10)
        highScoreDAO.save(numBoardRows: 8, numBoardCols: 8, numberWords: 10, actualNumberWords: 10, isDirectionEastSouth: true, isDirectionWestNorth: isDirectionWestNorth, isDirectionDiagonal: isDirectionDiagonal, gameLanguage: gameLanguage, score: 100)
        highScoreDAO.save(numBoardRows: 8, numBoardCols: 8, numberWords: 10, actualNumberWords: 10, isDirectionEastSouth: true, isDirectionWestNorth: isDirectionWestNorth, isDirectionDiagonal: isDirectionDiagonal, gameLanguage: gameLanguage, score: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomGameScore()

        addTableView()
        let gt = GameType(gameLanguage:1, numBoardRows: 8, numBoardCols: 8, numberWords: 10, actualNumberWords: 10, isDirectionEastSouth: true, isDirectionWestNorth: true, isDirectionDiagonal: false)

        tableViewController.config(gameType: gt)
        
        let highScoreDAO = HighScoreDAO()

        let bestScore = highScoreDAO.fetchBestScore(gameType: gt)
        if let score = bestScore?.value(forKey: "score") as! Int? {

            print("bestScore: \(score)")
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    
//    func fetchHighScores(gameLanguage:Int, numBoardRows:Int, numBoardCols:Int, numberWords:Int, actualNumberWords:Int, isDirectionEastSouth:Bool, isDirectionWestNorth:Bool, isDirectionDiagonal:Bool ) {
//
//        let appDelegate =
//            UIApplication.shared.delegate as! AppDelegate
//        let context =
//            appDelegate.persistentContainer.viewContext
//
//        let request =
//            NSFetchRequest<NSManagedObject>(entityName: "HighScore")
//
//        request.predicate = NSPredicate(format: "gameLanguage = \(gameLanguage) and numBoardRows = \(numBoardRows) and numBoardCols = \(numBoardCols)")
//
//        do {
//
//            let fetchedObjects = try context.fetch(request)
//
//            let scores = fetchedObjects
//            print("HS #: \(scores.count)")
//
//            for score in scores {
//
//                print("HS: \(score)")
//            }
//
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
//
//    }
    
//    private func loadData() {
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//
//        let fetchRequest =
//            NSFetchRequest<NSManagedObject>(entityName: "HighScore")
//
//        do {
//            highScores = try managedContext.fetch(fetchRequest)
//            print("count=\(highScores.count)")
//
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//    }
    
//    func loadAllScores() {
//        guard let appDelegate =
//            UIApplication.shared.delegate as? AppDelegate else {
//                return
//        }
//
//        let managedContext =
//            appDelegate.persistentContainer.viewContext
//
//        let fetchRequest =
//            NSFetchRequest<NSManagedObject>(entityName: "HighScore")
//
//        do {
//            highScores = try managedContext.fetch(fetchRequest)
//            print("count=\(highScores.count)")
//
//            for s in highScores {
//
//                if let numBoardRows = s.value(forKey: "numBoardRows") as! Int?,
//                    let numBoardCols = s.value(forKey: "numBoardCols"),
//                    let numberWords = s.value(forKey: "numberWords"),
//                    let actualNumberWords = s.value(forKey: "actualNumberWords"),
//                    let isDirectionEastSouth = s.value(forKey: "isDirectionEastSouth"),
//                    let isDirectionWestNorth = s.value(forKey: "isDirectionWestNorth"),
//                    let isDirectionDiagonal = s.value(forKey: "isDirectionDiagonal"),
//                    let gameLanguage = s.value(forKey: "gameLanguage"),
//
//                    let score = s.value(forKey: "score"),
//                    let gameTime = s.value(forKey: "gameTime") {
//                    print("Result:L=\(gameLanguage), \(numBoardRows)x\(numBoardCols), \(numberWords), \(actualNumberWords), \(isDirectionEastSouth), \(isDirectionWestNorth),\(isDirectionDiagonal),  \(gameTime), \(score)")
//                }
//            }
//        } catch let error as NSError {
//            print("Could not fetch. \(error), \(error.userInfo)")
//        }
//
//    }


}
