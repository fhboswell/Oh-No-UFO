//
//  EnemyTypes.swift
//  OhNoUFO
//
//  Created by Aaron Boswell on 2018-03-18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import SceneKit

struct EnemyType{
    var resourceName : String
    
    var scale: SCNVector3?
    
    var controlNodeLocation : SCNVector3?
    var offsetInControlNode : SCNVector3?
    
    var controlNodeAction : SCNAction?{
        return generateControlNodeAction()
    }
    var enemyNodeAction : SCNAction?{
        return generateEnemyNodeAction()
    }
    
    
    
    private var generateControlNodeAction : () -> SCNAction?
    private var generateEnemyNodeAction : () -> SCNAction?

    init(_ resourceName : String,
         _ scale : SCNVector3?,
         _ controlNodeLocation : SCNVector3?,
         _ offsetInControlNode : SCNVector3?,
         _ generateControlNodeAction : @escaping () -> SCNAction?,
         _ generateEnemyNodeAction : @escaping () -> SCNAction?){
        
        self.resourceName = resourceName
        self.scale = scale
        self.controlNodeLocation = controlNodeLocation
        self.offsetInControlNode = offsetInControlNode
        self.generateControlNodeAction = generateControlNodeAction
        self.generateEnemyNodeAction = generateEnemyNodeAction
        
    }
}
