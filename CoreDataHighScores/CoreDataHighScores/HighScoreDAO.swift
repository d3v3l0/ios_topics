//
//  HighScoreDAO.swift
//  CoreDataHighScores
//
//  Created by Michael Mellinger on 12/11/17.
//  Copyright © 2017 h4labs. All rights reserved.
//

import UIKit
import CoreData


class HighScoreDAO {
    
    public func fetchBestScore(gameType gt:GameType) -> NSManagedObject? {
        let recs = fetchScores(gameType: gt, numRecords: 1).first
        return recs
    }

    public func fetchHighScores(gameType gt:GameType) -> [NSManagedObject] {
        let recs = fetchScores(gameType: gt, numRecords: 5)
        return recs
    }
    
    private func fetchScores(gameType gt:GameType, numRecords:Int) -> [NSManagedObject] {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "HighScore")
        
        request.predicate = NSPredicate(format: "gameLanguage = \(gt.gameLanguage) and numBoardRows = \(gt.numBoardRows) and numberWords = \(gt.numberWords) and isDirectionEastSouth = \(gt.isDirectionEastSouth) and isDirectionWestNorth = \(gt.isDirectionWestNorth) and isDirectionDiagonal = \(gt.isDirectionDiagonal)")
        
        // Sort by lowest time (seconds)
        let sortDescriptor = NSSortDescriptor(key: "score", ascending: true)
        let sortDescriptors = [sortDescriptor]
        
        request.sortDescriptors = sortDescriptors
        request.fetchLimit = numRecords
        
        let fetchedObjects:[NSManagedObject]
        
        do {
            
            fetchedObjects = try context.fetch(request)
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            fetchedObjects = []
        }
        return fetchedObjects
    }
    
    private func loadData() -> [NSManagedObject] {
        var highScores: [NSManagedObject] = []

        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return highScores
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "HighScore")
        
        do {
            highScores = try managedContext.fetch(fetchRequest)
            print("count=\(highScores.count)")
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        return highScores
    }

    /*
     Score is the time in seconds
     */
    struct HighScoreEntity {
        
        var gameLanguage:Int
        var numBoardRows:Int
        var numBoardCols:Int
        var numberWords:Int
        var actualNumberWords:Int
        var gameTime:Date
        var isDirectionEastSouth:Bool
        var isDirectionWestNorth:Bool
        var isDirectionDiagonal:Bool
        var score:Int

//        var time = 0
        
    }

    func save(numBoardRows:Int, numBoardCols:Int, numberWords:Int, actualNumberWords:Int, isDirectionEastSouth:Bool, isDirectionWestNorth:Bool, isDirectionDiagonal:Bool, gameLanguage: Int, score:Int) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity =
            NSEntityDescription.entity(forEntityName: "HighScore", in: managedContext)!
        
        let highScore = NSManagedObject(entity: entity, insertInto: managedContext)
        
        highScore.setValue(gameLanguage, forKeyPath: "gameLanguage")
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
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}
