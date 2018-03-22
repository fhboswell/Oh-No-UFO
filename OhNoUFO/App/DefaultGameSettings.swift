//
//  DefaultGameSettings.swift
//  OhNoUFO
//
//  Created by Aaron Boswell on 2018-03-21.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import SceneKit

class DefaultGameSettings{
    
    //Setup the important info for each enemy type
    //The actions are prepared in closures in order to make sure they are random each time
    
    /*
     A sequence action
     has multiple child actions. Each action in the sequence begins after the previous action ends.
     A group action
     has multiple child actions. All actions stored in the group begin executing at the same time.
     A repeating action
     stores a single child action. When the child action completes, it is restarted.
     */
    
    static var enemyTypes : [EnemyType] = {
        var name = "UFO2.dae"
        var offset = SCNVector3(0,0,2.5)
        var position : SCNVector3? = nil
        
        var closureToGenerateControlAction = { () -> SCNAction in //name these with human names "parade action"
            var random = arc4random_uniform(200)
            var interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction,moveAction])
        }
        var closureToGenerateControlAction2 = { () -> SCNAction in //name these with human names "parade action left"
            let random = arc4random_uniform(200)
            let interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.1), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction, moveAction])
        }
        
        var closureToGenerateControlAction3 = { () -> SCNAction in //name these with human names "parade action"
            var random = arc4random_uniform(200)
            var interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.3), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction,moveAction])
        }
        var closureToGenerateControlAction4 = { () -> SCNAction in //name these with human names "parade action left"
            let random = arc4random_uniform(200)
            let interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.3), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction, moveAction])
        }
        var closureToGenerateControlAction5 = { () -> SCNAction in //name these with human names "parade action"
            var random = arc4random_uniform(200)
            var interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.45), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction,moveAction])
        }
        var closureToGenerateControlAction6 = { () -> SCNAction in //name these with human names "parade action left"
            let random = arc4random_uniform(200)
            let interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.45), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction, moveAction])
        }
        
        var closureToGenerateControlAction7 = { () -> SCNAction in //name these with human names "parade action"
            
            let rightAction = SCNAction.moveBy(x: -2, y: 0, z: -2, duration: 0)
            let crossAction = SCNAction.moveBy(x: 4, y: 0, z: -6, duration: 5)
            let firstAction = SCNAction.group([rightAction,crossAction])
            let center = SCNAction.rotateBy(x: 0, y: -CGFloat((Double.pi - 0.45)/2.0), z: 0, duration: 5)
            let straight = SCNAction.moveBy(x: 0, y: 0, z: 8, duration: 5)
            let secondMove = SCNAction.group([center,straight])
            let last = SCNAction.rotateBy(x: 0, y: CGFloat((Double.pi - 0.45)/2.0), z: 0, duration: 5)
            let last2 = SCNAction.moveBy(x: -2, y: 0, z: 0, duration: 0)
            let last3 = SCNAction.group([last,last2])
            var all =  SCNAction.sequence([firstAction,secondMove,last3])
            return SCNAction.repeat(all, count: 4)
        }
        
        var closureToGenerateControlAction8 = { () -> SCNAction in //name these with human names "parade action"
            
            let rightAction = SCNAction.moveBy(x: 2, y: 0, z: -2, duration: 0.5)
            let crossAction = SCNAction.moveBy(x: -4, y: 0, z: -6, duration: 5)
            let firstAction =  SCNAction.sequence([rightAction,crossAction])
            let center = SCNAction.rotateBy(x: 0, y: CGFloat((Double.pi - 0.45)/2.0), z: 0, duration: 5)
            let straight = SCNAction.moveBy(x: 0, y: 0, z: 8, duration: 5)
            let secondMove = SCNAction.group([center,straight])
            let last = SCNAction.rotateBy(x: 0, y: -CGFloat((Double.pi - 0.45)/2.0), z: 0, duration: 5)
            
            let last2 = SCNAction.moveBy(x: 2, y: 0, z: 0, duration: 0)
            let last3 = SCNAction.group([last,last2])
            var all =  SCNAction.sequence([firstAction,secondMove,last3])
            return SCNAction.repeat(all, count: 4)
        }
        
        
        
        var closureToGenerateResourceAction = { () -> SCNAction in //name these with human names "parade action" or UFO spin
            var random = arc4random_uniform(5)
            let interval = Double(random)/10.0
            let waitAction = SCNAction.wait(duration: interval)
            random = arc4random_uniform(20) + 20
            var rotateAction = SCNAction.rotateBy(x: 0, y: CGFloat(random + 10), z: 0, duration: 20)
            return SCNAction.group([waitAction,rotateAction])
        }
        //parade
        var enemyTypeOne = EnemyType(name, position, offset, closureToGenerateControlAction, closureToGenerateResourceAction)
        var enemyTypeTwo = EnemyType(name, position, offset, closureToGenerateControlAction2, closureToGenerateResourceAction)
        var enemyTypeThree = EnemyType(name, position, offset, closureToGenerateControlAction3, closureToGenerateResourceAction)
        var enemyTypeFour = EnemyType(name, position, offset, closureToGenerateControlAction4, closureToGenerateResourceAction)
        var enemyTypeFive = EnemyType(name, position, offset, closureToGenerateControlAction5, closureToGenerateResourceAction)
        var enemyTypeSix = EnemyType(name, position, offset, closureToGenerateControlAction6, closureToGenerateResourceAction)
        
        //cross
        var enemyTypeSeven = EnemyType(name, position, offset, closureToGenerateControlAction7, closureToGenerateResourceAction)
        var enemyTypeEight = EnemyType(name, position, offset, closureToGenerateControlAction8, closureToGenerateResourceAction)
        
        
        
        
        var enemyTypes = [EnemyType]()
        
        enemyTypes.append(enemyTypeOne)
        enemyTypes.append(enemyTypeTwo)
        enemyTypes.append(enemyTypeThree)
        enemyTypes.append(enemyTypeFour)
        enemyTypes.append(enemyTypeFive)
        enemyTypes.append(enemyTypeSix)
        enemyTypes.append(enemyTypeSeven)
        enemyTypes.append(enemyTypeEight)
        
        
        return enemyTypes
    }()
    
    static func makeSymetricalWaveForParams(total : Int, type: [Int], stagger : [SCNVector3]) -> [EnemyInstantiationParameters]{
        var paramArray = [EnemyInstantiationParameters]()
        

        let enemyTypeCount = type.count
        let enemysPerType = total / enemyTypeCount
        
        for index in 0 ..< enemyTypeCount{
            
            var invert = SCNVector3(1, 1, 1)
            if( index%2 == 0){
                invert = SCNVector3(-1, 1, 1)
            }
            var accumeStagger = SCNVector3(0, -1.0, 0)
            
            for _ in 0 ..< enemysPerType{
                accumeStagger = accumeStagger + (stagger[index])*invert
                let enemyInstantiationParameters = EnemyInstantiationParameters(type[index], accumeStagger, nil)
                paramArray.append(enemyInstantiationParameters)
            }
        }
        return paramArray
    }
    static var preCuratedWavesList: [[EnemyInstantiationParameters]] = {
        
        var waveList = [[EnemyInstantiationParameters]]()
        
        var total = 12
        var type = [6 , 7]
        var stagger = [SCNVector3(0.1,0.2,0), SCNVector3(0.1,0.2,0)]
        
        var newWave = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
        waveList.append(newWave)
        
        type = [4 , 5]
        
        var newWave2 = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
        waveList.append(newWave2)
        
        
        type = [2 , 5]
        var newWave3 = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
        waveList.append(newWave3)
        
        type = [0 , 1]
        var newWave4 = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
        waveList.append(newWave4)
   
        return waveList
        
        
    }()
            
}