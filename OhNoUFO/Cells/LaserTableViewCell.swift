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
    
    
    
    var delegate: LaserCellDelegate?
    var levelList: [Laser]?
    @IBOutlet var laserCollectionView: UICollectionView!
    var titleLabel: UILabel?
    
    
    func initalize(levelList: [Laser], delegate: LaserCellDelegate, animationStatus: Bool){

        self.delegate = delegate
        self.levelList = levelList
        laserCollectionView.contentInset = UIEdgeInsetsMake(0, 45, 0, 0);
        self.laserCollectionView.delegate = self
        self.laserCollectionView.dataSource = self
        self.contentView.backgroundColor = UIColor.black
        self.laserCollectionView.backgroundColor = UIColor.black
        makeTitle()
        
        // Place it on the left of the view with the width = the bounds'width of the view.
        // animate it from the left to the right
        if(animationStatus){
            animateCellIn()
        }
    }
    
  
    func animateCellIn(){
        self.laserCollectionView.center.x += 500
        UIView.animate(withDuration: 1, delay: 0.4, options: [.curveEaseOut], animations: {
            self.titleLabel?.center.x -= 500
            self.laserCollectionView.center.x -= 500
            //self.contentView.layoutIfNeeded()
        }, completion: nil)
    }
    func animateCellOut(){
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
            self.titleLabel?.center.x -= 500
            //self.roundView?.center.x -= 500
            //self.contentView.layoutIfNeeded()
        }, completion: nil)
    }
    
    
    
    
    
    func makeTitle(){
        if titleLabel == nil {
            titleLabel = UILabel(frame: CGRect(x: 550, y: 10, width: self.contentView.frame.width-20, height: 30))
        }
        
        titleLabel?.backgroundColor = .clear
        titleLabel?.textAlignment = .left
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        titleLabel?.text = "Laser Upgrades"
        self.contentView.addSubview(titleLabel!)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levelList!.count
        //return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = laserCollectionView.dequeueReusableCell(withReuseIdentifier: "Level", for: indexPath) as! LaserCollectionViewCell
        cell.initalize()
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
