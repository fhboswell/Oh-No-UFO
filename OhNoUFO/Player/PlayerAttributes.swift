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
            return UserDefaults.standard.object(forKey: "powerups2") as? [Int] ?? []
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "powerups2")
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
    
    
    private var lastRoundScore:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundScore") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundScore")
            defaults.synchronize()
        }
    };
    
    private var lastRoundEnemiesDestroyed:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundEnemiesDestroyed") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundEnemiesDestroyed")
            defaults.synchronize()
        }
    };
    private var lastRoundLasersFired:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundLasersFired") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundLasersFired")
            defaults.synchronize()
        }
    };
    
    private var lastRoundAccuracy:Double{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundAccuracy") as? Double ?? 0.0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundAccuracy")
            defaults.synchronize()
        }
    };
    
    //MARK: - MAX
    private var lastRoundScoreMax:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundScoreMax") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundScoreMax")
            defaults.synchronize()
        }
    };
    
    private var lastRoundEnemiesDestroyedMax:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundEnemiesDestroyedMax") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundEnemiesDestroyedMax")
            defaults.synchronize()
        }
    };
    private var lastRoundLasersFiredMax:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundLasersFiredMax") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundLasersFiredMax")
            print("value")
            print(newValue)
            print("value")
            defaults.synchronize()
        }
    };
    
    private var lastRoundAccuracyMax:Double{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundAccuracyMax") as? Double ?? 0.0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundAccuracyMax")
            defaults.synchronize()
        }
    };
    
    //MARK: - star value
    private var lastRoundScoreStar:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundScoreStar") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundScoreStar")
            defaults.synchronize()
        }
    };
    
    private var lastRoundEnemiesDestroyedStar:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundEnemiesDestroyedStar") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundEnemiesDestroyedStar")
            defaults.synchronize()
        }
    };
    private var lastRoundLasersFiredStar:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundLasersFiredStar") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundLasersFiredStar")
            defaults.synchronize()
        }
    };
    
    private var lastRoundAccuracyStar:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundAccuracyStar") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundAccuracyStar")
            defaults.synchronize()
        }
    };
    
    //MARK: - Sum total
    private var sumTotalEnemiesDestroyed:Int{
        get {
            return UserDefaults.standard.object(forKey: "sumTotalEnemiesDestroyed") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "sumTotalEnemiesDestroyed")
            defaults.synchronize()
        }
    };
    
    private var sumTotalStars:Int{
        get {
            return UserDefaults.standard.object(forKey: "sumTotalStars") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "sumTotalStars")
            defaults.synchronize()
        }
    };
    
    private var lastWave:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastWave") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastWave")
            defaults.synchronize()
        }
    };
    private var maxWave:Int{
        get {
            return UserDefaults.standard.object(forKey: "maxWave") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "maxWave")
            defaults.synchronize()
        }
    };
    
    
    private var currentGameScore = 0
   
    
    private var immunity = false
    
    public func reduceScore(price: Int){
        score = score - price
    }
    
    public func addToCurrentGameScore(amount: Int) -> Int{
        currentGameScore = currentGameScore + amount
        score = score + amount
        return currentGameScore
    }
    
    public func updateLaserEnemyCount(lasersCount : Int, enemyCount: Int, wave: Int){
        
        lastRoundLasersFired = lasersCount
        lastRoundEnemiesDestroyed = enemyCount
        
        if(lastRoundLasersFired != 0){
            lastRoundAccuracy = Double(lastRoundEnemiesDestroyed) / Double(lastRoundLasersFired)
        }
        else{
            lastRoundAccuracy = 0
        }
        sumTotalEnemiesDestroyed += lastRoundEnemiesDestroyed
        lastWave = wave
        
        findMax()
        unlockLasers()
        print(sumTotalEnemiesDestroyed)
        
        
    }
    func getLastWave() -> Int{
        return lastWave
        
    }
    func getMaxWave() -> Int{
        return maxWave
        
    }
    private func unlockLasers(){
        if (sumTotalEnemiesDestroyed > 30){
            unlockedLasers[3] = true
        }
        if (sumTotalEnemiesDestroyed > 60){
            unlockedLasers[4] = true
        }
        if (sumTotalEnemiesDestroyed > 300){
            unlockedLasers[5] = true
        }
        if (sumTotalEnemiesDestroyed > 400){
            unlockedLasers[6] = true
        }
       
        
    }
        
    private func findMax(){
        
        if (lastRoundScore > lastRoundScoreMax){
            lastRoundScoreMax = lastRoundScore
            lastRoundScoreStar = 3
        } else  if (Double(lastRoundScore) > (Double (lastRoundScoreMax)  * 0.8)){
            lastRoundScoreStar = 2
        }else  if (Double(lastRoundScore) > (Double (lastRoundScoreMax)  * 0.6)){
            lastRoundScoreStar = 1
        }else{
            lastRoundScoreStar = 0
        }
        
        if (lastRoundEnemiesDestroyed > lastRoundEnemiesDestroyedMax){
            lastRoundEnemiesDestroyedMax = lastRoundEnemiesDestroyed
            lastRoundEnemiesDestroyedStar = 3
        } else  if (Double(lastRoundEnemiesDestroyed) > (Double (lastRoundEnemiesDestroyedMax)  * 0.8)){
            lastRoundEnemiesDestroyedStar = 2
        }else  if (Double(lastRoundEnemiesDestroyed) > (Double (lastRoundEnemiesDestroyedMax)  * 0.6)){
            lastRoundEnemiesDestroyedStar = 1
        }else{
            lastRoundEnemiesDestroyedStar = 0
        }
        
        if (lastRoundLasersFired > lastRoundLasersFiredMax){
            lastRoundLasersFiredMax = lastRoundLasersFired
            lastRoundLasersFiredStar = 3
        } else  if (Double(lastRoundLasersFired) > (Double (lastRoundLasersFiredMax)  * 0.8)){
            lastRoundLasersFiredStar = 2
        }else  if (Double(lastRoundLasersFired) > (Double (lastRoundLasersFiredMax)  * 0.6)){
            lastRoundLasersFiredStar = 1
        }else{
            lastRoundLasersFiredStar = 0
        }
        
        if (lastRoundAccuracy > lastRoundAccuracyMax){
            lastRoundAccuracyMax = lastRoundAccuracy
            lastRoundAccuracyStar = 3
        } else  if (Double(lastRoundAccuracy) > (Double (lastRoundAccuracyMax)  * 0.8)){
            lastRoundLasersFiredStar = 2
        }else  if (Double(lastRoundAccuracy) > (Double (lastRoundAccuracyMax)   * 0.6)){
            lastRoundAccuracyStar = 1
        }else{
            lastRoundAccuracyStar = 0
            
        }
        if(lastWave > maxWave){
            maxWave = lastWave
        }
        print(lastRoundAccuracyStar)
        print(lastRoundLasersFiredStar)
        print(lastRoundEnemiesDestroyedStar)
        print(lastRoundScoreStar)
    }
    public func getPowerups() -> [Int]{
        return powerups
    }
    public func addPowerup(index: Int){
        powerups.append(index)
    }
    
    public func getLastRoundLasersFired() -> Int{
        return lastRoundLasersFired
    }
    
    public func getLastRoundEnemiesDestroyed() -> Int{
        return lastRoundEnemiesDestroyed
    }
    public func getLastRoundAccuracy() -> Double{
        return lastRoundAccuracy
    }
    
    public func getScoreStars() -> Int{
        return lastRoundScoreStar
    }
    public func getEnemyStars() -> Int{
        return lastRoundEnemiesDestroyedStar
    }
    public func getLaserStars() -> Int{
        return lastRoundLasersFiredStar
    }
    public func getAccuracyStars() -> Int{
        return lastRoundAccuracyStar
    }

    
    public func getLastRoundScore() -> Int{
        return lastRoundScore
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
    
    public func resetLives(){
        self.lives = 3
    }
    public func resetScore(){
        self.currentGameScore = 0
    }
    public func getScore() -> Int{
        return score
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
                lastRoundScore = currentGameScore
                
                
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
