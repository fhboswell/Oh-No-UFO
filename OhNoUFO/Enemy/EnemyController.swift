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
    
    //MARK: - Lifecycle
    init(level: Int){
        
        self.level = level
        
    }
    
    
    func fireAllLazers(){
        for enemy in enemies{

            self.enemyLazersController?.fireLaser(enemyNode: enemy.enemyNode)
            
        }
        
    }
    
    
    
    //MARK: - Init Control Nodes
    func addEnemyShips(){
        for index in 1...enemyTotal {
            let heightOfControlNode = (Double(index%6)/5.0) - 1
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
