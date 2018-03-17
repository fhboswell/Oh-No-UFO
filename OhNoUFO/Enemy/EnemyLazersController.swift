//
//  EnemyLazersController.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/16/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit
import ARKit
import SceneKit
import Foundation

class EnemyLazersController{
    
    
    
    //MARK: - Instance Varriables
    let level:Int
    var rootNodeDelegate: SceneRootNodeAccessDelegate?
    var playerLocationDelegate: PlayerLocationAccessDelegate?
    var lazerNodes = [SCNNode]()
    
    //MARK: - Lifecycle
    init(level: Int){
        
        self.level = level
    }
    
    //MARK: - Visible Assets
    
   
    
    
    func fireLaser(enemyNode: SCNNode){
        
     
        let pov = self.playerLocationDelegate?.playerPOV()
        var position: SCNVector3
        var pos: SCNVector3
        var dir : SCNVector3
       
        position = SCNVector3Make(0, 0, 0.05)
        pos = enemyNode.convertPosition(position, to: nil)
        dir = (pov?.position)! - pos
        
        let sphereGeometry = SCNSphere(radius: 0.01)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIColor.green
        sphereGeometry.materials = [sphereMaterial]
        let laserNode = SCNNode(geometry: sphereGeometry)
        
        
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        let sphere1Body = SCNPhysicsBody(type: .kinematic, shape: shape)
        laserNode.physicsBody = sphere1Body
        laserNode.physicsBody?.contactTestBitMask = PhysicsMask.enemyLazer
        laserNode.physicsBody?.isAffectedByGravity = false
        
        laserNode.position = pos
        
        laserNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: -Float(Double.pi / 2) + 0.1)
        
        self.rootNodeDelegate?.addToRootNode(nodeToAdd: laserNode)
        
        let action = SCNAction.moveBy(x: CGFloat(dir.normalized().x), y: CGFloat(dir.normalized().y), z: CGFloat(dir.normalized().z), duration: 1)
        let pulseThreeTimes = SCNAction.repeat(action, count: 10)
        laserNode.runAction(pulseThreeTimes)
        lazerNodes.append(laserNode)
    }
    
    
}
