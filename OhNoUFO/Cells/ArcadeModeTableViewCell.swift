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
        self.roundView?.layer.borderWidth = 2
        self.roundView?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        roundView?.layer.cornerRadius = 8.0
        roundView?.clipsToBounds = true
        roundView?.backgroundColor = UIColor.white
        self.contentView.addSubview(roundView!)
        
        if titleLabel == nil {
            titleLabel = UILabel(frame: CGRect(x: 500, y: 30, width: self.contentView.frame.width, height: 20))
        }
        
        titleLabel?.backgroundColor = .clear
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = .black
        titleLabel?.text = "ARCADE"
        self.contentView.addSubview(titleLabel!)
    }
    func makePretty(){
        
       self.contentView.backgroundColor = UIColor.black
    }
}

