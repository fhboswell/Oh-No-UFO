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
    var delegate: SceneRootNodeAccessDelegate?
    var enemyControlNode = [SCNNode]()
    var enemyNode = [SCNNode]()
    var enemyTotal = 12
    
    
    
    //MARK: - Lifecycle
    init(level: Int){
        
        self.level = level
    }
    
    
    
    //MARK: - Init Control Nodes
    func addEnemyShips(){
        for index in 1...enemyTotal {
            let newControlNode = SCNNode()
            let heightOfControlNode = (Double(index%6)/5.0) - 1
            newControlNode.position = SCNVector3(0, heightOfControlNode, 0)
            
            self.delegate?.addToRootNode(nodeToAdd: newControlNode)
            enemyControlNode.append(newControlNode)
            newControlNode.addChildNode(addUFO())
            paradeShip(controlNode: newControlNode)

        }
        
    }
    
    
    //MARK: - Animation
    func paradeShip(controlNode: SCNNode){
        
        
        let random = arc4random_uniform(200)
        let interval = Double(random)/100.0
        if (enemyControlNode.count < (enemyTotal/2)+1 ){
            Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false) {_ in
                
                let action = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1), z: 0, duration: 2)
                action.timingMode = .easeInEaseOut
                controlNode.runAction(action)
            }
        }else{
            Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false) {_ in
                let action = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.1), z: 0, duration: 2)
                action.timingMode = .easeInEaseOut
                controlNode.runAction(action)
            }
        }
        
    }
    
    
    //MARK: - Visible Assets
    func addUFO(x: Float = 0, y: Float = 0, z: Float = 2.5) ->  SCNNode{
        
        
        
        let ufoNode = SCNNode()
        guard let ufoScene = SCNScene(named: "UFO.dae") else { return ufoNode}
        
        let ufoSceneChildNodes = ufoScene.rootNode.childNodes
        for childNode in ufoSceneChildNodes {
            ufoNode.addChildNode(childNode)
        }
        ufoNode.position = SCNVector3(x, y, z)
        ufoNode.scale = SCNVector3(0.01, 0.01, 0.01)
        ufoNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: -Float(Double.pi / 2) + 0.1)
        
        let sphereGeometry = SCNSphere(radius: 1.5)
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        let sphere1Body = SCNPhysicsBody(type: .kinematic, shape: shape)
        ufoNode.physicsBody = sphere1Body
        //ufoNode.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
        ufoNode.physicsBody?.contactTestBitMask = PhysicsMask.enemyShip
        ufoNode.physicsBody?.isAffectedByGravity = false
        
        let random = arc4random_uniform(5)
        let interval = Double(random)/10.0
        Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false) {_ in
            let random = arc4random_uniform(20) + 20
            let action = SCNAction.rotateBy(x: 0, y: CGFloat(random + 10), z: 0, duration: 20)
            ufoNode.runAction(action)
        }
        
        
        return ufoNode
        
        
    }
    
    
   
}
