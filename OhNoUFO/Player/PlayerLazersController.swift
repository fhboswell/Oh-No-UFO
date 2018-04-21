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
        sphereMaterial.diffuse.contents = UIColor.clear
        sphereGeometry.materials = [sphereMaterial]
        let laserNode = SCNNode(geometry: sphereGeometry)
        
        
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        let sphere1Body = SCNPhysicsBody(type: .kinematic, shape: shape)
        laserNode.physicsBody = sphere1Body
        laserNode.physicsBody?.categoryBitMask = PhysicsMask.playerLazer
        laserNode.physicsBody?.contactTestBitMask = PhysicsMask.enemyShip
        laserNode.physicsBody?.isAffectedByGravity = false
        
        laserNode.position = pos
        laserNode.opacity = 1
        
        laserNode.light = SCNLight()
        laserNode.scale = SCNVector3(1,1,1)
        laserNode.light?.intensity = 5000
        laserNode.light?.type = SCNLight.LightType.spot
        laserNode.light?.color = UIColor.red
        
        
         let particleSystem = SCNParticleSystem(named: "smok3.scnp", inDirectory: nil)
        particleSystem?.particleColor = UIColor.red
       
        laserNode.addParticleSystem(particleSystem!)
        
//        let convertedPosition = bullet.convertPosition(bullet.position, to: nil)
//        systemNode.position = convertedPosition
//        laserNode.addChildNode(systemNode)
      
        
        self.delegate?.addToRootNode(nodeToAdd: laserNode)
        
        let action = SCNAction.moveBy(x: CGFloat(dir.normalized().x), y: CGFloat(dir.normalized().y), z: CGFloat(dir.normalized().z), duration: 0.1)
        let pulseThreeTimes = SCNAction.repeat(action, count: 3)
        laserNode.runAction(pulseThreeTimes)
        lazerNodes.append(laserNode)
        
       // let particleSystem = SCNParticleSystem(named: "smok3", inDirectory: nil)
        //let systemNode = SCNNode()
        //laserNode.addParticleSystem(particleSystem!)
        //let convertedPosition = bullet.convertPosition(bullet.position, to: nil)
        //systemNode.position = convertedPosition
        //laserNode.addChildNode(systemNode)
    }
    
    
}
