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
var laserList: [Laser] = {
    
    var levelList = [Laser]()
    var retImage = UIImage(named: "ret1.png")
    var new1:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new1)
    
    retImage = UIImage(named: "ret2.png")
    var new2:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new2)
    retImage = UIImage(named: "ret3.png")
    
    var new3:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new3)
    
    retImage = UIImage(named: "ret4.png")
    var new4:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new4)
    
    retImage = UIImage(named: "ret5.png")
    var new5:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new5)
    
    retImage = UIImage(named: "ret6.png")
    var new6:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new6)
    
    retImage = UIImage(named: "ret7.png")
    var new7:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new7)
    return levelList
   
    
}()

