//
//  RoundStatistics.swift
//  OhNoUFO
//
//  Created by Aaron Boswell on 2018-05-06.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
public class RoundStatistics{
    static var currentRoundStatistics:RoundStatistics = RoundStatistics()

    public var enemiesDestroyed = 0
    public var lasersFired = 0
    public var score = 0
    public var wave = 0

    var accuracy : Double{
        get {
            return lasersFired == 0 ? 0 : Double(enemiesDestroyed)/Double(lasersFired)
        }
    }
    func reset(){
        enemiesDestroyed = 0
        lasersFired = 0
        score = 0;
        wave = 0;
    }
}
