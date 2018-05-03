//
//  EquippedTableViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 4/22/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
//
//  ReportTableViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 4/17/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit

class EquippedTableViewCell: UITableViewCell {
    
    //MARK: - Instance Varriables
    var titleLabel: UILabel?
    var scoreLabel: UILabel?
    var powerupLabel: UILabel?
    var enemyLabel: UILabel?
    var lazersLabel: UILabel?
    var acuracyLabel: UILabel?
    
    var bonusLabel: UILabel?
    var pepTalkLabel: UILabel?
    
    var laserImageView: UIImageView?
    
    var powerup1: UIImageView?
    var powerup2: UIImageView?
    var powerup3: UIImageView?
    var powerupContainerView: UIView?
    
    
    var roundView: UIView?
    
    //MARK: - init
    func initalize(animationStatus: Bool){
        
        makeRoundView()
        makeTitle()
        makeScoreLabel()
        
        makePowerupLabel()
        makeLaserImage()
        makePowerUpImages()
        
       
        
        if(animationStatus){
            animateCellIn()
        }
        NotificationCenter.default.addObserver(self, selector: #selector(self.animateCellOut), name: NSNotification.Name(rawValue: "AnimateOut"), object: nil)
    }
    
    //MARK:- animation
    func animateCellIn(){
        roundView?.center.x = 750
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
            
            self.roundView?.center.x = self.contentView.frame.width / 2
        }, completion: nil)
    }
    @objc func animateCellOut(){
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
            self.roundView?.center.x = 750
        }, completion: nil)
    }
    
    //MARK: - Supporting UI
    func makeRoundView(){
        
        if (roundView == nil) {
            makeWindowImage()
            
            
        }
        self.roundView?.layer.borderWidth = 0
        self.roundView?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        roundView?.layer.cornerRadius = 8.0
        roundView?.clipsToBounds = true
        
        self.contentView.addSubview(roundView!)
        
    }
    
    func makeWindowImage(){
        roundView = UIView(frame: CGRect(x: 550, y: 0, width: self.contentView.frame.width - 10, height: self.contentView.frame.height))
        let frameTopImage = UIImage(named: "window_top.png")
        let frameTopeImageView = UIImageView(image: frameTopImage!)
        frameTopeImageView.frame = CGRect(x: 25, y: -20, width: self.contentView.frame.width - 45, height: 80)
        roundView?.addSubview(frameTopeImageView)
        let frameBottomImage = UIImage(named: "window_bottom.png")
        let frameBottomImageView = UIImageView(image: frameBottomImage!)
        frameBottomImageView.frame = CGRect(x: 0, y: self.contentView.frame.height - 80, width: self.contentView.frame.width - 25, height: 40)
        roundView?.addSubview(frameBottomImageView)
    }
    
    //MARK: test UI
    func makeTitle(){
        if titleLabel == nil {
            titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.contentView.frame.width, height: 50))
            roundView?.addSubview(titleLabel!)
        }
        
        titleLabel?.backgroundColor = .clear
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = .white
        titleLabel?.text = "Equipped"
        titleLabel?.font = UIFont(name: "neuropol", size: 20)
        
    }
    
    func makeScoreLabel(){
        if scoreLabel == nil {
            scoreLabel = UILabel(frame: CGRect(x: 40, y: 40, width: self.contentView.frame.width, height: 50))
            roundView?.addSubview(scoreLabel!)
        }
        
        scoreLabel?.backgroundColor = .clear
        scoreLabel?.textAlignment = .left
        scoreLabel?.textColor = .white
        scoreLabel?.text = "Laser"
        scoreLabel?.font = UIFont(name: "neuropol", size: 20)
        
    }
    
    func makePowerupLabel(){
        if powerupLabel == nil {
            powerupLabel = UILabel(frame: CGRect(x: 150, y: 40, width: self.contentView.frame.width, height: 50))
            roundView?.addSubview(powerupLabel!)
        }
        
        powerupLabel?.backgroundColor = .clear
        powerupLabel?.textAlignment = .left
        powerupLabel?.textColor = .white
        powerupLabel?.text = "Powerups"
        powerupLabel?.font = UIFont(name: "neuropol", size: 20)
        
    }
    
    func makeLaserImage(){
        laserImageView?.image = nil
         if (self.laserImageView != nil) {
            self.laserImageView = nil
            
        }
        
        self.laserImageView = UIImageView(image: PlayerAttributes.sharedPlayerAttributes.getLaser().retImage)
        roundView?.addSubview(self.laserImageView!)
        
        self.laserImageView?.frame = CGRect(x: 12, y: 55, width: 120, height: 120)
        
        
    }
    
    func makePowerUpImages(){
        print("here powerup")
        
        powerup1?.image = nil
        powerup2?.image = nil
        powerup3?.image = nil
        if (self.powerup1 != nil) {
            self.powerup1 = nil
            
        }
        if (self.powerup2 != nil) {
            self.powerup2 = nil
            
        }
        if (self.powerup3 != nil) {
            self.powerup3 = nil
            
        }
        
        if powerupContainerView == nil {
            powerupContainerView = UIView(frame: CGRect(x: 120, y: 55, width: self.contentView.frame.width - 100, height: 120))
            //powerupContainerView?.backgroundColor = UIColor.blue
            roundView?.addSubview(powerupContainerView!)
        }
        var powerups = PlayerAttributes.sharedPlayerAttributes.getPowerups()
        if(powerups.count > 0){
            self.powerup1 = UIImageView(image: powerupList[powerups[0]].retImage)
            self.powerup1?.frame = CGRect(x: 0, y: 20, width: 80, height: 80)
            powerupContainerView?.addSubview(self.powerup1!)
        }
        if(powerups.count > 1){
            self.powerup2 = UIImageView(image: powerupList[powerups[1]].retImage)
            self.powerup2?.frame = CGRect(x: 75, y: 20, width: 80, height: 80)
            powerupContainerView?.addSubview(self.powerup2!)
        }
         if(powerups.count > 2){
            self.powerup3 = UIImageView(image: powerupList[powerups[2]].retImage)
            self.powerup3?.frame = CGRect(x: 150, y: 20, width: 80, height: 80)
            powerupContainerView?.addSubview(self.powerup3!)
        }
        
       
        
        //self.laserImageView = UIImageView(image: PlayerAttributes.sharedPlayerAttributes.getLaser().retImage)
        
        
        //roundView?.addSubview(self.laserImageView!)
        
        //self.laserImageView?.frame = CGRect(x: 12, y: 55, width: 120, height: 120)
        
        
    }
    
    
    
}
