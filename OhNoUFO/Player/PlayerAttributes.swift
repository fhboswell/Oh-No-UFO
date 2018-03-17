//
//  PlayerAttributes.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/16/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation

class PlayerAttributes{
    static var sharedPlayerAttributes:PlayerAttributes = PlayerAttributes()
    
    private var lives = 3;
    private var score = 0;
    
    private var immunity = false
    
    
    public func resetLives(){
        self.lives = 3
    }
    public func removeOneLife() -> Bool{
        
        if(immunity == false){
            immunity = true
            self.lives = self.lives - 1
            DispatchQueue.main.async {
                
                Timer.scheduledTimer(withTimeInterval: TimeInterval(2), repeats: false) {_ in
                    self.immunity = false
                }
            }
            if(self.lives == 0){
                return false
            }else{
                return true
            }
           
        }
       return true
    }
   
    public func getLives() -> Int{
        return lives
    }
}
