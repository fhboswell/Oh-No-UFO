//
//  PowerupTableViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 4/17/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit

class PowerupTableViewCell: UITableViewCell {
    
    //MARK: - Instance Varriables
    var titleLabel: UILabel?
    var scoreLabel: UILabel?
    var enemyLabel: UILabel?
    var lazersLabel: UILabel?
    var acuracyLabel: UILabel?
    
    
    var roundView: UIView?
    
    //MARK: - init
    func initalize(animationStatus: Bool){
        
        makeRoundView()
        makeTitle()
        makeScoreLabel()
        makeEnemysLabel()
        makeLasersLabel()
        makeAcuracyLabel()
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
        titleLabel?.text = "Report"
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
        scoreLabel?.text = "Score: \t" + String(PlayerAttributes.sharedPlayerAttributes.getLastRoundScore())
        scoreLabel?.font = UIFont(name: "neuropol", size: 20)
        
    }
    func makeEnemysLabel(){
        if enemyLabel == nil {
            enemyLabel = UILabel(frame: CGRect(x: 40, y: 70, width: self.contentView.frame.width, height: 50))
            roundView?.addSubview(enemyLabel!)
        }
        
        enemyLabel?.backgroundColor = .clear
        enemyLabel?.textAlignment = .left
        enemyLabel?.textColor = .white
        enemyLabel?.text = "UFOs: \t" + String(PlayerAttributes.sharedPlayerAttributes.getLastRoundEnemiesDestroyed())
        enemyLabel?.font = UIFont(name: "neuropol", size: 20)
        
    }
    func makeLasersLabel(){
        if lazersLabel == nil {
            lazersLabel = UILabel(frame: CGRect(x: 40, y: 100, width: self.contentView.frame.width, height: 50))
            roundView?.addSubview(lazersLabel!)
        }
        
        lazersLabel?.backgroundColor = .clear
        lazersLabel?.textAlignment = .left
        lazersLabel?.textColor = .white
        lazersLabel?.text = "Lasers \t" + String(PlayerAttributes.sharedPlayerAttributes.getLastRoundLasersFired())
        lazersLabel?.font = UIFont(name: "neuropol", size: 20)
        
    }
    
    func makeAcuracyLabel(){
        if acuracyLabel == nil {
            acuracyLabel = UILabel(frame: CGRect(x: 40, y: 130, width: self.contentView.frame.width, height: 50))
            roundView?.addSubview(acuracyLabel!)
        }
        
        acuracyLabel?.backgroundColor = .clear
        acuracyLabel?.textAlignment = .left
        acuracyLabel?.textColor = .white
        
        acuracyLabel?.text = "Accu \t\t" + String(format: "%.2f", PlayerAttributes.sharedPlayerAttributes.getLastRoundAccuracy())
        acuracyLabel?.font = UIFont(name: "neuropol", size: 20)
        
    }


}
