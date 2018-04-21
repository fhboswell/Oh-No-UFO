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

    var totalScoreLabel: UILabel?
    var pointsView: UIView?
    
    var dataView: UIView?
    
    var canAnimateDataView = true
    
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
        
        let firstCellPath = IndexPath(row: 0, section: 0)
        welcomeTableView.scrollToRow(at: firstCellPath, at: .top, animated: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       scene?.isPaused = false
        scene?.moveIn()
        UIApplication.shared.statusBarStyle = .lightContent
        animateScoreIn()
        
        
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
        addPointsView()
        
        addDataView()
        
      

    }
    
    //MARK:- animation
    func animateScoreIn(){
        pointsView?.center.x = -750
        UIView.animate(withDuration: 1, delay: 0.2, options: [.curveEaseOut], animations: {
            
            self.pointsView?.center.x = self.view.frame.width / 2
        }, completion: nil)
    }
    
    @objc func animateScoreOut(){
        UIView.animate(withDuration: 1.5, delay: 0, options: [.curveEaseIn], animations: {
            self.pointsView?.center.x = -750
        }, completion:  nil)
    }
    
    //MARK: - Data view animation control{
    func animateInOutDataView(){
        if(canAnimateDataView){
            canAnimateDataView = false
            dataView?.center.x = 550
            UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
                
                self.dataView?.center.x = self.view.frame.width / 2
            }, completion:  { (finished: Bool) in
                UIView.animate(withDuration: 1, delay: 1, options: [.curveEaseInOut], animations: {
                    // we need to go a level deeper
                    self.dataView?.center.x  = 550
                }, completion: { (finished: Bool) in
                    //we have arrived
                    self.canAnimateDataView = true
                    
                })
            })
        }
       
        
        
        
    }
    
    
    //MARK: - UIelemenst
    func addBackground(){
        let backgroundImage = UIImage(named: "bg.png")
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.maxX, height: self.view.frame.maxY))
        
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = 1
        
        self.view.insertSubview(backgroundImageView, at: 0)
    }
    
    func addTouchView(){
        let touchview = UIView(frame: CGRect(x: 0, y: self.view.frame.height/2 - 150, width: self.view.frame.width, height: 100))
        touchview.backgroundColor = UIColor.clear
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(play))
        touchview.addGestureRecognizer(tapGestureRecognizer)
        self.view.addSubview(touchview)
        
    }
    
    func addDataView(){
        if (dataView == nil){
            dataView = UIView(frame: CGRect(x: 500, y: 150, width: self.view.frame.width, height: 80))
            dataView?.backgroundColor = UIColor.clear
            self.view.addSubview(dataView!)
            //dataView = UIView(frame: CGRect(x: 550, y: 0, width: self.view.frame.width - 10, height: self.view.frame.height))
            let frameTopImage = UIImage(named: "window_top.png")
            let frameTopeImageView = UIImageView(image: frameTopImage!)
            frameTopeImageView.frame = CGRect(x: 25, y: -20, width: self.view.frame.width - 45, height: 80)
            dataView?.addSubview(frameTopeImageView)
            let frameBottomImage = UIImage(named: "window_bottom.png")
            let frameBottomImageView = UIImageView(image: frameBottomImage!)
            frameBottomImageView.frame = CGRect(x: 0, y: (self.dataView?.frame.height)!, width: self.view.frame.width - 25, height: 40)
            dataView?.addSubview(frameBottomImageView)
        }
    }
    
    func addPointsView(){
        if( pointsView == nil){
            pointsView = UIView(frame: CGRect(x: 0, y: self.view.frame.height/2 - 20, width: self.view.frame.width, height: 100))
        }
        pointsView?.backgroundColor = UIColor.clear
        
        let pointsFrameImage = UIImage(named: "main_field_1.png")
        let pointsFrameImageView = UIImageView(image: pointsFrameImage)
        pointsFrameImageView.frame = CGRect(x: 15, y: 0, width: self.view.frame.width - 50 , height: 100)
        
        
        if( totalScoreLabel == nil){
            totalScoreLabel = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width, height: 100))
        }
        
        totalScoreLabel?.textAlignment = .center
        totalScoreLabel?.textColor = .white
        
       setTotalScoreWithZeros()
        totalScoreLabel?.font = UIFont(name: "neuropol", size: 20)
        
        pointsView?.addSubview(totalScoreLabel!)
        pointsView?.addSubview(pointsFrameImageView)
        self.view.addSubview(pointsView!)
        
    }
    
    func setTotalScoreWithZeros(){
         totalScoreLabel?.text = String(format: "%010d", PlayerAttributes.sharedPlayerAttributes.getScore())
    }
    
    func setAnimationStatusTrue(){
        animationStatus[0] = true
        animationStatus[1] = true
        animationStatus[2] = true
        animationStatus[3] = true
        animationStatus[4] = true
       
        
    }
    
    
    
    func getAnimationStatus(indexPath: IndexPath) -> Bool{
        let status = animationStatus[indexPath.row]
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
            cell.initalize(laserList: laserList, delegate: self, animationStatus: getAnimationStatus(indexPath: indexPath))
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
        animateScoreOut()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "AnimateOut"), object: self)
        scene?.moveOut()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.playArcade()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 350
            
        }else if(indexPath.row == 1){
            return 200
        }else if(indexPath.row == 2){
            return 200
            
            
        }
        return 120
        
    }
    
    func buyLaser(index: Int){
        purchasedLasers[index] = true
    }
    
    //MARK: - protocol conform
    func recieveLevelIndex(index: Int){
        print(index)
        
        if(!unlockedLasers[index]){
            print("notunlocked")
            animateInOutDataView()
        }else if(!purchasedLasers[index]){
            if( PlayerAttributes.sharedPlayerAttributes.getScore() > Int(laserList[index].cost)!){
                buyLaser(index: index)
                print("purchase sucessful")
            }else{
                print("not enout points")
            }
            
        }else if(PlayerAttributes.sharedPlayerAttributes.getLaserIndex() == index){
            print("laser already equipped")
            
        }else if(purchasedLasers[index]){
            PlayerAttributes.sharedPlayerAttributes.setLaser(laser: index)
        }
        let reloadIndexPathTable = IndexPath(row: 1, section: 0)
        let cell = welcomeTableView.cellForRow(at: reloadIndexPathTable) as! LaserTableViewCell
        let reloadIndexPathCollection = IndexPath(row: index, section: 0)
        cell.laserCollectionView.reloadItems(at: [reloadIndexPathCollection])
        
        
    }
    
}


