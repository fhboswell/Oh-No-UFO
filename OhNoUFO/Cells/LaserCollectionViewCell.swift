//
//  LevelCollectionViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/19/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit

class LaserCollectionViewCell : UICollectionViewCell {
    
    
    //MARK: - instance varriables
    var sentinel: UILabel?
    var roundview: UIView?
    var lineview: UIView?
    var imageView: UIImageView?
    var laser: Laser?
    var delegate: LaserCellDelegate?
    
    var priceLabel: UILabel?
    var unlocked: Bool?
    

    //MARK: - lifecycle
    func initalize(laser: Laser, delegate: LaserCellDelegate, unlocked: Bool){
        self.delegate = delegate
        imageView?.image = nil
        imageView = nil
        priceLabel?.text = ""
        self.unlocked = unlocked
        
        self.laser = laser
        makeDetailView()
        makePriceLabel()
        makeRetImageView()
        
        addGestureRecognizer()
    }
    
    func makePriceLabel(){
        
        if priceLabel == nil {
            priceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 130, height: 50))
            roundview?.addSubview(priceLabel!)
        }
        
        priceLabel?.backgroundColor = .clear
        priceLabel?.textAlignment = .center
        priceLabel?.textColor = .white
        if(!unlocked!){
            priceLabel?.text = String(laser!.cost)
        }else{
            priceLabel?.text = ""
        }
        priceLabel?.font = UIFont(name: "neuropol", size: 20)
        
        
        
    }
    
    //MARK: - touch events
    
    func addGestureRecognizer() {
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

    //MARK: UI elemaents
    func makeDetailView(){
        if (roundview == nil) {
            roundview = UIView(frame: CGRect(x: 5, y: 10, width: 130, height: 130))
            
            let frameImage = UIImage(named: "Armory_Item_Frame.png")
            let frameImageView = UIImageView(image: frameImage!)
            frameImageView.frame = CGRect(x: 0, y: 0, width: 130, height: 130)
            roundview?.addSubview(frameImageView)
        }
        roundview?.layer.cornerRadius = 8.0
        roundview?.clipsToBounds = true
        roundview?.backgroundColor = UIColor.clear
       
       
        self.contentView.addSubview(roundview!)
    }
    func makeRetImageView(){
        if (imageView == nil) {
            imageView = UIImageView(image: laser?.retImage)
        }
        if(unlocked)!{
            imageView?.frame = CGRect(x: 5, y: 5, width: 120, height: 120)
            imageView?.alpha = 1
        }else{
            imageView?.frame = CGRect(x: 15, y: 20, width: 100, height: 100)
            imageView?.alpha = 0.3
        }
        
        roundview?.addSubview(imageView!)
    }
    
}
