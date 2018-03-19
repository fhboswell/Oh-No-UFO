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

class WelcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    //MARK: Instance Varriables
    @IBOutlet var welcomeTableView: UITableView!
    @IBOutlet var welcomeSceneView: SCNView!
    
    var scene: WelcomeScene?
    
    //MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       scene?.isPaused = false
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

    }
    
    //MARK: - scene
    func setupScene(){
        self.scene = WelcomeScene()
        welcomeSceneView.backgroundColor = UIColor.black
        welcomeSceneView.autoenablesDefaultLighting = true
        
        self.welcomeSceneView.scene = scene
        self.scene?.initializeScene()
    }
    
    
    //MARK: - Game Setup Logic
    func prepareToPlay(){
        PlayerAttributes.sharedPlayerAttributes.resetLives()
    }
    
    func playArcade(){
        performSegue(withIdentifier: "playGame", sender: nil)
    }
    
    //MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArcadeMode", for: indexPath) as! ArcadeModeCell
        cell.initalize()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.row == 0){
            prepareToPlay()
            playArcade()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


