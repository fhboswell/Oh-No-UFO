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
    
    
    func initalize(levelList: [Laser], delegate: LaserCellDelegate){

        self.delegate = delegate
        self.levelList = levelList
        laserCollectionView.contentInset = UIEdgeInsetsMake(2, 42, 2, 0);
        self.laserCollectionView.delegate = self
        self.laserCollectionView.dataSource = self
        self.contentView.backgroundColor = UIColor.black
        self.laserCollectionView.backgroundColor = UIColor.black
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
        return CGSize(width: 100, height: 100)
    }
    
    
}
