//
//  EnemyController.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/13/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import SceneKit


class EnemyController{
    
     //MARK: - Instance Varriables
    let level:Int
    var rootNodeDelegate: SceneRootNodeAccessDelegate?
    var playerLocationDelegate: PlayerLocationAccessDelegate?
    var enemyControlNodes = [SCNNode]()
    var enemyNodes = [SCNNode]()
    var enemyTotal = 12
    
    var enemyLazersController: EnemyLazersController? = nil
    
    
    
    //MARK: - Lifecycle
    init(level: Int){
        
        self.level = level
       
        
    }
    
    
    func fireAllLazers(){
        for enemyShipNode in enemyNodes{
           
            
            
            self.enemyLazersController?.fireLaser(enemyNode: enemyShipNode)
            
        }
        
    }
    
    
    
    //MARK: - Init Control Nodes
    func addEnemyShips(){
        for index in 1...enemyTotal {
            let newControlNode = SCNNode()
            let heightOfControlNode = (Double(index%6)/5.0) - 1
            newControlNode.position = SCNVector3(0, heightOfControlNode, 0)
            
            self.rootNodeDelegate?.addToRootNode(nodeToAdd: newControlNode)
            enemyControlNodes.append(newControlNode)
            newControlNode.addChildNode(addUFO())
            
            
            
            movePattern1(controlNode: newControlNode)
            //fireAllLazers()
            

        }
        
    }
    
   
    func prepareEnemyLazerController(){
        if (self.enemyLazersController == nil) {
            self.enemyLazersController = EnemyLazersController(level: 1)
            self.enemyLazersController?.playerLocationDelegate = playerLocationDelegate
            self.enemyLazersController?.rootNodeDelegate = rootNodeDelegate
        }
    }
    
    
    //MARK: - Animation
    func movePattern1(controlNode: SCNNode){
        
       
        let random = arc4random_uniform(200)
        let interval = Double(random)/100.0
        if (enemyControlNodes.count < (enemyTotal/2)+1 ){
            Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false) {_ in
                
                let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1), z: 0, duration: 5)
                moveAction.timingMode = .easeInEaseOut
                let waitAction = SCNAction.wait(duration: 2)
                
                
                let moveAndWait = SCNAction.group([moveAction, waitAction])
                let moveAndWaitRepeat = SCNAction.repeat(moveAndWait, count: 1)
                controlNode.runAction(moveAndWaitRepeat)
                
                
            }
        }else{
            Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false) {_ in
                let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.1), z: 0, duration: 5)
                moveAction.timingMode = .easeInEaseOut
                let waitAction = SCNAction.wait(duration: 2)
                
                
                let moveAndWait = SCNAction.group([moveAction, waitAction])
                let moveAndWaitRepeat = SCNAction.repeat(moveAndWait, count: 1)
                controlNode.runAction(moveAndWaitRepeat)
               
            }
        }
        
    }
    
    //MARK: - Visible Assets
    func addUFO(x: Float = 0, y: Float = 0, z: Float = 2.5) ->  SCNNode{
        
        
        
        let ufoNode = SCNNode()
        guard let ufoScene = SCNScene(named: "UFO2.dae") else { return ufoNode}
        
        let ufoSceneChildNodes = ufoScene.rootNode.childNodes
        for childNode in ufoSceneChildNodes {
            ufoNode.addChildNode(childNode)
        }
        ufoNode.position = SCNVector3(x, y, z)
        ufoNode.scale = SCNVector3(0.2, 0.2, 0.2)
        ufoNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: -Float(Double.pi / 2) + 0.1)
        
        let sphereGeometry = SCNSphere(radius: 0.2)
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        let sphere1Body = SCNPhysicsBody(type: .kinematic, shape: shape)
        ufoNode.physicsBody = sphere1Body
        ufoNode.physicsBody?.contactTestBitMask = PhysicsMask.enemyShip
        ufoNode.physicsBody?.isAffectedByGravity = false
        
        let random = arc4random_uniform(5)
        let interval = Double(random)/10.0
        Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false) {_ in
            let random = arc4random_uniform(20) + 20
            let action = SCNAction.rotateBy(x: 0, y: CGFloat(random + 10), z: 0, duration: 20)
            ufoNode.runAction(action)
        }
       
        
        
        enemyNodes.append(ufoNode)
        
        return ufoNode
        
        
    }
    
    
   
}
