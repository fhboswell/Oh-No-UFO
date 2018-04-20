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
    
    var delegate: LaserCellDelegate?
    
    
    func initalize(laser: Laser, delegate: LaserCellDelegate){
        
        self.delegate = delegate
        
        imageView?.image = nil
        imageView = nil
        
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
        let indexPath :IndexPath = (self.superview as! UICollectionView).indexPath(for: self)!
        delegate?.recieveLevelIndex(index: indexPath.row)
        print(indexPath.row)
    }
    
    @objc func longPressed(sender: UILongPressGestureRecognizer)
    {
        print("longpressed")
    }
    
    
    
    
    func makeDetailView(){
        print("here")
        
       
        if (roundview == nil) {
            roundview = UIView(frame: CGRect(x: 5, y: 10, width: 130, height: 130))
            
            let frameImage = UIImage(named: "Armory_Item_Frame.png")
            let frameImageView = UIImageView(image: frameImage!)
            frameImageView.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
            roundview?.addSubview(frameImageView)
        }
        //self.roundview?.layer.borderWidth = 5
        //self.roundview?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        roundview?.layer.cornerRadius = 8.0
        roundview?.clipsToBounds = true
        roundview?.backgroundColor = UIColor.clear
        if (imageView == nil) {
            imageView = UIImageView(image: laser?.retImage)
        }
       
        imageView?.frame = CGRect(x: 15, y: 0, width: 100, height: 100)
        roundview?.addSubview(imageView!)
        
        
       
       
        
        
//        let gradient = CAGradientLayer()
//
//        gradient.frame = (roundview?.bounds)!
//        gradient.colors = [UIColor.white.cgColor, UIColor.gray.cgColor]
//        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//
//        roundview?.layer.insertSublayer(gradient, at: 0)
        
        self.contentView.addSubview(roundview!)
        
        
        
    }
    
}
