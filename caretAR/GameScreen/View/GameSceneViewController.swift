//
//  GameSceneViewController.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit
import ARKit

class GameScreenViewController: UIViewController {

    let sceneARConfiguration = ARFaceTrackingConfiguration()
//    TODO: Create Player Object
    var players: [UUID: ARFaceAnchor] = [:]

    private lazy var sceneView: ARSCNView = {
        let sceneView = ARSCNView(frame: .zero)
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        return sceneView
    }()

    private let viewModel: GameScreenViewModel

    init(viewModel: GameScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneARConfiguration.maximumNumberOfTrackedFaces = ARFaceTrackingConfiguration.supportedNumberOfTrackedFaces
        sceneARConfiguration.isLightEstimationEnabled = true
        sceneView.session.run(sceneARConfiguration, options: [.removeExistingAnchors, .resetTracking])
        UIApplication.shared.isIdleTimerDisabled = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
        players = [:]
        UIApplication.shared.isIdleTimerDisabled = false
    }
//    TODO: ?create custom SCNText for player name label?
    private func createPlayerNameLabel(_ name: String) -> SCNText {
        let text = SCNText(string: name, extrusionDepth: 4)
        let font = UIFont.preferredFont(forTextStyle: .title1)
        let material = SCNMaterial()
        text.font = font
        material.diffuse.contents = UIColor.black
        material.isDoubleSided = true
        text.materials = [material]
        return text
    }
}

extension GameScreenViewController: ARSCNViewDelegate {
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let device = sceneView.device,
            anchor is ARFaceAnchor else {
            return nil
        }

        let faceGeometry = ARSCNFaceGeometry(device: device)
        if let material = faceGeometry?.firstMaterial {
            material.colorBufferWriteMask = []
        }
        let faceNode = SCNNode(geometry: faceGeometry)
        faceNode.renderingOrder = -1

        let nameNode = SCNNode(geometry: faceGeometry)
        nameNode.position = SCNVector3(-0.2, 0.05, 0.0)
        nameNode.scale = SCNVector3(0.002, 0.002, 0.002)
//        TODO: ?Move Player name logic creation to viewModel?
        nameNode.geometry = createPlayerNameLabel("\(players.count + 1)")

        let resultingNode = SCNNode(geometry: nil)
        resultingNode.addChildNode(faceNode)
        resultingNode.addChildNode(nameNode)

        return resultingNode
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if let faceAnchor = (anchor as? ARFaceAnchor) {
            players.updateValue(faceAnchor, forKey: faceAnchor.identifier)
        }
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = (anchor as? ARFaceAnchor),
            let faceGeometry = (node.geometry as? ARSCNFaceGeometry) else {
            return
        }
        faceGeometry.update(from: faceAnchor.geometry)
        players.updateValue(faceAnchor, forKey: faceAnchor.identifier)
    }
}

extension GameScreenViewController: GameScreenViewModelDelegate {
}
