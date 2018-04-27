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
        
        var closureToGenerateResourceAction = { () -> SCNAction in //name these with human names "parade action" or UFO spin
            var random = arc4random_uniform(5)
            let interval = Double(random)/10.0
            let waitAction = SCNAction.wait(duration: interval)
            random = arc4random_uniform(20) + 20
            var rotateAction = SCNAction.rotateBy(x: 0, y: CGFloat(random + 10), z: 0, duration: 20)
            return SCNAction.group([waitAction,rotateAction])
        }
        
        var name = "UFO2.dae"
        var scale = SCNVector3(0.2, 0.2, 0.2)
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
        
        var enemyTypeOne = EnemyType(name, scale, position, offset, closureToGenerateControlAction, closureToGenerateResourceAction)
        var enemyTypeTwo = EnemyType(name, scale, position, offset, closureToGenerateControlAction2, closureToGenerateResourceAction)
        var enemyTypeThree = EnemyType(name, scale, position, offset, closureToGenerateControlAction3, closureToGenerateResourceAction)
        var enemyTypeFour = EnemyType(name, scale, position, offset, closureToGenerateControlAction4, closureToGenerateResourceAction)
        var enemyTypeFive = EnemyType(name, scale, position, offset, closureToGenerateControlAction5, closureToGenerateResourceAction)
        var enemyTypeSix = EnemyType(name, scale, position, offset, closureToGenerateControlAction6, closureToGenerateResourceAction)
        
        
        name = "UFO.dae"
        scale = SCNVector3(0.01, 0.01, 0.01)
        offset = SCNVector3(0,0,2.5)
        
        var closureToGenerateControlAction7 = { () -> SCNAction in //name these with human names "parade action"
            var random = arc4random_uniform(200)
            var interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.05), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction,moveAction])
        }
        var closureToGenerateControlAction8 = { () -> SCNAction in //name these with human names "parade action left"
            let random = arc4random_uniform(200)
            let interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.05), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction, moveAction])
        }
        
        var closureToGenerateControlAction9 = { () -> SCNAction in //name these with human names "parade action"
            var random = arc4random_uniform(200)
            var interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.2), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction,moveAction])
        }
        var closureToGenerateControlAction10 = { () -> SCNAction in //name these with human names "parade action left"
            let random = arc4random_uniform(200)
            let interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.3), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction, moveAction])
        }
        var closureToGenerateControlAction11 = { () -> SCNAction in //name these with human names "parade action"
            var random = arc4random_uniform(200)
            var interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.45), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction,moveAction])
        }
        var closureToGenerateControlAction12 = { () -> SCNAction in //name these with human names "parade action left"
            let random = arc4random_uniform(200)
            let interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.45), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let waitAction = SCNAction.wait(duration: interval)
            return SCNAction.group([waitAction, moveAction])
        }
        
      
        
        
        
      
        //parade
        
        
        
        //cross
        var enemyTypeSeven = EnemyType(name, scale, position, offset, closureToGenerateControlAction7, closureToGenerateResourceAction)
        var enemyTypeEight = EnemyType(name, scale, position, offset, closureToGenerateControlAction8, closureToGenerateResourceAction)
        var enemyTypeNine = EnemyType(name, scale, position, offset, closureToGenerateControlAction9, closureToGenerateResourceAction)
        var enemyTypeTen = EnemyType(name, scale, position, offset, closureToGenerateControlAction10, closureToGenerateResourceAction)
        var enemyType11 = EnemyType(name, scale, position, offset, closureToGenerateControlAction11, closureToGenerateResourceAction)
        var enemyType12 = EnemyType(name, scale, position, offset, closureToGenerateControlAction12, closureToGenerateResourceAction)
        
        
        
     
        
        var enemyTypes = [EnemyType]()
        
        enemyTypes.append(enemyTypeOne)
        enemyTypes.append(enemyTypeTwo)
        enemyTypes.append(enemyTypeThree)
        enemyTypes.append(enemyTypeFour)
        enemyTypes.append(enemyTypeFive)
        enemyTypes.append(enemyTypeSix)
        
        
        enemyTypes.append(enemyTypeSeven)
        enemyTypes.append(enemyTypeEight)

        enemyTypes.append(enemyTypeNine)
        enemyTypes.append(enemyTypeTen)
        enemyTypes.append(enemyType11)
        enemyTypes.append(enemyType12)
//        enemyTypes.append(enemyType13)
//        enemyTypes.append(enemyType14)
//
//        enemyTypes.append(enemyType15)
//        enemyTypes.append(enemyType16)
//
//        enemyTypes.append(enemyType17)
//        enemyTypes.append(enemyType18)
//        enemyTypes.append(enemyType19)
//        enemyTypes.append(enemyType20)
//
        
        return enemyTypes
    }()
    
    private static func makeSymetricalWaveForParams(total : Int, type: [Int], stagger : [SCNVector3]) -> [EnemyInstantiationParameters]{
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
                let enemyInstantiationParameters = EnemyInstantiationParameters(type[index], accumeStagger, nil, nil)
                paramArray.append(enemyInstantiationParameters)
            }
        }
        return paramArray
    }
    private static func makeSingleUFOWaveForParams(total : Int, type: [Int], stagger : [SCNVector3]) -> [EnemyInstantiationParameters]{
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
                let enemyInstantiationParameters = EnemyInstantiationParameters(type[index], nil, accumeStagger, nil)
                paramArray.append(enemyInstantiationParameters)
            }
        }
        return paramArray
    }
    //test
    
    static var preCuratedWavesList: [[EnemyInstantiationParameters]] = {
        
        var waveList = [[EnemyInstantiationParameters]]()
        

        
//        var total = 12
//        var type = [16 , 17, 18,19]
//        var stagger = [SCNVector3(0.4,0,0), SCNVector3(0.4,0,0),SCNVector3(0.4,0,0), SCNVector3(0.4,0,0)]
//
//        var newWave = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
//        waveList.append(newWave)

        var total = 12
        var type = [10 , 11 ,12 ,13, 14, 15]
        
        var stagger = [SCNVector3(0,0.2,0), SCNVector3(0,0.2,0),SCNVector3(0,0.2,0),SCNVector3(0,0.2,0),SCNVector3(0.4,0,0),SCNVector3(0.4,0,0)]
//
//        var newWave2 = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
//        waveList.append(newWave2)


        total = 12
        type = [0 , 1 ,2 ,3]
        stagger = [SCNVector3(0,0.2,0), SCNVector3(0,0.2,0),SCNVector3(0,0.2,0),SCNVector3(0,0.2,0)]
        
        var newWave3 = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
        waveList.append(newWave3)
        
        total = 12
        type = [7 , 8 ,9 ,10]
        stagger = [SCNVector3(0,0.2,0), SCNVector3(0,0.2,0),SCNVector3(0,0.2,0),SCNVector3(0,0.2,0)]
        
        var newWave4 = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
        waveList.append(newWave4)
        
        
        
//        total = 10
//        type = [8 , 9]
//        stagger = [SCNVector3(0.2,0,0.4), SCNVector3(0.2,0,0.4)]
//
//        var newWave4 = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
//        waveList.append(newWave4)
        
        
        /*
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
   */
        return waveList
        
        
    }()
            
}
