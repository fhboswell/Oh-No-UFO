//
//  EnemyWaves.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/20/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import SceneKit

class WaveAttributes{
    static var sharedWaveAttributes:WaveAttributes = WaveAttributes()
    
    var totalWaves = 1
    var currentWave = 0
    

  
    func incrementCurrentWave() -> Bool{
        if currentWave < waveList.count{
            currentWave = currentWave + 1
            return true
        }else{
            return false
        }
        
    }
    func getCurrentWaveObject() -> Wave{
        return waveList[self.getCurrentWaveIndex()]
    }
    
    func getCurrentWaveIndex() -> Int{
        return currentWave - 1
    }
  
    var waveList: [Wave] = {
        
        var waveList = [Wave]()
        
        var total = 12
        var type = [6 , 7]
        var stagger = [SCNVector3(0.1,0.2,0), SCNVector3(0.1,0.2,0)]
        
        var newWave:Wave = Wave(total: total, type: type, stagger: stagger)
        waveList.append(newWave)
        
        type = [4 , 5]
        
        var newWave2:Wave = Wave(total: total, type: type, stagger: stagger)
        waveList.append(newWave2)
        
     
        type = [2 , 5]
        var newWave3:Wave = Wave(total: total, type: type, stagger: stagger)
        waveList.append(newWave3)
        
        type = [0 , 1]
        var newWave4:Wave = Wave(total: total, type: type, stagger: stagger)
        waveList.append(newWave4)
        
        
        
        
        
        
        
        return waveList
        
        
    }()

}
