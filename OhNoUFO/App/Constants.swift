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
var levelList: [Level] = {
    
    var levelList = [Level]()
    var new1:Level = Level(level: "1")
    levelList.append(new1)
    var new2:Level = Level(level: "2")
    levelList.append(new2)
    var new3:Level = Level(level: "3")
    levelList.append(new3)
    var new4:Level = Level(level: "4")
    levelList.append(new4)
    return levelList
   
    
}()

