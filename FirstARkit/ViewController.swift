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

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        sceneView.session.pause();
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let config = ARWorldTrackingConfiguration();

        sceneView.session.run(config);


    }

    func addcube() {
        let box = SCNBox()
    }
}

