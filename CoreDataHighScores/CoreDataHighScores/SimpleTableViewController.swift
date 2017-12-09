//
//  SimpleTableViewController.swift
//  SimpleTableViewController
//
//  Created by Michael Mellinger on 3/8/16.
//
import UIKit
import CoreData

struct GameType {
    let numBoardRows:Int
    let numBoardCols:Int
    let numberWords:Int
    let actualNumberWords:Int
    let isDirectionEastSouth:Bool
    let isDirectionWestNorth:Bool
    let isDirectionDiagonal:Bool
}

class  SimpleTableViewController: UITableViewController {
    
//    let rowData = ["one", "two", "three"]
    private let CellIdentifier = "Cell"
    private var highScores: [NSManagedObject] = []
    private var gameType:GameType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red: 90/255.0, green: 200.0/255.0, blue: 250.0/255, alpha: 1.0) // Apple Videos
        loadData()
        tableView.rowHeight = 80
        tableView.tableFooterView = UIView() // Remove "empty" table centers in footer
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier:CellIdentifier)
    }
    
}

extension SimpleTableViewController {
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
    
}


// Data source delegate
extension SimpleTableViewController {
    
    // We can skip overriding this function and it will default to 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return highScores.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! CustomTableViewCell
        cell.backgroundColor = UIColor(red: 90/255.0, green: 120.0/255.0, blue: 250.0/255, alpha: 1.0)
        // Configure the cell...
        
        let s = highScores[indexPath.row]
        
        if let numBoardRows = s.value(forKey: "numBoardRows") as! Int? ,
            let numBoardCols = s.value(forKey: "numBoardCols") as! Int?,
            let numberWords = s.value(forKey: "numberWords") as! Int?,
            let actualNumberWords = s.value(forKey: "actualNumberWords") as! Int?,
            let isDirectionEastSouth = s.value(forKey: "isDirectionEastSouth") as! Bool?,
            let isDirectionWestNorth = s.value(forKey: "isDirectionWestNorth") as! Bool?,
            let isDirectionDiagonal = s.value(forKey: "isDirectionDiagonal") as! Bool?,
            let score = s.value(forKey: "score") as! Int?,
            let gameTime = s.value(forKey: "gameTime") as! Date? {
            
            let dateFmt = DateFormatter()
            dateFmt.timeZone = NSTimeZone.default
            dateFmt.dateFormat =  "yyyy-MM-dd"
            let dateString = dateFmt.string(from: gameTime)

//            let text  = "\(dateString), \(score)"
            cell.label1.text = "\(dateString)"
            cell.label2.text = "\(timeStr(seconds: score))"
            if gameType == nil {
                gameType = GameType(numBoardRows: numBoardRows, numBoardCols: numBoardCols, numberWords: numberWords, actualNumberWords: actualNumberWords, isDirectionEastSouth: isDirectionEastSouth, isDirectionWestNorth: isDirectionWestNorth, isDirectionDiagonal: isDirectionDiagonal)
            }
        }
        return cell
        
    }
    
    private func timeStr(seconds:Int) -> String {
        
        let hours = Int(seconds) / 3600
        let minutes = Int(seconds) / 60 % 60
        let seconds = Int(seconds) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}

// Header Cell
extension SimpleTableViewController {
    //: Optional Header title
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let title:String
//        if gameType != nil {
//            title = "High Scores:\(gameType.numBoardRows)x\(gameType.numBoardCols), Words:\(gameType.numberWords), (\(gameType.actualNumberWords)), \(highScores.count)"
//        } else {
//            title = "none"
//        }
//        return title
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //        let header = UIView()
        let header = HighScoreHeaderCell()
        
        //        header.frame = CGRect(x: 0, y: 0, width: 120, height: 150)
        header.backgroundColor = UIColor(named:"AppleVideosColor") //UIColor(red: 90/255.0, green: 200.0/255.0, blue: 250.0/255, alpha: 1.0) // Apple Videos
        
        let title = "\(gameType.numBoardRows)x\(gameType.numBoardCols)"
        let title2 = "\(gameType.numberWords) (\(gameType.actualNumberWords))"
        header.boardSizeLabel.text = title
        header.numWordsLabel.text = title2
        header.languagelLabel.text = "🇬🇧"
        
        return header
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = .orange
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
}
