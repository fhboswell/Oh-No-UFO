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

struct PhysicsMask {
    static let playerLazer = 0
    static let enemyShip = 1
}

class ViewController: UIViewController, SceneRootNodeAccessDelegate{
    
    
    //MARK: - Instance Varriables
    @IBOutlet weak var sceneView: ARSCNView!
    var sphereNode: SCNNode!
    var cubeNode: SCNNode!
   
    
    var enemyController: EnemyController? = nil
    var lazersController: LazersController? = nil
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLighting()
      
        addGestures()
        prepareLazerController()
        prepareEnemyController()
       // setupScene()
        //demoMethod()
        sceneView.scene.physicsWorld.contactDelegate = self
        //sceneView.debugOptions = SCNDebugOptions.showPhysicsShapes
   
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
    
    
    //MARK: -Player Fire Control
    
    func getUserVector() -> (SCNVector3, SCNVector3) { // (direction, position)
        if let frame = self.sceneView.session.currentFrame {
            let mat = SCNMatrix4(frame.camera.transform) // 4x4 transform matrix describing camera in world space
            let dir = SCNVector3(-1 * mat.m31, -1 * mat.m32, -1 * mat.m33) // orientation of camera in world space
            let pos = SCNVector3(mat.m41, mat.m42, mat.m43) // location of camera in world space
            
            return (dir, pos)
        }
        return (SCNVector3(0, 0, -1), SCNVector3(0, 0, -0.2))
    }
    
    func fireLazer(){
        var userLocationTuple = getUserVector()
        lazersController?.fireLaser(dir: userLocationTuple.0, pos: userLocationTuple.1)
    }
    
    
    
    func prepareLazerController(){
        if (self.lazersController == nil) {
            self.lazersController = LazersController(level: 1)
            self.lazersController?.delegate = self
        }
    }
    
    //MARK: - Sprite Controllers
    func prepareEnemyController(){
        if (self.enemyController == nil) {
            self.enemyController = EnemyController(level: 1)
            self.enemyController?.delegate = self
        }
        
        self.enemyController?.addEnemyShips()
        
    }
    
    //MARK: - Root Scene reqs
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    //MARK: - Gesture / Touch
    
    func addGestures(){
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        tapRecognizer.addTarget(self, action: #selector(sceneTapped(recognizer:)))
        sceneView.gestureRecognizers = [tapRecognizer]
    }
 
    
    @objc func sceneTapped(recognizer: UITapGestureRecognizer) {
        print("tapped")
        let location = recognizer.location(in: sceneView)
        self.fireLazer()
        
        
        //this code moves the basic objects initalized in "demoMothod"
        //let action = SCNAction.rotateBy(x: 0, y: 10, z: 0, duration: 5)
        //cubeNode.runAction(action)
  
    }

    //MARK: - delegate methods
    func addToRootNode(nodeToAdd: SCNNode){
        sceneView.scene.rootNode.addChildNode(nodeToAdd)
    }
    
    //MARK: - Demo
    //of basic AR object (node) instantiation
    
    /*
     - This method adds some functionality to demonstrate basic use of scenekit and physics.
     - When you tap the screen a green orb will take a few orbits of SCNVector3(0, 0, 0) of the scene's root node
     - This is where the phone was located exactly when the AR session was initalized
     - This code only initalizes the objects, the actual code to move the objects is located in the "sceneTapped" method
     */
    
    func demoMethod(){
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
        
        // SceneKit/AR coordinates are in meters
        cubeNode = SCNNode()
        cubeNode.position = SCNVector3(0, 0, 0)
        sceneView.scene.rootNode.addChildNode(cubeNode)
        
        let sphereGeometry = SCNSphere(radius: 0.03)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIColor.green
        sphereGeometry.materials = [sphereMaterial]
        sphereNode = SCNNode(geometry: sphereGeometry)
        
        sphereNode.position = SCNVector3(4, 0, 0)
        cubeNode.addChildNode(sphereNode)
        
        
        
    }
}

//MARK: Scene Physics Contact Delegate

extension ViewController : SCNPhysicsContactDelegate {
    
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        print("physics world")
        let maskA = contact.nodeA.physicsBody!.contactTestBitMask
        let maskB = contact.nodeB.physicsBody!.contactTestBitMask
        
        switch(maskA, maskB){
        case (PhysicsMask.enemyShip, PhysicsMask.playerLazer):
            hitEnemy(bullet: contact.nodeB, enemy: contact.nodeA)
        case (PhysicsMask.playerLazer, PhysicsMask.enemyShip):
            hitEnemy(bullet: contact.nodeA, enemy: contact.nodeB)
        default:
            break
        }
    }
    
    func hitEnemy(bullet: SCNNode, enemy: SCNNode){
        bullet.removeFromParentNode()
        enemy.removeFromParentNode()
        print("hit")
        
    }
}