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
    
    private var lives:Int{
        get {
            return UserDefaults.standard.object(forKey: "lives") as? Int ?? 3
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "SavedTasksList")
            defaults.synchronize()
        }
    };
    private var score:Int{
        get {
            return UserDefaults.standard.object(forKey: "score") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "score")
            defaults.synchronize()
        }
    };
    private var currentGameScore = 0
    
    private var laser: Laser{
        get {
            return UserDefaults.standard.object(forKey: "laser") as? Laser ?? laserList[0]
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "laser")
            defaults.synchronize()
        }
    };
    private var immunity = false
    
    
    
    public func addToCurrentGameScore(amount: Int) -> Int{
        currentGameScore = currentGameScore + amount
        score = score + amount
        return currentGameScore
    }
    
    
    public func getLaser() -> Laser{
        return self.laser
    }
    public func setLaser(laser: Laser){
        self.laser = laser
    }
    
    public func resetLives(){
        self.lives = 3
    }
    public func resetScore(){
        self.currentGameScore = 0
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
                score = score + currentGameScore
                
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
