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
    func initalize(){
        
        makePretty()
        makeTitleLabel()
        
    }
    
    //MARK: - Supporting UI
    func makeTitleLabel(){
        
        
        if (roundView == nil) {
            roundView = UIView(frame: CGRect(x: 50, y: 20, width: self.contentView.frame.width - 100, height: 90))
        }
        self.roundView?.layer.borderWidth = 2
        self.roundView?.layer.borderColor = UIColor(hex: 0xe6e6e6).cgColor
        roundView?.layer.cornerRadius = 8.0
        roundView?.clipsToBounds = true
        roundView?.backgroundColor = UIColor.blue
        self.contentView.addSubview(roundView!)
        
        if titleLabel == nil {
            titleLabel = UILabel(frame: CGRect(x: 0, y: 30, width: self.contentView.frame.width, height: 20))
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

