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



    override func viewDidLoad() {
        super.viewDidLoad()

        let config = ARWorldTrackingConfiguration();

        sceneView.session.run(config);


        addcube() //Add the cube in the load
        addTapGuestureToSceneView()

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sceneView.session.pause();
    }


    func addcube(x: Float = 0, y: Float = 0, z: Float = 0) {
        let cube = SCNBox(width: 0.1, height: 0.1, length:
        0.1, chamferRadius: 0);

        let cubenode = SCNNode()
        cubenode.geometry = cube
        cubenode.position = SCNVector3(x, y, z)


        let scene = SCNScene()

        scene.rootNode.addChildNode(cubenode)

        sceneView.scene = scene //Add the custome scene to the SceneView


    }

    func addTapGuestureToSceneView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap(withGestureRecognizer:)))

        sceneView.addGestureRecognizer(tapGestureRecognizer)

    }

    @objc private func didTap(withGestureRecognizer recognizer: UIGestureRecognizer) {

        let taplocation = recognizer.location(in: sceneView)
        let hitTestResults = sceneView.hitTest(taplocation)

        guard let node = hitTestResults.first?.node else { //Once hitted then

            let hitTestResultsWithFeaturePoint = sceneView.hitTest(taplocation, types: .featurePoint)
            //Ge the global points

            if let hitTestResultWithFeaturePoints = hitTestResultsWithFeaturePoint.first {

                let translation = hitTestResultWithFeaturePoints.worldTransform.translation
                addcube(x: translation.x, y: translation.y, z: translation.z)

            }

            return
        }

        node.removeFromParentNode() //Remove the node from the parent node


        print("We tapped it")
    }
}

extension float4x4 { // extension on the self float 4 x 4 Matrix

    var translation: float3 {

        let translation = self.columns.3

        return float3(translation.x, translation.y, translation.z)
    }
}

