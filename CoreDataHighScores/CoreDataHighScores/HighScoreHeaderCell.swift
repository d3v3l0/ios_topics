//
//  HighScoreHeaderCell.swift
//  CoreDataHighScores
//
//  Created by Michael Mellinger on 12/7/17.
//  Copyright © 2017 h4labs. All rights reserved.
//


import UIKit

class HighScoreHeaderCell: UIView {
    
    public var boardSizeLabel = UILabel()
    public var numWordsLabel = UILabel()
    public var languagelLabel = UILabel()
    public var isDirectionEastSouth = true
    public var isDirectionWestNorth = false
    public var isDirectionDiagonal = false
    
    private var bestTimesLabel = UILabel()

    private var image1:UIImageView = UIImageView()
    private var image2:UIImageView = UIImageView()
    private var image3:UIImageView = UIImageView()

    private func _setup() {
        let views = [bestTimesLabel, languagelLabel, boardSizeLabel, numWordsLabel]
        
        views.forEach {$0.translatesAutoresizingMaskIntoConstraints = false; $0.textAlignment = .center}
        views.forEach(self.addSubview)
        
        bestTimesLabel.text = "Best Times"
        
        let images = [image1, image2, image3]
        images.forEach {$0.translatesAutoresizingMaskIntoConstraints = false}

        images.forEach(self.addSubview)

        image1.image = UIImage(named:"dir_right_down_on")
        image2.image = UIImage(named:"dir_left_up_on")
        image3.image = UIImage(named:"dir_diag_on")

        images.forEach {$0.layer.borderWidth = 1; $0.layer.cornerRadius = 10}
        
        let highlightColor = UIColor(named:"ButtonHighlightColor")
        image1.backgroundColor = isDirectionEastSouth ? highlightColor : .white
        image2.backgroundColor = isDirectionWestNorth ? highlightColor : .white
        image3.backgroundColor = isDirectionDiagonal ? highlightColor : .white
        
        //        let myInsets : UIEdgeInsets = UIEdgeInsetsMake(40, 40, 40, 40)

//        image2.image = image2.image?.resizableImage(withCapInsets: myInsets)
//        image3.image = image3.image?.resizableImage(withCapInsets: myInsets)

        let centerYOffset:CGFloat = 10
        
        NSLayoutConstraint.activate([
            bestTimesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            bestTimesLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            bestTimesLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),

//            numWordsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            image1.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),

            boardSizeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            numWordsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
//            image1.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),

            image1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4),
            image2.leftAnchor.constraint(equalTo: image1.rightAnchor, constant: 4),
            image3.leftAnchor.constraint(equalTo: image2.rightAnchor, constant: 4),

            boardSizeLabel.leftAnchor.constraint(equalTo: image3.rightAnchor, constant: 4),
            numWordsLabel.leftAnchor.constraint(equalTo: boardSizeLabel.rightAnchor, constant: 4),
            languagelLabel.leftAnchor.constraint(equalTo: numWordsLabel.rightAnchor, constant: 4),

//            boardSizeLabel.rightAnchor.constraint(equalTo: image3.rightAnchor, constant: 4),
//            numWordsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 4),
            languagelLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 4),

//            boardSizeLabel.widthAnchor.constraint(equalToConstant: 50),
//            languagelLabel.widthAnchor.constraint(equalToConstant: 50),

            boardSizeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: centerYOffset),
            numWordsLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: centerYOffset),
            languagelLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: centerYOffset),
            
            image1.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: centerYOffset),
            image2.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: centerYOffset),
            image3.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: centerYOffset),
            
            image1.widthAnchor.constraint(equalToConstant: 50),
            image2.widthAnchor.constraint(equalToConstant: 50),
            image3.widthAnchor.constraint(equalToConstant: 50),
            numWordsLabel.widthAnchor.constraint(equalTo: boardSizeLabel.widthAnchor, multiplier: 1),
            languagelLabel.widthAnchor.constraint(equalTo: boardSizeLabel.widthAnchor, multiplier: 0.75),

            ])
//        boardSizeLabel.textAlignment = .center
//        numWordsLabel.textAlignment = .center
//        languagelLabel.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    override func layoutSubviews() {
    //
    //    }
}
