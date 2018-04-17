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
    
    //MARK: - init
    func initalize(){
        
        makePretty()
        makeTitleLabel()
        
    }
    
    //MARK: - Supporting UI
    func makeTitleLabel(){
        
        if titleLabel == nil {
            titleLabel = UILabel(frame: CGRect(x: 0, y: 30, width: self.contentView.frame.width, height: 20))
        }
        
        titleLabel?.backgroundColor = .clear
        titleLabel?.textAlignment = .left
        titleLabel?.textColor = .black
        titleLabel?.text = "Total Score:"
        self.contentView.addSubview(titleLabel!)
    }
    func makePretty(){
        
        //self.contentView.backgroundColor = UIColor.gray
    }
}
