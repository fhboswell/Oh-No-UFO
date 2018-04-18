//
//  Constants.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/13/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import SceneKit


struct PhysicsMask {
    static let playerLazer = 0
    static let enemyLazer = 2
    static let enemyShip = 4
    static let player = 8
    
}
var levelList: [Laser] = {
    
    var levelList = [Laser]()
    var retImage = UIImage(named: "ret1.png")
    var new1:Laser = Laser(level: "1", retImage: retImage!)
    levelList.append(new1)
    var new2:Laser = Laser(level: "1", retImage: retImage!)
    levelList.append(new2)
    var new3:Laser = Laser(level: "1", retImage: retImage!)
    levelList.append(new3)
    var new4:Laser = Laser(level: "1", retImage: retImage!)
    levelList.append(new4)
    return levelList
   
    
}()

