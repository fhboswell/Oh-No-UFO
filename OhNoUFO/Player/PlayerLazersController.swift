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
        
        print(PlayerAttributes.sharedPlayerAttributes.getLaserInt())
        if(PlayerAttributes.sharedPlayerAttributes.getLaserInt() == 1){
            laser1(pos, dir)
        } else if(PlayerAttributes.sharedPlayerAttributes.getLaserInt() == 2){
            laser2(pos, dir)
        }
        
        
        
    
    }
    fileprivate func laser1(_ pos: SCNVector3, _ dir: SCNVector3) {
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
        
        //        laserNode.light = SCNLight()
        //        laserNode.scale = SCNVector3(1,1,1)
        //        laserNode.light?.intensity = 5000
        //        laserNode.light?.type = SCNLight.LightType.spot
        //        laserNode.light?.color = UIColor.red
        
        
        let particleSystem = SCNParticleSystem(named: "smok3.scnp", inDirectory: nil)
        particleSystem?.particleColor = UIColor.red
        
        laserNode.addParticleSystem(particleSystem!)
        
        //        let convertedPosition = bullet.convertPosition(bullet.position, to: nil)
        //        systemNode.position = convertedPosition
        //      laserNode.addChildNode(systemNode)
        
        
        self.delegate?.addToRootNode(nodeToAdd: laserNode)
        
        DispatchQueue.main.async(){
            let remove = SCNAction.run { (laser) in
                laser.removeFromParentNode()
            }
            let action = SCNAction.moveBy(x: CGFloat(dir.normalized().x), y: CGFloat(dir.normalized().y), z: CGFloat(dir.normalized().z), duration: 0.1)
            let pulseThreeTimes = SCNAction.repeat(action, count: 3)
            let sequence = SCNAction.sequence([pulseThreeTimes, remove])
            laserNode.runAction(sequence)
            self.lazerNodes.append(laserNode)
        }
    }
    fileprivate func laser2(_ pos: SCNVector3, _ dir: SCNVector3) {
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
        var dubPos = SCNVector3(pos.x + 0.05, pos.y, pos.z)
        laserNode.position = dubPos
        laserNode.opacity = 1
        
        //        laserNode.light = SCNLight()
        //        laserNode.scale = SCNVector3(1,1,1)
        //        laserNode.light?.intensity = 5000
        //        laserNode.light?.type = SCNLight.LightType.spot
        //        laserNode.light?.color = UIColor.red
        
        
        let particleSystem = SCNParticleSystem(named: "smok3.scnp", inDirectory: nil)
        particleSystem?.particleColor = UIColor.orange
        
        laserNode.addParticleSystem(particleSystem!)
        
        //        let convertedPosition = bullet.convertPosition(bullet.position, to: nil)
        //        systemNode.position = convertedPosition
        //      laserNode.addChildNode(systemNode)
        
        
        self.delegate?.addToRootNode(nodeToAdd: laserNode)
        
        
        let sphereGeometry2 = SCNSphere(radius: 0.01)
        
        
        let sphereMaterial2 = SCNMaterial()
        sphereMaterial2.diffuse.contents = UIColor.clear
        sphereGeometry2.materials = [sphereMaterial2]
        let laserNode2 = SCNNode(geometry: sphereGeometry2)
        
        
        let shape2 = SCNPhysicsShape(geometry: sphereGeometry2, options: nil)
        let sphere1Body2 = SCNPhysicsBody(type: .kinematic, shape: shape2)
        laserNode2.physicsBody = sphere1Body2
        laserNode2.physicsBody?.categoryBitMask = PhysicsMask.playerLazer
        laserNode2.physicsBody?.contactTestBitMask = PhysicsMask.enemyShip
        laserNode2.physicsBody?.isAffectedByGravity = false
        var dubPos2 = SCNVector3(pos.x - 0.05, pos.y, pos.z)
        laserNode2.position = dubPos2
        laserNode2.opacity = 1
        
        //        laserNode.light = SCNLight()
        //        laserNode.scale = SCNVector3(1,1,1)
        //        laserNode.light?.intensity = 5000
        //        laserNode.light?.type = SCNLight.LightType.spot
        //        laserNode.light?.color = UIColor.red
        
        
        let particleSystem2 = SCNParticleSystem(named: "smok3.scnp", inDirectory: nil)
        particleSystem2?.particleColor = UIColor.orange
        
        laserNode2.addParticleSystem(particleSystem2!)
        
        //        let convertedPosition = bullet.convertPosition(bullet.position, to: nil)
        //        systemNode.position = convertedPosition
        //      laserNode.addChildNode(systemNode)
        
        
        self.delegate?.addToRootNode(nodeToAdd: laserNode)
        self.delegate?.addToRootNode(nodeToAdd: laserNode2)
        
        DispatchQueue.main.async(){
            let remove = SCNAction.run { (laser) in
                laser.removeFromParentNode()
            }
            let action = SCNAction.moveBy(x: CGFloat(dir.normalized().x), y: CGFloat(dir.normalized().y), z: CGFloat(dir.normalized().z), duration: 0.1)
            let pulseThreeTimes = SCNAction.repeat(action, count: 3)
            let sequence = SCNAction.sequence([pulseThreeTimes, remove])
            laserNode.runAction(sequence)
            self.lazerNodes.append(laserNode2)
            let remove2 = SCNAction.run { (laser) in
                laser.removeFromParentNode()
            }
            let action2 = SCNAction.moveBy(x: CGFloat(dir.normalized().x), y: CGFloat(dir.normalized().y), z: CGFloat(dir.normalized().z), duration: 0.1)
            let pulseThreeTimes2 = SCNAction.repeat(action, count: 3)
            let sequence2 = SCNAction.sequence([pulseThreeTimes2, remove2])
            laserNode2.runAction(sequence2)
            self.lazerNodes.append(laserNode2)
        }
    }
    
    
}
