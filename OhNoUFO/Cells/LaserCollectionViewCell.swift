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
    var imageView: UIImageView?
    
    
    
    var laser: Laser?
    func initalize(laser: Laser){
        self.laser = laser
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
        
       
        if (roundview == nil) {
            roundview = UIView(frame: CGRect(x: 5, y: 10, width: 130, height: 130))
        }
        self.roundview?.layer.borderWidth = 2
        self.roundview?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        roundview?.layer.cornerRadius = 8.0
        roundview?.clipsToBounds = true
        roundview?.backgroundColor = UIColor.white
        if (imageView == nil) {
            imageView = UIImageView(image: laser?.retImage)
        }
       
        imageView?.frame = CGRect(x: 15, y: 30, width: 100, height: 100)
        roundview?.addSubview(imageView!)
        if (lineview == nil) {
            lineview = UIView(frame: CGRect(x: 5, y: 30, width: 130, height: 1))
        }
        self.lineview?.layer.borderWidth = 3
        self.lineview?.layer.borderColor = UIColor.green.cgColor
        roundview?.addSubview(lineview!)
        self.contentView.addSubview(roundview!)
        
        
        
    }
    
}
