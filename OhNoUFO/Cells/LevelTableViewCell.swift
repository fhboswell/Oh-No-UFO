//
//  LevelTableViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/19/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation

import UIKit

class LevelTableViewCell : UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    
    var delegate: LevelCellDelegate?
    var levelList: [Level]?
    @IBOutlet var levelCollectionView: UICollectionView!
    
    
    func initalize(levelList: [Level], delegate: LevelCellDelegate){

        self.delegate = delegate
        self.levelList = levelList
        levelCollectionView.contentInset = UIEdgeInsetsMake(2, 2, 2, 0);
        self.levelCollectionView.delegate = self
        self.levelCollectionView.dataSource = self
        self.contentView.backgroundColor = UIColor.black
        self.levelCollectionView.backgroundColor = UIColor.black
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levelList!.count
        //return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = levelCollectionView.dequeueReusableCell(withReuseIdentifier: "Level", for: indexPath) as! LevelCollectionViewCell
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
