//
//  ViewController.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/12/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
 
    
    var sphereNode: SCNNode!
    var cubeNode: SCNNode!
    
    var enemyControlNode = [SCNNode]()
    var enemyNode = [SCNNode]()
    var enemyTotal = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLighting()
      
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // SceneKit/AR coordinates are in meters
        cubeNode = SCNNode()
        cubeNode.position = SCNVector3(0, 0, 0)
        sceneView.scene.rootNode.addChildNode(cubeNode)
       
        let sphereGeometry = SCNSphere(radius: 0.1)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIColor.green
        sphereGeometry.materials = [sphereMaterial]
        sphereNode = SCNNode(geometry: sphereGeometry)
        
        sphereNode.position = SCNVector3(4, 0, 0)
        cubeNode.addChildNode(sphereNode)
        
       // var action = SCNAction.rotateBy(x: 0, y: 4, z: 0, duration: 2)
        //cubeNode.runAction(action)
       
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.addTarget(self, action: #selector(sceneTapped(recognizer:)))
        sceneView.gestureRecognizers = [tapRecognizer]
        
        addEnemyShips()
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
    
    
    
    
    func addEnemyShips(){
        for index in 1...enemyTotal {
            let newControlNode = SCNNode()
            let heightOfControlNode = (Double(index%6)/5.0) - 1
            newControlNode.position = SCNVector3(0, heightOfControlNode, 0)
            sceneView.scene.rootNode.addChildNode(newControlNode)
            enemyControlNode.append(newControlNode)
            
            newControlNode.addChildNode(addUFO())
            
            paradeShip(controlNode: newControlNode)
            
            
        }
        
    }
    
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
        
        
        let random = arc4random_uniform(5)
        let interval = Double(random)/10.0
        Timer.scheduledTimer(withTimeInterval: TimeInterval(interval), repeats: false) {_ in
            let random = arc4random_uniform(20) + 20
            let action = SCNAction.rotateBy(x: 0, y: CGFloat(random + 10), z: 0, duration: 20)
            ufoNode.runAction(action)
        }
        
        
        return ufoNode
        
        
    }
    
    
    
    @objc func sceneTapped(recognizer: UITapGestureRecognizer) {
        print("tapped")
        let location = recognizer.location(in: sceneView)
        let action = SCNAction.rotateBy(x: 0, y: 10, z: 0, duration: 5)
        cubeNode.runAction(action)
        
      
        
        
    }
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
}


