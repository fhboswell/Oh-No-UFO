//
//  Enemy.swift
//  OhNoUFO
//
//  Created by Aaron Boswell on 2018-03-18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import SceneKit

class Enemy{
    
    public var enemyType : EnemyType
    public var controlNode : SCNNode
    public var enemyNode : SCNNode
    
    init(_ enemyTypeIndex : Int, _ controlNodeLocation : SCNVector3?, _ offsetInControlNode : SCNVector3?){
        
        var offsetInControlNode = offsetInControlNode
        var controlNodeLocation = controlNodeLocation
        
        enemyType = EnemyType.enemyTypes[enemyTypeIndex]
        
        if controlNodeLocation == nil {
            controlNodeLocation = enemyType.controlNodeLocation
        }
        if offsetInControlNode == nil {
            offsetInControlNode = enemyType.offsetInControlNode
        }
        
        controlNode = SCNNode()
        controlNode.position = controlNodeLocation!
        
        enemyNode = SCNNode()
        guard let enemyScene = SCNScene(named: enemyType.resourceName) else { return }
        
        let enemySceneChildNodes = enemyScene.rootNode.childNodes
        for childNode in enemySceneChildNodes {
            enemyNode.addChildNode(childNode)
        }
        enemyNode.position = offsetInControlNode!
        
        //some of these folowing should probably be broken out into EnemyType or discerned from the Scene itself
        enemyNode.scale = SCNVector3(0.2, 0.2, 0.2)
        enemyNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: -Float(Double.pi / 2) + 0.1)
        
        let sphereGeometry = SCNSphere(radius: 0.2)
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        let sphere1Body = SCNPhysicsBody(type: .kinematic, shape: shape)
        enemyNode.physicsBody = sphere1Body
        enemyNode.physicsBody?.contactTestBitMask = PhysicsMask.enemyShip
        enemyNode.physicsBody?.isAffectedByGravity = false

        controlNode.addChildNode(enemyNode)
    }
    public func animate(){
        DispatchQueue.main.async {
            
            self.controlNode.runAction(self.enemyType.controlNodeAction!)
            self.enemyNode.runAction(self.enemyType.enemyNodeAction!)
        }

    }
    
}
