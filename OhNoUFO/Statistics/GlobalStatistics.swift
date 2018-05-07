//
//  GlobalStatistics.swift
//  OhNoUFO
//
//  Created by Aaron Boswell on 2018-05-06.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
public class GlobalStatistics{
    
    static var sharedGlobalStatistics:GlobalStatistics = GlobalStatistics()

    public func canSpendScore(cost : Int) -> Bool{
        if totalScore > cost{
            return true
        }
        return false
    }

    public func spendScore(cost : Int){
        totalScore = totalScore - cost
    }
    
    public func updateFromReport(report : RoundReport){
        maxRoundScore = max(report.roundStatistics.score, maxRoundScore)
        maxEnemiesDestroyed = max(report.roundStatistics.enemiesDestroyed, maxEnemiesDestroyed)
        maxLazersFired = max(report.roundStatistics.lasersFired, maxLazersFired)
        maxAccuracy = max(report.roundStatistics.accuracy, maxAccuracy)
        maxWave = max(report.roundStatistics.wave, maxWave)
        
        totalEnemiesDestroyed += report.roundStatistics.enemiesDestroyed
        totalStars += report.totalStars
        totalWaves += report.roundStatistics.wave
        totalLazersFired += report.roundStatistics.lasersFired
        totalScore += report.roundStatistics.score
    }
    //MARK: - MAX
    private(set) var maxRoundScore:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundScoreMax") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundScoreMax")
            defaults.synchronize()
        }
    };
    
    private(set) var maxEnemiesDestroyed:Int{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundEnemiesDestroyedMax") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundEnemiesDestroyedMax")
            defaults.synchronize()
        }
    };
    private(set) var maxLazersFired:Int{
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
    
    private(set) var maxAccuracy:Double{
        get {
            return UserDefaults.standard.object(forKey: "lastRoundAccuracyMax") as? Double ?? 0.0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "lastRoundAccuracyMax")
            defaults.synchronize()
        }
    };
    
    private(set) var maxWave:Int{
        get {
            return UserDefaults.standard.object(forKey: "maxWave") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "maxWave")
            defaults.synchronize()
        }
    };
    //MARK: - Sum total
    private(set) var totalEnemiesDestroyed:Int{
        get {
            return UserDefaults.standard.object(forKey: "sumTotalEnemiesDestroyed") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "sumTotalEnemiesDestroyed")
            defaults.synchronize()
        }
    };
    
    private(set) var totalStars:Int{
        get {
            return UserDefaults.standard.object(forKey: "sumTotalStars") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "sumTotalStars")
            defaults.synchronize()
        }
    };
    
    private(set) var totalWaves:Int{
        get {
            return UserDefaults.standard.object(forKey: "totalWaves") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "totalWaves")
            defaults.synchronize()
        }
    };
    private(set) var totalLazersFired:Int{
        get {
            return UserDefaults.standard.object(forKey: "totalLazersFired") as? Int ?? 0
            
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "totalLazersFired")
            print("value")
            print(newValue)
            print("value")
            defaults.synchronize()
        }
    };
    
    private(set) var totalScore:Int{
        get {
            return UserDefaults.standard.object(forKey: "score") as? Int ?? 0
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: "score")
            defaults.synchronize()
        }
    };

}
