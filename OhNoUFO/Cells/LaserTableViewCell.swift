//
//  LevelTableViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/19/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation

import UIKit

class LaserTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    //MARK: - instance varriables
    var delegate: LaserCellDelegate?
    var laserList: [Laser]?
    @IBOutlet var laserCollectionView: UICollectionView!
    var titleLabel: UILabel?
    
    
    //MARK: - Lifecycle
    func initalize(laserList: [Laser], delegate: LaserCellDelegate, animationStatus: Bool){

        
        self.delegate = delegate
        self.laserList = laserList
        self.laserCollectionView.reloadData()
        laserCollectionView.contentInset = UIEdgeInsetsMake(0, 20, 0, 0);
        self.laserCollectionView.delegate = self
        self.laserCollectionView.dataSource = self
        self.contentView.backgroundColor = UIColor.clear
        self.laserCollectionView.backgroundColor = UIColor.clear
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
        self.laserCollectionView.center.x = 700
        self.titleLabel?.center.x = 700
        
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
            self.titleLabel?.center.x = 20 + self.contentView.frame.width / 2
            self.laserCollectionView.center.x = self.contentView.frame.width / 2
            //self.contentView.layoutIfNeeded()
        }, completion: nil)
    }
    @objc func animateCellOut(){
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
            self.titleLabel?.center.x = 700
            self.laserCollectionView.center.x = 700
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
        titleLabel?.text = "Laser Upgrades"
        titleLabel?.layer.shadowColor = UIColor.gray.cgColor
        titleLabel?.layer.shadowRadius = 3.0
        titleLabel?.layer.shadowOpacity = 1.0
        titleLabel?.layer.shadowOffset = CGSize(width: 4, height: 4)
        titleLabel?.layer.masksToBounds = false
        
        self.contentView.addSubview(titleLabel!)
    }
    
    //MARK: - Collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return laserList!.count
        //return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = laserCollectionView.dequeueReusableCell(withReuseIdentifier: "Level", for: indexPath) as! LaserCollectionViewCell
        cell.initalize(laser: laserList![indexPath.row], delegate: delegate!, purchased: purchasedLasers[indexPath.row], unlocked: unlockedLasers[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let delegate = self.delegate {
            
            delegate.recieveLevelIndex(index: indexPath.row)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    
}
