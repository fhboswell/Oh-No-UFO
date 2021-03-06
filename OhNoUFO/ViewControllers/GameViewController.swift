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
    
    var dataView: UIView?
    var healthView: UIView?
    var healthViewColor: UIView?
    
    var powerup1: UIImageView?
    var powerup2: UIImageView?
    var powerup3: UIImageView?
    var powerupContainerView: UIView?
    
    var scoreLabel: UILabel?
    var waveLabel: UILabel?
    
    var retView: UIImageView?
    var laser: Laser?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.scene.physicsWorld.contactDelegate = self
        sceneView.debugOptions = SCNDebugOptions.showPhysicsShapes
   
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
        prepareRoundStatistics()
        initLaserReticle()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        addDataView()
        initScoreLabel()
        initWaveLabel()
        animateDataViewIn()
        addHealthView()
        animateHealthViewIn()
        makePowerUpImages()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    
    //MARK: - UIElements
    
    
    func addDataView(){
        if (dataView == nil){
            dataView = UIView(frame: CGRect(x: 0, y: -200, width: self.view.frame.width, height: 80))
            dataView?.backgroundColor = UIColor.clear
            self.view.addSubview(dataView!)
            let frameBottomImage = UIImage(named: "window_top_upside_down.png")
            let frameBottomImageView = UIImageView(image: frameBottomImage!)
            frameBottomImageView.frame = CGRect(x: 0, y: (self.dataView?.frame.height)!, width: self.view.frame.width, height: 80)
            dataView?.addSubview(frameBottomImageView)
        }
    }
    func makePowerUpImages(){
        print("here powerup")
        
        powerup1?.image = nil
        powerup2?.image = nil
        powerup3?.image = nil
        if (self.powerup1 != nil) {
            self.powerup1 = nil
            
        }
        if (self.powerup2 != nil) {
            self.powerup2 = nil
            
        }
        if (self.powerup3 != nil) {
            self.powerup3 = nil
            
        }
        
        if powerupContainerView == nil {
            powerupContainerView = UIView(frame: CGRect(x: 80, y: 0, width: self.view.frame.width, height: 120))
            //powerupContainerView?.backgroundColor = UIColor.blue
            dataView?.addSubview(powerupContainerView!)
        }
        var powerups = PlayerAttributes.sharedPlayerAttributes.getPowerups()
        if(powerups.count > 0){
            self.powerup1 = UIImageView(image: powerupList[powerups[0]].retImage)
            self.powerup1?.tag = 1
            self.powerup1?.frame = CGRect(x: 0, y: 30, width: 60, height: 60)
            powerupContainerView?.addSubview(self.powerup1!)
            powerup1?.isUserInteractionEnabled = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(play(sender:)))
            powerup1?.addGestureRecognizer(tapGestureRecognizer)
        }
        if(powerups.count > 1){
            self.powerup2 = UIImageView(image: powerupList[powerups[1]].retImage)
            self.powerup2?.tag = 2
            self.powerup2?.frame = CGRect(x: 75, y: 30, width: 60, height: 60)
            powerupContainerView?.addSubview(self.powerup2!)
            powerup2?.isUserInteractionEnabled = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(play(sender:)))
            powerup2?.addGestureRecognizer(tapGestureRecognizer)
        }
        if(powerups.count > 2){
            self.powerup3 = UIImageView(image: powerupList[powerups[2]].retImage)
            self.powerup3?.tag = 3
            self.powerup3?.frame = CGRect(x: 150, y: 30, width: 60, height: 60)
            powerupContainerView?.addSubview(self.powerup3!)
            powerup3?.isUserInteractionEnabled = true
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(play(sender:)))
            powerup3?.addGestureRecognizer(tapGestureRecognizer)
        }
        
      
    }
    @objc func play(sender:  UIGestureRecognizer){
        let viewTapped = sender.view
        print(viewTapped?.tag)
        PlayerAttributes.sharedPlayerAttributes.usePowerup(index: (viewTapped?.tag)!)
        if(viewTapped?.tag == 1){
            powerup1?.image = nil
            powerup1?.gestureRecognizers = nil
        }
        if(viewTapped?.tag == 2){
            powerup2?.image = nil
            powerup2?.gestureRecognizers = nil
        }
        if(viewTapped?.tag == 3){
            powerup3?.image = nil
            powerup3?.gestureRecognizers = nil
        }
        
    }
    
    func addHealthView(){
        if (healthView == nil){
            healthView = UIView(frame: CGRect(x: 0, y:self.view.frame.height + 200, width: self.view.frame.width, height: 80))
            healthView?.backgroundColor = UIColor.clear
            self.view.addSubview(healthView!)
            healthViewColor = UIView(frame: CGRect(x: 0, y: 40, width: self.view.frame.width, height: 40))
            healthViewColor?.backgroundColor = UIColor.green
            healthView?.addSubview(healthViewColor!)
            let frameBottomImage = UIImage(named: "health.png")
            let frameBottomImageView = UIImageView(image: frameBottomImage!)
            frameBottomImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50)
            healthView?.addSubview(frameBottomImageView)
        }
    }
    func animateDataViewIn(){
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
            
            self.dataView?.center.y = 40
        }, completion: nil)
    }
    func animateHealthViewIn(){
        
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
            
            self.healthView!.center.y  -= 280
        
        }, completion: nil)
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
        RoundStatistics.currentRoundStatistics.lasersFired += 1
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
    func prepareRoundStatistics(){
        RoundStatistics.currentRoundStatistics.reset()
    }
    
    //MARK: - Root Scene reqs
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
        
        
//        let ambientLightNode = SCNNode();
//        ambientLightNode.light = SCNLight()
//        ambientLightNode.light?.type = SCNLight.LightType.omni
//        sceneView.scene.rootNode.addChildNode(ambientLightNode)
        
        
        
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
        _ = recognizer.location(in: sceneView)
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
            scoreLabel = UILabel(frame: CGRect(x: 7, y: 100, width: dataView!.frame.width, height: 30))
        }
        scoreLabel?.backgroundColor = .clear
        scoreLabel?.textAlignment = NSTextAlignment.center
        scoreLabel?.text = String(format: "%011d", 0)
        scoreLabel?.font = UIFont(name: "neuropol", size: 22)
        scoreLabel?.textColor = UIColor.green
        dataView?.addSubview(scoreLabel!)
    }
    func initWaveLabel(){
        
        if (waveLabel == nil) {
            waveLabel = UILabel(frame: CGRect(x: dataView!.frame.width - 70, y: 40, width: 70, height: 30))
        }
        waveLabel?.backgroundColor = .clear
        waveLabel?.textAlignment = NSTextAlignment.center
        waveLabel?.text = String(describing: gameController!.currentWave)
        waveLabel?.font = UIFont(name: "neuropol", size: 30)
        waveLabel?.textColor = UIColor.green
        dataView?.addSubview(waveLabel!)
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
    func updateWaveLabel(){
        DispatchQueue.main.async {
            self.waveLabel?.text = String(describing: self.gameController!.currentWave)
        }
    }
    func adjustScore(amount: Int){
        DispatchQueue.main.async {
            RoundStatistics.currentRoundStatistics.score += amount
            self.scoreLabel?.text = String(format: "%011d", RoundStatistics.currentRoundStatistics.score)
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
    
    func hitEnemy(bullet: SCNNode?, enemy: SCNNode?){
        
        //this does not remove it from the datastore in the respective classes
        //TODO: Propagate Removal of objects
        let particleSystem = SCNParticleSystem(named: "Explosion", inDirectory: nil)
        let systemNode = SCNNode()
        systemNode.addParticleSystem(particleSystem!)
        let convertedPosition = enemy?.convertPosition((enemy?.position)!, to: nil)
        //if enemy?.name == 1
      //  var newPos = SCNVector3(convertedPosition!.x, convertedPosition!.y - 0.5, convertedPosition!.z)
        systemNode.position = convertedPosition!
        
        sceneView.scene.rootNode.addChildNode(systemNode)
        
        DispatchQueue.main.async(){
            if (bullet != nil){
                bullet?.removeAllActions()
                bullet?.removeFromParentNode()
                
            }
        }
        if (enemy != nil){
            enemy?.removeFromParentNode()
        }
        gameController!.hitEnemyWithNode(enemy!)
        adjustScore(amount: 100)
        RoundStatistics.currentRoundStatistics.enemiesDestroyed += 1
        updateWaveLabel()
    }
   
   
    
    func hitPlayer(){
        if(!PlayerAttributes.sharedPlayerAttributes.removeOneLife()){
            
            RoundReport.lastRoundReport = RoundReport(statistics: RoundStatistics.currentRoundStatistics)
            GlobalStatistics.sharedGlobalStatistics.updateFromReport(report: RoundReport.lastRoundReport!)

            
            self.sceneView.scene.isPaused = true
            
            DispatchQueue.main.async(){
                let gameoverLabel = UILabel(frame: CGRect(x: 1, y: self.view.frame.height/3, width: self.dataView!.frame.width, height: 50))
                
                gameoverLabel.backgroundColor = .clear
                gameoverLabel.textAlignment = NSTextAlignment.center
                gameoverLabel.text = "Game Over"
                gameoverLabel.font = UIFont(name: "neuropol", size: 40)
                gameoverLabel.textColor = UIColor.white
                self.view?.addSubview(gameoverLabel)
            }
           
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                PlayerAttributes.sharedPlayerAttributes.realignPowerups()
                self.dismiss(animated: true, completion: nil)
            }
            
            
        }
        
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
                //DispatchQueue.main.async {
                self.healthViewColor!.frame = CGRect(x: 0, y: 40, width: (self.view.frame.width / 3 )*CGFloat(PlayerAttributes.sharedPlayerAttributes.getLives()), height: 40)
               // }
                
            }, completion: nil)
        }
        //updateLivesView(PlayerAttributes.sharedPlayerAttributes.getLives())
       
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

