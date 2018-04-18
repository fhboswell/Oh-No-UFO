//
//  ArcadeModeTableViewCell.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/19/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit

class ArcadeModeTableViewCell: UITableViewCell {

    //MARK: - Instance Varriables
    var titleLabel: UILabel?
    var roundView: UIView?
    
    //MARK: - init
    func initalize(animationStatus: Bool){
        
        makePretty()
        makeTitleLabel()
        
        if(animationStatus){
            animateCellIn()
        }
         NotificationCenter.default.addObserver(self, selector: #selector(self.animateCellOut), name: NSNotification.Name(rawValue: "AnimateOut"), object: nil)
    }
    
    func animateCellIn(){
        roundView?.center.x = 750
        titleLabel?.center.x = 700
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
            self.titleLabel?.center.x = self.contentView.frame.width / 2
            self.roundView?.center.x = self.contentView.frame.width / 2
        }, completion: nil)
    }
    @objc func animateCellOut(){
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
            self.roundView?.center.x = 750
            self.titleLabel?.center.x = 700
        }, completion: nil)
    }
    
    //MARK: - Supporting UI
    func makeTitleLabel(){
        
        
        if (roundView == nil) {
            roundView = UIView(frame: CGRect(x: 550, y: 20, width: self.contentView.frame.width - 100, height: self.contentView.frame.height - 40))
        }
        self.roundView?.layer.borderWidth = 0
        self.roundView?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        roundView?.layer.cornerRadius = 8.0
        roundView?.clipsToBounds = true
        roundView?.backgroundColor = UIColor.white
        
       
        
        let gradient = CAGradientLayer()
        
        gradient.frame = (roundView?.bounds)!
        gradient.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        roundView?.layer.insertSublayer(gradient, at: 0)
        
        self.contentView.addSubview(roundView!)
        
        
        
        if titleLabel == nil {
            titleLabel = UILabel(frame: CGRect(x: 500, y: 30, width: self.contentView.frame.width, height: 50))
        }
        
        titleLabel?.backgroundColor = .clear
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = .black
        titleLabel?.text = "PLAY"
        titleLabel?.font = UIFont(name: "Knewave", size: 40)
        
        
        
        titleLabel?.layer.shadowColor = UIColor.gray.cgColor
        titleLabel?.layer.shadowRadius = 3.0
        titleLabel?.layer.shadowOpacity = 1.0
        titleLabel?.layer.shadowOffset = CGSize(width: 4, height: 4)
        titleLabel?.layer.masksToBounds = false
        
        
        
        
        
        self.contentView.addSubview(titleLabel!)
    }
    func makePretty(){
        
       self.contentView.backgroundColor = UIColor.black
    }
}

