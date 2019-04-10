//
//  ViewController.swift
//  ARDicee
//
//  Created by Konstantin on 08/04/2019.
//  Copyright © 2019 Konstantin. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        //let sphere = SCNSphere(radius: 0.2)
        
        //let material = SCNMaterial()
        
        //material.diffuse.contents = UIColor.red
        //material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
        
        //cube.materials = [material]
        //sphere.materials = [material]

        
        //let node = SCNNode()
        
        //node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        
        //node.geometry = cube
        //node.geometry = sphere

        
        //sceneView.scene.rootNode.addChildNode(node)
        
        sceneView.autoenablesDefaultLighting = true
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
        
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!

        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
            
            diceNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
            // Set the scene to the view
            sceneView.scene.rootNode.addChildNode(diceNode)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        //print("ARConfiguration is supported = \(ARConfiguration.isSupported)")
        //print("World Tracking is supported = \(ARWorldTrackingConfiguration.isSupported)")
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
