//
//  EnemyController.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/13/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import SceneKit


class GameController{
    
     //MARK: - Instance Varriables
    let level:Int
    var currentWave = 0
    var wavesInPlay = [WaveController]()
    
    
    
    var hits = 0
    
    //MARK: - Lifecycle
    init(level: Int){
        
        self.level = level
        
    }

    func hitOnEnemy(){
        hits = hits + 1
        if hits%8 == 0{
            incrementWave()
        }
    }
    func incrementWave(){
        currentWave = currentWave + 1
        let nextCuratedWaveIndex = Int(arc4random_uniform(UInt32(DefaultGameSettings.preCuratedWavesList.count)))

        let nextWaveParameters = DefaultGameSettings.preCuratedWavesList[nextCuratedWaveIndex]
        wavesInPlay.append(WaveController.init(wave: Wave(enemyParameters: nextWaveParameters)))
    }
    func hitEnemyWithNode(_ enemy : SCNNode){
        for wave in wavesInPlay{
            wave.enemiesInWave = (wave.enemiesInWave.filter{ $0.enemyNode !== enemy })

        }
        hitOnEnemy()
    }
   
}
