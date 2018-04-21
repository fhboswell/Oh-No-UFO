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
    public var lazerNodes = [SCNNode]()
    
    init(_ enemyInstantiationParameters : EnemyInstantiationParameters){
        
        var offsetInControlNode = enemyInstantiationParameters.offsetInControlNode
        var controlNodeLocation = enemyInstantiationParameters.controlNodeLocation
        
        enemyType = DefaultGameSettings.enemyTypes[enemyInstantiationParameters.enemyTypeIndex]
        
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
        enemyNode.physicsBody?.categoryBitMask = PhysicsMask.enemyShip
        //enemyNode.physicsBody?.contactTestBitMask = PhysicsMask.playerLazer
        enemyNode.physicsBody?.isAffectedByGravity = false

        controlNode.addChildNode(enemyNode)
    }
    public func animate(){
        DispatchQueue.main.async {
            
            self.controlNode.runAction(self.enemyType.controlNodeAction!)
            self.enemyNode.runAction(self.enemyType.enemyNodeAction!)
        }

    }
    
    //maybe put this in EnemyType
    func startFireSequence(){
        
        //TODO: - This is commented out so that enemys will not fire this is for testing reasons
        
        let random = arc4random_uniform(200)
        let interval = Double(random)/100.0 + 6

        print(interval)
        let fireAction = SCNAction.run { (node) in
            self.fireLaser()
        }

        let waitAction = SCNAction.wait(duration: interval)

        let doAction = SCNAction.sequence([waitAction,fireAction])
        enemyNode.runAction(SCNAction.repeatForever(doAction))

    }
    
    func fireLaser(){
        
        
        let pov = PotentiallyUnsafeGlobals.playerPOV()
        var position: SCNVector3
        var pos: SCNVector3
        var dir : SCNVector3
        
        position = SCNVector3Make(0, 0, 0.05)
        pos = enemyNode.convertPosition(position, to: nil)
        dir = (pov.position) - pos
        
        let sphereGeometry = SCNSphere(radius: 0.01)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIColor.clear
        sphereGeometry.materials = [sphereMaterial]
        let laserNode = SCNNode(geometry: sphereGeometry)
        
        
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        let sphere1Body = SCNPhysicsBody(type: .kinematic, shape: shape)
        laserNode.physicsBody = sphere1Body
        laserNode.physicsBody?.categoryBitMask = PhysicsMask.enemyLazer
        laserNode.physicsBody?.contactTestBitMask = PhysicsMask.player
        laserNode.physicsBody?.isAffectedByGravity = false
        
        let particleSystem = SCNParticleSystem(named: "smok3.scnp", inDirectory: nil)
        particleSystem?.particleColor = UIColor.green
        
        laserNode.addParticleSystem(particleSystem!)
        
        laserNode.position = pos
        
        laserNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: -Float(Double.pi / 2) + 0.1)
        
        
        controlNode.parent?.addChildNode(laserNode)
        
        let remove = SCNAction.run { (laser) in
            laser.removeFromParentNode()
        }
        let action = SCNAction.moveBy(x: CGFloat(dir.normalized().x), y: CGFloat(dir.normalized().y), z: CGFloat(dir.normalized().z), duration: 1)
        let pulseThreeTimes = SCNAction.repeat(action, count: 6)
        let sequence = SCNAction.sequence([pulseThreeTimes, remove])
        laserNode.runAction(sequence)
        lazerNodes.append(laserNode)

        
    }
    
}
