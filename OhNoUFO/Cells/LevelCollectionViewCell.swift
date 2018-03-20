//
//  LevelCollectionViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/19/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit

class LevelCollectionViewCell : UICollectionViewCell {
    
    var sentinel: UILabel?
    var roundview: UIView?
    var lineview: UIView?
    
    
    
    var level: Level?
    func initalize(){
        makeDetailView()
        
    }
    
    
    func makeDetailView(){
        print("here")
        
        if (lineview == nil) {
            lineview = UIView(frame: CGRect(x: 5, y: 30, width: 90, height: 1))
        }
        self.lineview?.layer.borderWidth = 1
        self.lineview?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        self.contentView.addSubview(lineview!)
        if (roundview == nil) {
            roundview = UIView(frame: CGRect(x: 5, y: 0, width: 90, height: 90))
        }
        self.roundview?.layer.borderWidth = 2
        self.roundview?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        roundview?.layer.cornerRadius = 8.0
        roundview?.clipsToBounds = true
        self.contentView.addSubview(roundview!)
        
        
        
    }
    
}