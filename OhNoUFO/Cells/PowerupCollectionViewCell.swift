//
//  PowerupCollectionViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 4/23/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//



import UIKit

class PowerupCollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - instance varriables
    var sentinel: UILabel?
    var roundview: UIView?
    var lineview: UIView?
    var imageView: UIImageView?
    var powerup: Powerup?
    var delegate: PowerupCellDelegate?
    
    var priceLabel: UILabel?
    var purchased: Bool?
    var unlocked: Bool?
    
    
    //MARK: - lifecycle
    func initalize(powerup: Powerup, delegate: PowerupCellDelegate, purchased: Bool, unlocked: Bool){
        self.delegate = delegate
        imageView?.image = nil
        imageView = nil
        priceLabel?.text = ""
        
        self.purchased = purchased
        self.unlocked = unlocked
        
        self.powerup = powerup
        makeDetailView()
        
        if(unlocked){
            makePriceLabel()
            makeRetImageView()
        }else{
            makeLockedView()
        }
        
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
        if(!purchased!){
            priceLabel?.text = String(powerup!.cost)
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
        delegate?.recievePowerupIndex(index: indexPath.row)
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
            imageView = UIImageView(image: powerup?.retImage)
            roundview?.addSubview(imageView!)
        }
        if(purchased)!{
            imageView?.frame = CGRect(x: 5, y: 5, width: 120, height: 120)
            imageView?.alpha = 1
        }else{
            imageView?.frame = CGRect(x: 15, y: 20, width: 100, height: 100)
            imageView?.alpha = 0.3
        }
        
        
    }
    func makeLockedView(){
        if (imageView == nil) {
            imageView = UIImageView(image: UIImage(named: "locked.png"))
            roundview?.addSubview(imageView!)
        }
        
        imageView?.frame = CGRect(x: 0, y: 0, width: 140, height: 120)
        imageView?.alpha = 1
        
        
        
    }
    
}
