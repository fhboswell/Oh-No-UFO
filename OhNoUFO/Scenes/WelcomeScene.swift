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
    
    
    //MARK: - instance varriables
    let ufoNode = SCNNode()
    var titleNode = SCNNode()
    var titleControlNode = SCNNode()
    var playNode = SCNNode()
    var playControlNode = SCNNode()
    
    
    //MARK: - lifecycle
    func initializeScene(){
        setupCamera()
        addUFO()
        setTitleNode()
        setPlayNode()
    }
    
    func setupCamera(){
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0.5, z: 3)
        self.rootNode.addChildNode(cameraNode)
        
    }
    
    //MARK: - Text nodes
    func setPlayNode() {
        let text = SCNText(string: "PLAY",  extrusionDepth: 20)
        
        let material = SCNMaterial()
        text.font = UIFont(name: "Knewave", size: 100)
        material.lightingModel = SCNMaterial.LightingModel.physicallyBased
        material.roughness.contents  = NSNumber(value: 0.1)
        material.metalness.contents = NSNumber(value: 0.9)
        text.materials = [material]
        
        //Create Node object
        playNode.scale = SCNVector3(x:0.015,y:0.015,z:0.015)
        playNode.geometry = text
        playNode.position = SCNVector3(x: -1.7, y:0, z: 0)
        playControlNode.position =  SCNVector3(x: 0, y:3, z: 4)
        self.playControlNode.addChildNode(playNode)
        
        self.rootNode.addChildNode(playControlNode)
        
    }
    
    func setTitleNode() {
  
       // let text = SCNText(string: "Score: " +  String(PlayerAttributes.sharedPlayerAttributes.addToCurrentGameScore(amount: 0)), extrusionDepth: 20)
        let text = SCNText(string: "OH NO UFO",  extrusionDepth: 20)
        
        let material = SCNMaterial()
        text.font = UIFont(name: "Knewave", size: 100)
        material.lightingModel = SCNMaterial.LightingModel.physicallyBased
        material.roughness.contents  = NSNumber(value: 0.1)
        material.metalness.contents = NSNumber(value: 0.9)
        text.materials = [material]
        
        //Create Node object
        titleNode.scale = SCNVector3(x:0.01,y:0.01,z:0.01)
        titleNode.geometry = text
        titleNode.position = SCNVector3(x: -1.5, y:0, z: 0)
 
        titleControlNode.position =  SCNVector3(x: -1, y:4, z: 0)
        self.titleControlNode.addChildNode(titleNode)
        
        self.rootNode.addChildNode(titleControlNode)
        runTitleFlairAnimation()
    }
    
    func runTitleFlairAnimation(){
        
        let action1 = SCNAction.rotateBy(x: 0, y: -0.25, z: 0, duration: 3)
        action1.timingMode = .easeInEaseOut
        let action2 = SCNAction.rotateBy(x: 0, y: 0.25, z: 0, duration: 3
        )
        action2.timingMode = .easeInEaseOut
        let actionSeq = SCNAction.sequence([action1,action2])
        let runManyTimes = SCNAction.repeat(actionSeq, count: 100)
        self.titleControlNode.runAction(runManyTimes)
    }
 
    //MARK: - object nodes
    func addUFO(x: Float = -6.5, y: Float = 0, z: Float = -1.5){
   
        guard let ufoScene = SCNScene(named: "UFO2.dae") else { return }
        
        let ufoSceneChildNodes = ufoScene.rootNode.childNodes
        for childNode in ufoSceneChildNodes {
            ufoNode.addChildNode(childNode)
        }
        ufoNode.position = SCNVector3(x, y, z)
        ufoNode.scale = SCNVector3(0.75, 0.75, 0.75)
        ufoNode.rotation = SCNVector4(x: 1, y: 0.5, z: 0, w: -Float(Double.pi / 2) + 0.1)
        
        let sphereGeometry = SCNSphere(radius: 0.2)
        let shape = SCNPhysicsShape(geometry: sphereGeometry, options: nil)
        _ = SCNPhysicsBody(type: .kinematic, shape: shape)
        
        self.rootNode.addChildNode(ufoNode)
        
        let random = arc4random_uniform(5)
        _ = Double(random)/10.0
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(random + 10), z: 0, duration: 10)
        let runManyTimes = SCNAction.repeat(action, count: 20)
        self.ufoNode.removeAllActions()
        self.ufoNode.runAction(runManyTimes)
        
   
    }
    
    
    //MARK: - animation
    func moveIn(){
         let ufoAction = SCNAction.move(to: SCNVector3(-1, 0.5, -1.5), duration: 1)
        let scoreAction = SCNAction.move(to: SCNVector3(x:-1, y:1.7, z: -3), duration: 1)
        let playAction = SCNAction.move(to: SCNVector3(x: 0, y:-2.0, z: -4), duration: 1)
        
        
        
        self.ufoNode.runAction(ufoAction)
        self.titleControlNode.runAction(scoreAction)
        self.playControlNode.runAction(playAction)
    }
    func moveOut(){
        let ufoAction = SCNAction.move(to: SCNVector3(-6.5, 0, -1.5), duration: 1)
        let scoreAction = SCNAction.move(to: SCNVector3(x: -1, y:4, z: 0), duration: 1)
        let playAction = SCNAction.move(to: SCNVector3(x: 0, y:3, z: 4), duration: 1)
        self.ufoNode.runAction(ufoAction)
        self.titleControlNode.runAction(scoreAction)
        self.playControlNode.runAction(playAction)
    }
    
}
