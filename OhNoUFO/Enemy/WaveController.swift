//
//  WaveController.swift
//  OhNoUFO
//
//  Created by Aaron Boswell on 2018-03-21.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
class WaveController{
    
    var wave : Wave
    var enemiesInWave = [Enemy]()
    
    init(wave : Wave){
        self.wave = wave
        addToGlobalRootNode()
    }
    
    func addToGlobalRootNode(){
        for parameters in wave.enemyParameters {
            let newEnemy = Enemy(parameters)
            enemiesInWave.append(newEnemy)
            PotentiallyUnsafeGlobals.addToRootNode(nodeToAdd: newEnemy.controlNode)
            newEnemy.animate()
            newEnemy.startFireSequence()
            
        }
    }
}
