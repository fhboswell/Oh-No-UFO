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
import CoreGraphics
import Foundation


class GameViewController: UIViewController, SceneRootNodeAccessDelegate, PlayerLocationAccessDelegate{
    
    
    //MARK: - Instance Varriables
    
    @IBOutlet weak var sceneView: ARSCNView!{
        willSet{
            PotentiallyUnsafeGlobals.sceneView = newValue
        }
    }
    
    var sphereNode: SCNNode!
    var cubeNode: SCNNode!
    var shootTime:TimeInterval = 0
    var gameController: GameController? = nil
    var playerLazersController: PlayerLazersController? = nil
    var playerReady = false
    
    var score = 0
    var enemiesDestroyed = 0
    var lasersFired = 0
    
    var scoreLabel: UILabel?
    var retView: UIImageView?
    var laser: Laser?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.scene.physicsWorld.contactDelegate = self
        //sceneView.debugOptions = SCNDebugOptions.showPhysicsShapes
   
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
        configureLighting()
        initPlayer()
        addGestures()
        prepareLazerController()
        prepareEnemyController()
        initScoreLabel()
        initLaserReticle()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
    
    //MARK: - Player Fire Control
    func prepareLazerController(){
        if (self.playerLazersController == nil) {
            self.playerLazersController = PlayerLazersController(level: 1)
            self.playerLazersController?.delegate = self
        }
    }
    
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
        let userLocationTuple = getUserVector()
        playerLazersController?.fireLaser(dir: userLocationTuple.0, pos: userLocationTuple.1)
        lasersFired += 1
    }
    
    
    
    func initPlayer(){
        let node = SCNNode()
        // this puts the node in front & slightly below the camera
        let orientation = SCNVector3(x: 0, y: 0, z: 0)
        node.position = orientation
        let physicsBody = SCNPhysicsBody(
            type: .kinematic,
            shape: SCNPhysicsShape(geometry: SCNSphere(radius: 0.1))
        )
        node.physicsBody = physicsBody
        node.physicsBody?.categoryBitMask = PhysicsMask.player
        node.physicsBody?.contactTestBitMask = PhysicsMask.enemyLazer
        sceneView.pointOfView?.addChildNode(node)
        Timer.scheduledTimer(withTimeInterval: TimeInterval(5), repeats: false) {_ in
            self.playerReady = true
        }
    }
    
    
    //MARK: - Sprite Controllers
    func prepareEnemyController(){
        self.gameController = GameController(level: 1)
        gameController?.incrementWave()
       
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
        let location = recognizer.location(in: sceneView)
        self.fireLazer()
    }

    //MARK: - delegate methods
    func addToRootNode(nodeToAdd: SCNNode){
        sceneView.scene.rootNode.addChildNode(nodeToAdd)
    }
    
    func playerPOV() -> SCNNode{
        return sceneView.pointOfView!
    }
    
    //MAKE: - score
    func initScoreLabel(){
       
        if (scoreLabel == nil) {
            scoreLabel = UILabel(frame: CGRect(x: 10, y: 50, width: 300, height: 30))
        }
        scoreLabel?.backgroundColor = .clear
        scoreLabel?.textAlignment = NSTextAlignment.left
        scoreLabel?.text = "Score: "
        scoreLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        scoreLabel?.textColor = UIColor.green
        self.view.addSubview(scoreLabel!)
    }
    
    func initLaserReticle(){
        
        self.laser = PlayerAttributes.sharedPlayerAttributes.getLaser()
        if (self.retView != nil){
            self.retView?.removeFromSuperview()
            self.retView?.image = nil
            self.retView = nil
        }
        let reticle = self.laser?.retImage
        let retView = UIImageView(frame: CGRect(x: self.view.frame.maxX/2 - 75, y: self.view.frame.maxY/2 - 75, width: 150, height: 150))
        retView.image = reticle
        retView.contentMode = .scaleAspectFill
        retView.alpha = 0.3
        self.view.insertSubview(retView, at: 1)
    }
    func adjustScore(amount: Int){
        DispatchQueue.main.async {
            self.scoreLabel?.text = "Score: " +  String(PlayerAttributes.sharedPlayerAttributes.addToCurrentGameScore(amount: amount))
        }
    }
}

//MARK: Scene Physics Contact Delegate

extension GameViewController : SCNPhysicsContactDelegate {
    
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        
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
        switch(maskA, maskB){
        case (PhysicsMask.player, PhysicsMask.enemyLazer):
        
            hitPlayer()
        case (PhysicsMask.enemyLazer, PhysicsMask.player):
           
            hitPlayer()
        default:
            break
        }
 
    }
    
    func hitEnemy(bullet: SCNNode, enemy: SCNNode){
        
        //this does not remove it from the datastore in the respective classes
        //TODO: Propagate Removal of objects
        let particleSystem = SCNParticleSystem(named: "Explosion", inDirectory: nil)
        let systemNode = SCNNode()
        systemNode.addParticleSystem(particleSystem!)
        let convertedPosition = bullet.convertPosition(bullet.position, to: nil)
        systemNode.position = convertedPosition
        sceneView.scene.rootNode.addChildNode(systemNode)
        if (bullet != nil){
            bullet.removeFromParentNode()
        }
        if (enemy != nil){
             enemy.removeFromParentNode()
        }
        gameController!.hitEnemyWithNode(enemy)
        adjustScore(amount: 100)
        enemiesDestroyed += 1
    }
   
   
    
    func hitPlayer(){
        if(!PlayerAttributes.sharedPlayerAttributes.removeOneLife()){
            
            PlayerAttributes.sharedPlayerAttributes.updateLaserEnemyCount(lasersCount: lasersFired, enemyCount: enemiesDestroyed)
            lasersFired = 0
            enemiesDestroyed = 0
            
            self.dismiss(animated: true, completion: nil)
        }
       
    }
}


//MARK: AR SceneView Delegate
extension GameViewController : ARSCNViewDelegate{
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {

        
    }
    
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        switch camera.trackingState {
        case .notAvailable:
            print("Camera Not Available")
        case .limited(let reason):
            switch reason {
            case .excessiveMotion:
                print("Camera Tracking State Limited Due to Excessive Motion")
            case .initializing:
                print("Camera Tracking State Limited Due to Initalization")
            case .insufficientFeatures:
                print("Camera Tracking State Limited Due to Insufficient Features")
            case .relocalizing:
                 print("Camera Tracking State Relocalizing")
            }
        case .normal:
            print("Camera Tracking State Normal")
        }
    }
    func session(_ session: ARSession, didFailWithError error: Error) {
        print("Session Failed with error: \(error.localizedDescription)")
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        print("Session Interrupted")
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        print("Session no longer being interrupted")
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
}

