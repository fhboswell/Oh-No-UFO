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
    var scoreNode: SCNNode?
    
    
    func initializeScene(){
        setupCamera()
        addUFO()
        addScoreNode()
    }
    
    func setupCamera(){
        var cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0.5, z: 0.2)
        self.rootNode.addChildNode(cameraNode)
        
    }
    
    func addScoreNode() {

        if(scoreNode != nil){
    
            scoreNode?.removeFromParentNode()
        }
        
        let text = SCNText(string: "Score: " +  String(PlayerAttributes.sharedPlayerAttributes.addToCurrentGameScore(amount: 0)), extrusionDepth: 1)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.green
        text.materials = [material]
        
        //Create Node object
        scoreNode = SCNNode()
        scoreNode?.scale = SCNVector3(x:0.05,y:0.05,z:0.05)
        scoreNode?.geometry = text
        scoreNode?.position = SCNVector3(x: 5, y:0.5, z: -3)
        
        self.rootNode.addChildNode(scoreNode!)
        
        let random = arc4random_uniform(5)
        let interval = Double(random)/10.0
        let action1 = SCNAction.rotateBy(x: 0, y: -0.5, z: 0, duration: 1)
        action1.timingMode = .easeInEaseOut
        let action2 = SCNAction.rotateBy(x: 0, y: 0.5, z: 0, duration: 1)
        action2.timingMode = .easeInEaseOut
        let actionSeq = SCNAction.sequence([action1,action2])
        let runManyTimes = SCNAction.repeat(actionSeq, count: 100)
        self.scoreNode?.runAction(runManyTimes)
    
    }
    
    
    
    func addUFO(x: Float = -3.7, y: Float = 0, z: Float = -1.5){
   
        guard let ufoScene = SCNScene(named: "UFO2.dae") else { return }
        
        let ufoSceneChildNodes = ufoScene.rootNode.childNodes
        for childNode in ufoSceneChildNodes {
            ufoNode.addChildNode(childNode)
        }
        ufoNode.position = SCNVector3(x, y, z)
        ufoNode.scale = SCNVector3(0.5, 0.5, 0.5)
        ufoNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: -Float(Double.pi / 2) + 0.1)
        
        let sphereGeometry = SCNSphere(radius: 0.2)
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        let sphere1Body = SCNPhysicsBody(type: .kinematic, shape: shape)
        
        self.rootNode.addChildNode(ufoNode)
        
        let random = arc4random_uniform(5)
        let interval = Double(random)/10.0
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(random + 10), z: 0, duration: 10)
        let runManyTimes = SCNAction.repeat(action, count: 20)
        self.ufoNode.runAction(runManyTimes)
        
   
    }
    
    func moveIn(){
         let ufoAction = SCNAction.move(to: SCNVector3(-0.7, 0, -1.5), duration: 1)
        let scoreAction = SCNAction.move(to: SCNVector3(x: -1, y:0.5, z: -3), duration: 1)
        self.ufoNode.runAction(ufoAction)
        self.scoreNode?.runAction(scoreAction)
    }
    func moveOut(){
        let ufoAction = SCNAction.move(to: SCNVector3(-3.7, 0, -1.5), duration: 1)
        let scoreAction = SCNAction.move(to: SCNVector3(x: 5, y:0.5, z: -3), duration: 1)
        self.ufoNode.runAction(ufoAction)
        self.scoreNode?.runAction(scoreAction)
    }
    
}
