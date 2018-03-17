//
//  WelcomeViewController.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/16/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//


import UIKit

class WelcomeViewController: UIViewController {
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        
    }
    
    @IBAction func showARSimulation(){
        print("Play")
        PlayerAttributes.sharedPlayerAttributes.resetLives()
        performSegue(withIdentifier: "playGame", sender: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
   
    
}


