//
//  Protocols.Swift
//  OhNoUFO
//
//  Created by Henry Boswell on 3/13/18.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//

import Foundation
import UIKit
import ARKit
import SceneKit

protocol SceneRootNodeAccessDelegate {
    func addToRootNode(nodeToAdd: SCNNode)
}

protocol PlayerLocationAccessDelegate {
    func playerPOV() -> SCNNode
}

protocol LaserCellDelegate {
    func recieveLevelIndex(index: Int)
}
