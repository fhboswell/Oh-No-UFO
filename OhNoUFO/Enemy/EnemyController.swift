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


class EnemyController{
    
     //MARK: - Instance Varriables
    let level:Int
    var rootNodeDelegate: SceneRootNodeAccessDelegate?
    var playerLocationDelegate: PlayerLocationAccessDelegate?
    
    var enemies = [Enemy]()
    
    
    var enemyTotal = 12
    
    var enemyLazersController: EnemyLazersController? = nil
    
    var hits = 0
    
    //MARK: - Lifecycle
    init(level: Int){
        
        self.level = level
        
    }
    
    
    func fireAllLazers(){//This needs to be phased out
        for enemy in enemies{
            self.enemyLazersController?.fireLaser(enemyNode: enemy.enemyNode)
        }
    }
    func hitOnEnemy(){
        hits = hits + 1
        if hits%3 == 0{
            addEnemyShips()
        }
    }
    
    //MARK: - Run Wave Generator
    func addEnemyShips(){
        if (WaveAttributes.sharedWaveAttributes.incrementCurrentWave()){
        
            var wave:Wave =  WaveAttributes.sharedWaveAttributes.getCurrentWaveObject()
            var index = WaveAttributes.sharedWaveAttributes.getCurrentWaveIndex()
            
            
            var enemyTypeCount = wave.type.count - 1
            var enemysPerType = wave.total/wave.type.count - 1
            
            for index in 0...enemyTypeCount{
                
                var accumeStagger = -1.0
                
                for subIndex in 0...enemysPerType{
                     accumeStagger = accumeStagger + wave.stagger[index]
                    let position = SCNVector3(0, accumeStagger, 0)
                    let newEnemy = Enemy(wave.type[index], position, nil)
                    enemies.append(newEnemy)
                    
                    self.rootNodeDelegate?.addToRootNode(nodeToAdd: newEnemy.controlNode)
                    newEnemy.animate()
                }
                
                
            }
        }
    
    
        
    }
    
    //MARK: - Init Control Nodes
    func dep(){
        for index in 1...enemyTotal {
            let heightOfControlNode = (Double(index%6)/5.0) - 1
            print(heightOfControlNode)
            let position = SCNVector3(0, heightOfControlNode, 0)
            
            if (enemies.count < (enemyTotal/2)+1 ){
                let newEnemy = Enemy(0, position, nil)
                enemies.append(newEnemy)
                self.rootNodeDelegate?.addToRootNode(nodeToAdd: newEnemy.controlNode)
                newEnemy.animate()
            }
            else{
                let newEnemy = Enemy(1, position, nil)
                enemies.append(newEnemy)
                self.rootNodeDelegate?.addToRootNode(nodeToAdd: newEnemy.controlNode)
                newEnemy.animate()
            }

        }
        
    }
    
   
    func prepareEnemyLazerController(){
        if (self.enemyLazersController == nil) {
            self.enemyLazersController = EnemyLazersController(level: 1)
            self.enemyLazersController?.playerLocationDelegate = playerLocationDelegate
            self.enemyLazersController?.rootNodeDelegate = rootNodeDelegate
        }
    }
   
}
