//
//  ViewController.swift
//  FirstARkit
//
//  Created by Victor on 28/08/2018.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let config = ARWorldTrackingConfiguration();

        sceneView.session.run(config);


    }

    override func viewDidLoad() {
        super.viewDidLoad()


        addcube() //Add the cube in the load

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sceneView.session.pause();
    }


    func addcube() {
        let box = SCNBox(width: 0.1, height: 0.1, length:
        0.1, chamferRadius: 0);

        let boxnode = SCNNode()
        boxnode.geometry = box
        boxnode.position = SCNVector3(0, 0, -0.6)


        let scene = SCNScene()

        scene.rootNode.addChildNode(boxnode)

        sceneView.scene = scene //Add the custome scene to the SceneView


    }
}

