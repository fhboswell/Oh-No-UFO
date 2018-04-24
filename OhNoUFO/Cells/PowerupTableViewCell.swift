//
//  PowerupTableViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 4/23/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//



import Foundation

import UIKit

class PowerupTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    //MARK: - instance varriables
    var delegate: PowerupCellDelegate?
    var laserList: [Laser]?
    @IBOutlet var powerupCollectionView: UICollectionView!
    var titleLabel: UILabel?
    
    
    //MARK: - Lifecycle
    func initalize(laserList: [Laser], delegate: PowerupCellDelegate, animationStatus: Bool){
        
        
        self.delegate = delegate
        self.laserList = laserList
        self.powerupCollectionView.reloadData()
        powerupCollectionView.contentInset = UIEdgeInsetsMake(0, 20, 0, 0);
        self.powerupCollectionView.delegate = self
        self.powerupCollectionView.dataSource = self
        self.contentView.backgroundColor = UIColor.clear
        self.powerupCollectionView.backgroundColor = UIColor.clear
        makeTitle()
        
        // Place it on the left of the view with the width = the bounds'width of the view.
        // animate it from the left to the right
        if(animationStatus){
            animateCellIn()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.animateCellOut), name: NSNotification.Name(rawValue: "AnimateOut"), object: nil)
    }
    
    //MARK: - Animation
    func animateCellIn(){
        self.powerupCollectionView.center.x = 700
        self.titleLabel?.center.x = 700
        
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
            self.titleLabel?.center.x = 20 + self.contentView.frame.width / 2
            self.powerupCollectionView.center.x = self.contentView.frame.width / 2
            //self.contentView.layoutIfNeeded()
        }, completion: nil)
    }
    @objc func animateCellOut(){
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
            self.titleLabel?.center.x = 700
            self.powerupCollectionView.center.x = 700
            //self.contentView.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    
    
    //MARK: - Text
    func makeTitle(){
        if titleLabel == nil {
            titleLabel = UILabel(frame: CGRect(x: 550, y: 10, width: self.contentView.frame.width-20, height: 30))
        }
        
        titleLabel?.backgroundColor = .clear
        titleLabel?.textAlignment = .left
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont(name: "neuropol", size: 20)
        titleLabel?.text = "Powerups"
        titleLabel?.layer.shadowColor = UIColor.gray.cgColor
        titleLabel?.layer.shadowRadius = 3.0
        titleLabel?.layer.shadowOpacity = 1.0
        titleLabel?.layer.shadowOffset = CGSize(width: 4, height: 4)
        titleLabel?.layer.masksToBounds = false
        
        self.contentView.addSubview(titleLabel!)
    }
    
    //MARK: - Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return powerupList.count
        //return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = powerupCollectionView.dequeueReusableCell(withReuseIdentifier: "Powerup", for: indexPath) as! PowerupCollectionViewCell
        cell.initalize(powerup: powerupList[indexPath.row], delegate: delegate!, purchased: purchasedPowerups[indexPath.row], unlocked: unlockedPowerups[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            
            delegate.recievePowerupIndex(index: indexPath.row)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    
}
