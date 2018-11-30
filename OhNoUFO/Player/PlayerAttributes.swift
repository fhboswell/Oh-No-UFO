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
            defaults.set(newValue, forKey: "lives")
            defaults.synchronize()
        }
    };
    private var powerups:[Int]{
        get {
            return UserDefaults.standard.object(forKey: "powerups4") as? [Int] ?? []
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "powerups4")
            defaults.synchronize()
        }
    };
    
    
    private var laser: Int{
        get {
            return UserDefaults.standard.object(forKey: "laser") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "laser")
            defaults.synchronize()
        }
    };
   
    
    private var immunity = false

    private func unlockLasers(){
        if (GlobalStatistics.sharedGlobalStatistics.totalEnemiesDestroyed > 30){
            unlockedLasers[3] = true
        }
        if (GlobalStatistics.sharedGlobalStatistics.totalEnemiesDestroyed > 60){
            unlockedLasers[4] = true
        }
        if (GlobalStatistics.sharedGlobalStatistics.totalEnemiesDestroyed > 300){
            unlockedLasers[5] = true
        }
        if (GlobalStatistics.sharedGlobalStatistics.totalEnemiesDestroyed > 400){
            unlockedLasers[6] = true
        }
       
        
    }
    
    public func getPowerups() -> [Int]{
        return powerups
    }
    public func addPowerup(index: Int){
        powerups.append(index)
    }
    
    public func getLaser() -> Laser{
        return laserList[self.laser]
    }
    public func getLaserIndex() -> Int{
        return self.laser
    }
    //needs to be an int to get set to defaults
    public func setLaser(laser: Int){
        self.laser = laser
    }
    public func usePowerup(index: Int){
        powerups[index - 1] = 100
        
    }
    public func realignPowerups(){
        powerups = powerups.filter { $0 != 100 }
    }
    public func getLaserInt() -> Int{
        return self.laser
    }
    
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
