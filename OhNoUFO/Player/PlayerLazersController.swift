//
//  LazersController.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/13/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit
import ARKit
import SceneKit
import Foundation

class PlayerLazersController{
    
    
    
    //MARK: - Instance Varriables
    let level:Int
    var delegate: SceneRootNodeAccessDelegate?
    var lazerNodes = [SCNNode]()
    
    //MARK: - Lifecycle
    init(level: Int){
        
        self.level = level
    }
    
    //MARK: - Visible Assets
    func fireLaser(dir: SCNVector3, pos:  SCNVector3){
        
        
        let sphereGeometry = SCNSphere(radius: 0.01)
        
        
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIColor.green
        sphereGeometry.materials = [sphereMaterial]
        let laserNode = SCNNode(geometry: sphereGeometry)
        
        
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        let sphere1Body = SCNPhysicsBody(type: .kinematic, shape: shape)
        laserNode.physicsBody = sphere1Body
        laserNode.physicsBody?.categoryBitMask = PhysicsMask.playerLazer
        laserNode.physicsBody?.contactTestBitMask = PhysicsMask.enemyShip
        laserNode.physicsBody?.isAffectedByGravity = false
        
        laserNode.position = pos
       
        laserNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: -Float(Double.pi / 2) + 0.1)
        
        self.delegate?.addToRootNode(nodeToAdd: laserNode)
        
        let action = SCNAction.moveBy(x: CGFloat(dir.normalized().x), y: CGFloat(dir.normalized().y), z: CGFloat(dir.normalized().z), duration: 0.2)
        let pulseThreeTimes = SCNAction.repeat(action, count: 3)
        laserNode.runAction(pulseThreeTimes)
        lazerNodes.append(laserNode)
    }
    
    
}
