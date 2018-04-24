//
//  Structs.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/19/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import SceneKit


struct Laser {
    var cost: String
    var retImage: UIImage
}
struct Powerup {
    var cost: String
    var retImage: UIImage
}

struct Wave{
    public var enemyParameters : [EnemyInstantiationParameters]
}
struct EnemyInstantiationParameters{
    var enemyTypeIndex : Int
    var controlNodeLocation : SCNVector3?
    var offsetInControlNode : SCNVector3?
    var rotationalOffset: Int?
    
    init(   _ enemyTypeIndex : Int,
            _ controlNodeLocation : SCNVector3?,
            _ offsetInControlNode : SCNVector3?,
            _ rotationalOffset : Int?){
        self.enemyTypeIndex = enemyTypeIndex
        self.controlNodeLocation = controlNodeLocation
        self.offsetInControlNode = offsetInControlNode
        self.rotationalOffset = rotationalOffset
    }
}
