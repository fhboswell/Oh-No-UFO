//
//  Constants.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/13/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import SceneKit


struct PhysicsMask {
    static let playerLazer = 0
    static let enemyLazer = 2
    static let enemyShip = 4
    static let player = 8
    
}

var x_style: Bool {
    get {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                return true
            default:
                return false
            }
        }
        return false
    }
}

var phone678_style: Bool {
    get {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1334:
                return true
            default:
                return false
            }
        }
        return false
    }
}

var laserList: [Laser] = {
    
    var levelList = [Laser]()
    var retImage = UIImage(named: "ret1.png")
    var new1:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new1)
    
    retImage = UIImage(named: "ret2.png")
    var new2:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new2)
    retImage = UIImage(named: "ret3.png")
    
    var new3:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new3)
    
    retImage = UIImage(named: "ret4.png")
    var new4:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new4)
    
    retImage = UIImage(named: "ret5.png")
    var new5:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new5)
    
    retImage = UIImage(named: "ret6.png")
    var new6:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new6)
    
    retImage = UIImage(named: "ret7.png")
    var new7:Laser = Laser(cost: "100", retImage: retImage!)
    levelList.append(new7)
    return levelList
   
    
}()



var purchasedLasers: [Bool]{
    get {
        return UserDefaults.standard.object(forKey: "purchasedLasers") as? [Bool] ?? [true,false,false,false,false,false,false]
    }
    set {
        let defaults = UserDefaults.standard
        defaults.set(newValue, forKey: "purchasedLasers")
        defaults.synchronize()
    }
};

var unlockedLasers: [Bool]{
    get {
        return UserDefaults.standard.object(forKey: "unlockedLasers") as? [Bool] ?? [true,true,true,false,false,false,false]
    }
    set {
        let defaults = UserDefaults.standard
        defaults.set(newValue, forKey: "unlockedLasers")
        defaults.synchronize()
    }
};
var unlockRequirement: [String] = ["X","X","X","Blast 30 UFOs", "Blast 60 UFOs", "Blast 300 UFOs", "Blast 400 UFOs", "Blast 500 UFOs", "Blast 600 UFOs", "Blast 700 UFOs", "Blast 800 UFOs", "Blast 900 UFOs"]

var pepTalk: [String] = ["Try again", "Try again", "Try again", "Great!", "Terrific!", "Terrific!", "Terrific!", "Excellent!", "Excellent", "Excellent", "Perfect", "Perfect" , "Perfect" ]



var powerupList: [Powerup] = {
    
    var powerupList = [Powerup]()
    var retImage = UIImage(named: "gear.png")
    var new1:Powerup = Powerup(cost: "100", retImage: retImage!)
    powerupList.append(new1)
    
    retImage = UIImage(named: "mag.png")
    var new2:Powerup = Powerup(cost: "100", retImage: retImage!)
    powerupList.append(new2)
    retImage = UIImage(named: "shield.png")
    
    var new3:Powerup = Powerup(cost: "100", retImage: retImage!)
    powerupList.append(new3)
    
    retImage = UIImage(named: "ret4.png")
    var new4:Powerup = Powerup(cost: "100", retImage: retImage!)
    powerupList.append(new4)
    
    retImage = UIImage(named: "ret5.png")
    var new5:Powerup = Powerup(cost: "100", retImage: retImage!)
    powerupList.append(new5)
    
    retImage = UIImage(named: "ret6.png")
    var new6:Powerup = Powerup(cost: "100", retImage: retImage!)
    powerupList.append(new6)
    
    retImage = UIImage(named: "ret7.png")
    var new7:Powerup = Powerup(cost: "100", retImage: retImage!)
    powerupList.append(new7)
    return powerupList
    
    
}()



var purchasedPowerups: [Bool]{
    get {
        return UserDefaults.standard.object(forKey: "purchasedLasers1") as? [Bool] ?? [false,false,false,false,false,false,false]
    }
    set {
        let defaults = UserDefaults.standard
        defaults.set(newValue, forKey: "purchasedLasers1")
        defaults.synchronize()
    }
};

var unlockedPowerups: [Bool]{
    get {
        return UserDefaults.standard.object(forKey: "unlockedLasers") as? [Bool] ?? [true,true,true,false,false,false,false]
    }
    set {
        let defaults = UserDefaults.standard
        defaults.set(newValue, forKey: "unlockedLasers")
        defaults.synchronize()
    }
};
var unlockRequirementPowerups: [String] = ["X","X","X","Blast 30 UFOs", "Blast 60 UFOs", "Blast 300 UFOs", "Blast 400 UFOs", "Blast 500 UFOs", "Blast 600 UFOs", "Blast 700 UFOs", "Blast 800 UFOs", "Blast 900 UFOs"]




