//
//  WelcomeViewController.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/16/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit
import UIKit
import ARKit
import SceneKit
import CoreGraphics

class WelcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, LaserCellDelegate {
   
    //MARK: Instance Varriables
    @IBOutlet var welcomeTableView: UITableView!
    @IBOutlet var welcomeSceneView: SCNView!
    
    var scene: WelcomeScene?
    var animationStatus:[Bool] = [false, false,false,false,false]

    
    
    //MARK: - Lifecycle
    func addParallaxToView(vw: UIView) {
        let amount = 100
        //addParallaxToView(vw: roundView!)
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        vw.addMotionEffect(group)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setAnimationStatusTrue()
        welcomeTableView.reloadData()
        scene?.setTitleNode()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       scene?.isPaused = false
        scene?.moveIn()
        UIApplication.shared.statusBarStyle = .lightContent
        //makeAndAnimateHeadline()
        
        
    }
    
    
   
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        scene?.isPaused = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeTableView.delegate = self
        welcomeTableView.dataSource = self
         setupScene()
        
        
       addBackground()
        
        addTouchView()
        
      

    }
    func addBackground(){
        let backgroundImage = UIImage(named: "background2.png")
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.maxX, height: self.view.frame.maxY))
        
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 1
        
        self.view.insertSubview(backgroundImageView, at: 0)
    }
    
    func addTouchView(){
        var touchview = UIView(frame: CGRect(x: 0, y: self.view.frame.height/2 - 50, width: self.view.frame.width, height: 100))
        touchview.backgroundColor = UIColor.clear
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(play))
        touchview.addGestureRecognizer(tapGestureRecognizer)
        self.view.addSubview(touchview)
        
    }
    
    func setAnimationStatusTrue(){
        animationStatus[0] = true
        animationStatus[1] = true
        animationStatus[2] = true
        animationStatus[3] = true
        animationStatus[4] = true
       
        
    }
    
    
    
    func getAnimationStatus(indexPath: IndexPath) -> Bool{
        var status = animationStatus[indexPath.row]
        print(indexPath.row)
        animationStatus[indexPath.row] = false
        return status
    }
    
    //MARK: - scene
    func setupScene(){
        self.scene = WelcomeScene()
        welcomeSceneView.backgroundColor = UIColor.clear
        welcomeSceneView.autoenablesDefaultLighting = true
        self.welcomeSceneView.scene = scene
        self.scene?.initializeScene()
    }
    

    
    
    //MARK: - Game Setup Logic
    func prepareToPlay(){
        PlayerAttributes.sharedPlayerAttributes.resetLives()
        PlayerAttributes.sharedPlayerAttributes.resetScore()
        
    }
    
    func playArcade(){
        performSegue(withIdentifier: "playGame", sender: nil)
    }
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if(indexPath.row == 0){
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ArcadeMode", for: indexPath) as! ArcadeModeTableViewCell
//            cell.initalize(animationStatus: getAnimationStatus(indexPath: indexPath))
//            cell.selectionStyle = .none
//            return cell
//
//        }else
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "Powerup", for: indexPath) as! PowerupTableViewCell
            cell.initalize(animationStatus: getAnimationStatus(indexPath: indexPath))
            cell.selectionStyle = .none
            return cell
        }else if(indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "LaserSelect", for: indexPath) as! LaserTableViewCell
            cell.initalize(laserList: levelList, delegate: self, animationStatus: getAnimationStatus(indexPath: indexPath))
            cell.contentView.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
            return cell
            
            
        }
        //just remove the final if else and replace with else
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArcadeMode", for: indexPath)
        cell.selectionStyle = .none
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.row == 0){
            play()
        }
    }
    
    @objc func play(){
        prepareToPlay()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "AnimateOut"), object: self)
        scene?.moveOut()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.playArcade()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 200
            
        }else if(indexPath.row == 1){
            return 200
        }else if(indexPath.row == 2){
            return 200
            
            
        }
        return 120
        
    }
    
    //MARK: - protocol conform
    func recieveLevelIndex(index: Int){
        print(index)
    }
    
}


