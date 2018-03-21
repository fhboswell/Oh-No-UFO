//
//  Structs.swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/19/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import SceneKit


struct Level:Decodable {
    var level: String
}

struct Wave{
    var total: Int
    var type:[Int]
    var stagger:[SCNVector3]
    
    
}
