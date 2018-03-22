//
//  PotentiallyUnsafeGlobals.swift
//  OhNoUFO
//
//  Created by Aaron Boswell on 2018-03-21.
//  Copyright © 2018 Henry Boswell. All rights reserved.
//
import SceneKit
import Foundation
import ARKit


class PotentiallyUnsafeGlobals{

    static var sceneView: ARSCNView!
    static func playerPOV() -> SCNNode {
        return sceneView.pointOfView!
    }
    static func addToRootNode(nodeToAdd: SCNNode){
        sceneView.scene.rootNode.addChildNode(nodeToAdd)
    }
}
