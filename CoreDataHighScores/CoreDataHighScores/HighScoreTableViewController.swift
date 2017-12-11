//
//  SimpleTableViewController.swift
//  SimpleTableViewController
//
//  Created by Michael Mellinger on 3/8/16.
//
import UIKit
import CoreData

struct GameType {
    let gameLanguage:Int
    let numBoardRows:Int
    let numBoardCols:Int
    let numberWords:Int
    let actualNumberWords:Int
    let isDirectionEastSouth:Bool
    let isDirectionWestNorth:Bool
    let isDirectionDiagonal:Bool
}

class  HighScoreTableViewController: UITableViewController {
    
    private let CellIdentifier = "Cell"
    private var highScores: [NSManagedObject] = []
    private var gameType:GameType!
    
    func config(gameType:GameType) {
        self.gameType = gameType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(named:"AppleVideosColor")
//        loadData()
        
        let gt = GameType(gameLanguage:1, numBoardRows: 8, numBoardCols: 8, numberWords: 10, actualNumberWords: 10, isDirectionEastSouth: true, isDirectionWestNorth: true, isDirectionDiagonal: true)
//        let gameLanguage = 1
//        let numBoardRows = 8
//        let numBoardCols = 8
//        let numberWords = 10
//        let actualNumberWords = 10
//        let isDirectionEastSouth = true
//        let isDirectionWestNorth = true
//        let isDirectionDiagonal = true
        let highScoreDAO = HighScoreDAO()
        highScores = highScoreDAO.fetchHighScores(gameType: gt)
        
        tableView.rowHeight = 55
        tableView.tableFooterView = UIView() // Remove "empty" table centers in footer
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier:CellIdentifier)
    }
    
}

// Data source delegate
extension HighScoreTableViewController {
    
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
                gameType = GameType(gameLanguage: 1, numBoardRows: numBoardRows, numBoardCols: numBoardCols, numberWords: numberWords, actualNumberWords: actualNumberWords, isDirectionEastSouth: isDirectionEastSouth, isDirectionWestNorth: isDirectionWestNorth, isDirectionDiagonal: isDirectionDiagonal)
            }
        }
        return cell
        
    }
    
    private func timeStr(seconds:Int) -> String {
        
//        let hours = seconds / 3600
        let minutes = seconds / 60 % 60
        let seconds = seconds % 60
//        String(format:"%02i:%02i:%02i", hours, minutes, seconds)
//
        let s = String(format:"%02i:%02i", minutes, seconds)

        return s
    }
}

// Header Cell
extension HighScoreTableViewController {
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
        header.backgroundColor = UIColor(named:"AppleVideosColor")
        
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
        return 80.0
    }
}

// MARK: - Core Data

extension HighScoreTableViewController {
    
}

