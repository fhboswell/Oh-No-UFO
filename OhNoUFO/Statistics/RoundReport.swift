//
//  RoundReport.swift
//  OhNoUFO
//
//  Created by Aaron Boswell on 2018-05-06.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
public class RoundReport{
    
    static var lastRoundReport : RoundReport?
    
    var roundStatistics : RoundStatistics
    var scoreStars : Int
    var enemiesDestroyedStars : Int
    var lasersFiredStars : Int
    var accuracyStars : Int
    var totalStars : Int{
        get{
            return scoreStars + enemiesDestroyedStars + lasersFiredStars + accuracyStars
        }
    }
    init(statistics : RoundStatistics){
        roundStatistics = statistics
        
        func stars(max : Double, last : Double) -> Int{
            if (last > max){
                return  3
            } else  if (Double(last) > (Double (max)  * 0.8)){
                return 2
            }else  if (Double(last) > (Double (max)   * 0.6)){
                return 1
            }else{
                return 0
            }
        }
        
        scoreStars = stars(max: Double(GlobalStatistics.sharedGlobalStatistics.maxRoundScore), last: Double(roundStatistics.score))
        enemiesDestroyedStars = stars(max: Double(GlobalStatistics.sharedGlobalStatistics.maxEnemiesDestroyed), last: Double(roundStatistics.enemiesDestroyed))
        lasersFiredStars = stars(max: Double(GlobalStatistics.sharedGlobalStatistics.maxLazersFired), last: Double(roundStatistics.lasersFired))
        accuracyStars = stars(max: GlobalStatistics.sharedGlobalStatistics.maxAccuracy, last: roundStatistics.accuracy)
    }
    

}
