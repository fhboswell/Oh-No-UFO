//
//  WelcomeViewController.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/16/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit

class WelcomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    //MARK: Instance Varriables
    @IBOutlet var welcomeTableView: UITableView!
    
    //MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeTableView.delegate = self
        welcomeTableView.dataSource = self

    }
    
    //MARK: - Game Setup Logit
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
        tableView.deselectRow(at: indexPath, animated: false)
        if (indexPath.row == 0){
            prepareToPlay()
            playArcade()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


