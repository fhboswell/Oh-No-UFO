//
//  EnemyWaves.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/20/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation

class WaveAttributes{
    static var sharedWaveAttributes:WaveAttributes = WaveAttributes()
    
    var totalWaves = 1
    var currentWave = 0
    

    /*
    TODO: - Messy index
     
    Messy im sure there is a better way to handel index VS number
 
    NOTE:    Much of this would be fixed if this singleton holds the enemy double array currently in enemyController
 
     */
    func incrementCurrentWave() -> Bool{
        if currentWave < waveList.count{
            currentWave = currentWave + 1
            return true
        }else{
            return false
        }
        
    }
    func getCurrentWaveObject() -> Wave{
        return waveList[currentWave - 1]
    }
    func getCurrentWaveNumber() -> Int{ //not usually used
        return currentWave
    }
    func getCurrentWaveIndex() -> Int{
        return currentWave - 1
    }
  
    var waveList: [Wave] = {
        
        var waveList = [Wave]()
        
        var total = 12
        var type = [0 , 1]
        var stagger = [0.2, 0.2]
        
        var newWave:Wave = Wave(total: total, type: type, stagger: stagger)
        waveList.append(newWave)
        
    
        
        var newWave2:Wave = Wave(total: total, type: type, stagger: stagger)
        waveList.append(newWave2)
        
     
        
        var newWave3:Wave = Wave(total: total, type: type, stagger: stagger)
        waveList.append(newWave3)
        
        
        
        
        
        
        
        return waveList
        
        
    }()

}
