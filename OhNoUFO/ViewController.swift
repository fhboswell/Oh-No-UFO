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

class ViewController: UIViewController, EnemyControllerDelegate{
    
    @IBOutlet weak var sceneView: ARSCNView!
    
 
    
    var sphereNode: SCNNode!
    var cubeNode: SCNNode!
   
    
    var enemyController: EnemyController? = nil
    
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
        
  
        if (self.enemyController == nil) {
            self.enemyController = EnemyController(level: 1)
            self.enemyController?.delegate = self
        }
        
        self.enemyController?.addEnemyShips()
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
    
    
    //MARK: - delegate methods
    func addToRootNode(nodeToAdd: SCNNode){
        sceneView.scene.rootNode.addChildNode(nodeToAdd)
    }
}


