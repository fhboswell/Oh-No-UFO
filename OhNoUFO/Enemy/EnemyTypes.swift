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
    
    //Setup the important info for each enemy type
    //The actions are prepared in closures in order to make sure they are random each time
    
    static var enemyTypes : [EnemyType] = {
        var name = "UFO2.dae"
        var offset = SCNVector3(0,0,2.5)
        var position : SCNVector3? = nil
        
        var closureToGenerateControlAction = { () -> SCNAction in //name these with human names "parade action"
            var random = arc4random_uniform(200)
            var interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction,moveAction])
        }
        var closureToGenerateControlAction2 = { () -> SCNAction in //name these with human names "parade action left"
            let random = arc4random_uniform(200)
            let interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.1), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction, moveAction])
        }
        var closureToGenerateResourceAction = { () -> SCNAction in //name these with human names "parade action" or UFO spin
            var random = arc4random_uniform(5)
            let interval = Double(random)/10.0
            let waitAction = SCNAction.wait(duration: interval)
            random = arc4random_uniform(20) + 20
            var rotateAction = SCNAction.rotateBy(x: 0, y: CGFloat(random + 10), z: 0, duration: 20)
            return SCNAction.group([waitAction,rotateAction])
        }
        
        var enemyTypeOne = EnemyType(name, position, offset, closureToGenerateControlAction, closureToGenerateResourceAction)
        var enemyTypeTwo = EnemyType(name, position, offset, closureToGenerateControlAction2, closureToGenerateResourceAction)
        var enemyTypes = [EnemyType]()
        
        enemyTypes.append(enemyTypeOne)
        enemyTypes.append(enemyTypeTwo)
        
        
        return enemyTypes
    }()
    
    var resourceName : String
    
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
         _ controlNodeLocation : SCNVector3?,
         _ offsetInControlNode : SCNVector3?,
         _ generateControlNodeAction : @escaping () -> SCNAction?,
         _ generateEnemyNodeAction : @escaping () -> SCNAction?){
        
        self.resourceName = resourceName
        self.controlNodeLocation = controlNodeLocation
        self.offsetInControlNode = offsetInControlNode
        self.generateControlNodeAction = generateControlNodeAction
        self.generateEnemyNodeAction = generateEnemyNodeAction
        
    }
}
