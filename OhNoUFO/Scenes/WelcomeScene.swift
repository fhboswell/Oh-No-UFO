//
//  WelcomeScene.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/19/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit
import SpriteKit
import SceneKit

class WelcomeScene: SCNScene {
    
   let ufoNode = SCNNode()
    func initializeScene(){

        addUFO()
    }
    
    
    
    func addUFO(x: Float = 0, y: Float = 0, z: Float = -2.5){
   
        guard let ufoScene = SCNScene(named: "UFO.dae") else { return }
        
        let ufoSceneChildNodes = ufoScene.rootNode.childNodes
        for childNode in ufoSceneChildNodes {
            ufoNode.addChildNode(childNode)
        }
        ufoNode.position = SCNVector3(x, y, z)
        ufoNode.scale = SCNVector3(0.01, 0.01, 0.01)
        ufoNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: -Float(Double.pi / 2) + 0.1)
        
        let sphereGeometry = SCNSphere(radius: 0.2)
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        let sphere1Body = SCNPhysicsBody(type: .kinematic, shape: shape)
        
        self.rootNode.addChildNode(ufoNode)
        
        let random = arc4random_uniform(5)
        let interval = Double(random)/10.0
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(random + 10), z: 0, duration: 20)
        let runManyTimes = SCNAction.repeat(action, count: 10)
        self.ufoNode.runAction(runManyTimes)
        
   
    }
    
}
