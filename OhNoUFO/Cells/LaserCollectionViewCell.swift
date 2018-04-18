//
//  LevelCollectionViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/19/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit

class LaserCollectionViewCell : UICollectionViewCell {
    
    var sentinel: UILabel?
    var roundview: UIView?
    var lineview: UIView?
    
    
    
    var level: Laser?
    func initalize(){
        makeDetailView()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(sender:)))
        self.contentView.addGestureRecognizer(tapGestureRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed(sender:)))
        self.contentView.addGestureRecognizer(longPressRecognizer)
        
      
        
    }
    
    @objc func tapped(sender: UITapGestureRecognizer)
    {
        print("tapped")
    }
    
    @objc func longPressed(sender: UILongPressGestureRecognizer)
    {
        print("longpressed")
    }
    
    
    func makeDetailView(){
        print("here")
        
        if (lineview == nil) {
            lineview = UIView(frame: CGRect(x: 5, y: 50, width: 180, height: 1))
        }
        self.lineview?.layer.borderWidth = 1
        self.lineview?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        self.contentView.addSubview(lineview!)
        if (roundview == nil) {
            roundview = UIView(frame: CGRect(x: 5, y: 10, width: 180, height: 180))
        }
        self.roundview?.layer.borderWidth = 2
        self.roundview?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        roundview?.layer.cornerRadius = 8.0
        roundview?.clipsToBounds = true
        self.contentView.addSubview(roundview!)
        
        
        
    }
    
}
