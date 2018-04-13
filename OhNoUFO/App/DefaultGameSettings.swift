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
        
        var closureToGenerateControlAction9 = { () -> SCNAction in //name these with human names "parade action"
            let upAction = SCNAction.moveBy(x: 0.2, y: 2, z: -2, duration: 0)
            let forwardAction = SCNAction.moveBy(x: 0, y: 0, z: -4, duration: 2)
            let downAction = SCNAction.moveBy(x: 0, y: -2, z: 0, duration: 2)
            var all =  SCNAction.sequence([upAction,forwardAction])
            let backAction = SCNAction.moveBy(x: 0, y: 0, z: 4, duration: 1)
            
            let upAction2 = SCNAction.moveBy(x: 0, y: 2, z: 0, duration: 0)
            let repeatAction =  SCNAction.sequence([forwardAction,downAction,backAction, upAction2])
            let repeactA = SCNAction.repeat(repeatAction, count: 5)
            
            return SCNAction.sequence([upAction,repeactA])
            
        }
        var closureToGenerateControlAction10 = { () -> SCNAction in //name these with human names "parade action left"
            
            let upAction = SCNAction.moveBy(x: -0.2, y: 2, z: -2, duration: 0)
            let forwardAction = SCNAction.moveBy(x: 0, y: 0, z: -4, duration: 2)
            var all =  SCNAction.sequence([upAction,forwardAction])
            let downAction = SCNAction.moveBy(x: 0, y: -2, z: 0, duration: 2)
            let backAction = SCNAction.moveBy(x: 0, y: 0, z: 4, duration: 1)
            let upAction2 = SCNAction.moveBy(x: 0, y: 2, z: 0, duration: 0)
            let repeatAction =  SCNAction.sequence([forwardAction,downAction,backAction, upAction2])
            let repeactA = SCNAction.repeat(repeatAction, count: 5)
            
            return SCNAction.sequence([upAction,repeactA])
        }
        
        
        
       
        
        
        var closureToGenerateControlAction11 = { () -> SCNAction in //name these with human names "parade action"
            
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
           
            
            let rotateAround = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1)*5, z: 0, duration: 10)
            
            let repeactA = SCNAction.repeat(rotateAround, count: 5)
            let waitAction = SCNAction.wait(duration: 1.0)
            let sync = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1), z: 0, duration: 1.0)
            return SCNAction.sequence([moveAction,waitAction,sync,repeactA])
        }
        var closureToGenerateControlAction12 = { () -> SCNAction in //name these with human names "parade action left"
           
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.1), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let rotateAround = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1)*5, z: 0, duration: 10)
            
            let repeactA = SCNAction.repeat(rotateAround, count: 5)
            let waitAction = SCNAction.wait(duration: 0.5)
             let sync = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1), z: 0, duration: 1.5)
            return SCNAction.sequence([moveAction,waitAction,sync,repeactA])
        }
        
        var closureToGenerateControlAction13 = { () -> SCNAction in //name these with human names "parade action"
          
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.3), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let rotateAround = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1)*5, z: 0, duration: 10)
            
            let repeactA = SCNAction.repeat(rotateAround, count: 5)
            let waitAction = SCNAction.wait(duration: 1.5)
            let sync = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1), z: 0, duration: 0.5)
            return SCNAction.sequence([moveAction,waitAction,sync,repeactA])
        }
        var closureToGenerateControlAction14 = { () -> SCNAction in //name these with human names "parade action left"
           
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi - 0.3), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let rotateAround = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1)*5, z: 0, duration: 10)
            
            let repeactA = SCNAction.repeat(rotateAround, count: 5)
            let waitAction = SCNAction.wait(duration: 0)
            let sync = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi - 0.1), z: 0, duration: 2)
            return SCNAction.sequence([moveAction,waitAction,sync,repeactA])
        }
        var closureToGenerateControlAction15 = { () -> SCNAction in //name these with human names "parade action"
            var random = arc4random_uniform(200)
            var interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let moveUp = SCNAction.moveBy(x: 0.2, y: 0.7, z: 0, duration: 0)
            return SCNAction.group([moveUp, moveAction])
        }
        var closureToGenerateControlAction16 = { () -> SCNAction in //name these with human names "parade action left"
            let random = arc4random_uniform(200)
            let interval = Double(random)/100.0
            let moveAction = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi ), z: 0, duration: 5)
            moveAction.timingMode = .easeInEaseOut
            let moveUp = SCNAction.moveBy(x: -0.2, y: 0.7, z: 0, duration: 0)
            return SCNAction.group([moveUp, moveAction])
        }
        
        
        var closureToGenerateControlAction17 = { () -> SCNAction in //name these with human names "parade action left"
            
            let spin = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi + 1), z: 0, duration: 3)
            spin.timingMode = .easeInEaseOut
            let move = SCNAction.moveBy(x: 1, y: 0, z: 0, duration: 0)
            var moveAction = SCNAction.group([spin, move])
            
            let rotateAround = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi)/2, z: 0, duration: 2)
            rotateAround.timingMode = .easeInEaseOut
            
            let back = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi)/4, z: 0, duration: 2)
            let forth = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi)/4, z: 0, duration: 2)
            back.timingMode = .easeInEaseOut
            forth.timingMode = .easeInEaseOut
            
            var scrub =  SCNAction.sequence([back,forth])
            let repeatScrub = SCNAction.repeat(scrub, count: 5)
            return SCNAction.sequence([moveAction,rotateAround,repeatScrub])
        }
        var closureToGenerateControlAction18 = { () -> SCNAction in //name these with human names "parade action left"
            
            
            
            let spin = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi + 1), z: 0, duration: 3)
            spin.timingMode = .easeInEaseOut
            let move = SCNAction.moveBy(x: -1, y: 0.7, z: 0, duration: 0)
            var moveAction = SCNAction.group([spin, move])
            
            let rotateAround = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi)/2, z: 0, duration: 2)
            rotateAround.timingMode = .easeInEaseOut
            
            let back = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi)/4, z: 0, duration: 2)
            let forth = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi)/4, z: 0, duration: 2)
            back.timingMode = .easeInEaseOut
            forth.timingMode = .easeInEaseOut
            
            var scrub =  SCNAction.sequence([back,forth])
            let repeatScrub = SCNAction.repeat(scrub, count: 5)
            return SCNAction.sequence([moveAction,rotateAround,repeatScrub])
        }
        var closureToGenerateControlAction19 = { () -> SCNAction in //name these with human names "parade action left"
            
            let spin = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi + 1), z: 0, duration: 3)
            spin.timingMode = .easeInEaseOut
            let move = SCNAction.moveBy(x: 1, y: 0.35, z: 0, duration: 0)
            var moveAction = SCNAction.group([spin, move])
            
            let rotateAround = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi)/2, z: 0, duration: 2)
            rotateAround.timingMode = .easeInEaseOut
            
            let back = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi)/4, z: 0, duration: 2)
            let forth = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi)/4, z: 0, duration: 2)
            back.timingMode = .easeInEaseOut
            forth.timingMode = .easeInEaseOut
            
            var scrub =  SCNAction.sequence([back,forth])
            let repeatScrub = SCNAction.repeat(scrub, count: 5)
            return SCNAction.sequence([moveAction,rotateAround,repeatScrub])
        }
        var closureToGenerateControlAction20 = { () -> SCNAction in //name these with human names "parade action left"
            
            
            
            let spin = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi + 1), z: 0, duration: 3)
            spin.timingMode = .easeInEaseOut
            let move = SCNAction.moveBy(x: -1, y: 1.0, z: 0, duration: 0)
            var moveAction = SCNAction.group([spin, move])
            
            let rotateAround = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi)/2, z: 0, duration: 2)
            rotateAround.timingMode = .easeInEaseOut
            
            let back = SCNAction.rotateBy(x: 0, y: CGFloat(Double.pi)/4, z: 0, duration: 2)
            let forth = SCNAction.rotateBy(x: 0, y: -CGFloat(Double.pi)/4, z: 0, duration: 2)
            back.timingMode = .easeInEaseOut
            forth.timingMode = .easeInEaseOut
            
            var scrub =  SCNAction.sequence([back,forth])
            let repeatScrub = SCNAction.repeat(scrub, count: 5)
            return SCNAction.sequence([moveAction,rotateAround,repeatScrub])
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
        
        //bombingrun
        var enemyTypeNine = EnemyType(name, position, offset, closureToGenerateControlAction9, closureToGenerateResourceAction)
        var enemyTypeTen = EnemyType(name, position, offset, closureToGenerateControlAction10, closureToGenerateResourceAction)
        
        //orbit
        var enemyType11 = EnemyType(name, position, offset, closureToGenerateControlAction11, closureToGenerateResourceAction)
        var enemyType12 = EnemyType(name, position, offset, closureToGenerateControlAction12, closureToGenerateResourceAction)
        var enemyType13 = EnemyType(name, position, offset, closureToGenerateControlAction13, closureToGenerateResourceAction)
        var enemyType14 = EnemyType(name, position, offset, closureToGenerateControlAction14, closureToGenerateResourceAction)
        //sit
        
        var enemyType15 = EnemyType(name, position, offset, closureToGenerateControlAction15, closureToGenerateResourceAction)
        var enemyType16 = EnemyType(name, position, offset, closureToGenerateControlAction16, closureToGenerateResourceAction)
        //scrub
        var enemyType17 = EnemyType(name, position, offset, closureToGenerateControlAction17, closureToGenerateResourceAction)
        var enemyType18 = EnemyType(name, position, offset, closureToGenerateControlAction18, closureToGenerateResourceAction)
        var enemyType19 = EnemyType(name, position, offset, closureToGenerateControlAction19, closureToGenerateResourceAction)
        var enemyType20 = EnemyType(name, position, offset, closureToGenerateControlAction20, closureToGenerateResourceAction)
        
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
        enemyTypes.append(enemyType13)
        enemyTypes.append(enemyType14)
        
        enemyTypes.append(enemyType15)
        enemyTypes.append(enemyType16)
        
        enemyTypes.append(enemyType17)
        enemyTypes.append(enemyType18)
        enemyTypes.append(enemyType19)
        enemyTypes.append(enemyType20)
        
        
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
        
        var newWave2 = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
        waveList.append(newWave2)


        total = 12
        type = [0 , 1 ,2 ,3]
        stagger = [SCNVector3(0,0.2,0), SCNVector3(0,0.2,0),SCNVector3(0,0.2,0),SCNVector3(0,0.2,0)]
        
        var newWave3 = makeSymetricalWaveForParams(total: total, type: type, stagger: stagger)
        waveList.append(newWave3)
        
        
        
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
