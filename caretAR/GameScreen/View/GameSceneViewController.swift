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
    var players: [UUID: ARFaceAnchor] = [:]

    private lazy var sceneView: ARSCNView = {
        let sceneView = ARSCNView(frame: .zero)
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        return sceneView
    }()

    private lazy var clueImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var faceNode: SCNNode = {
        let node = SCNNode(geometry: nil)
        return node
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
        viewModel.delegate = self
        UIApplication.shared.isIdleTimerDisabled = true
        setupSceneView()
        setupARConfiguration()
        setupClueImageView()
        viewModel.startNewGame()
    }

    override func viewWillDisappear(_ animated: Bool) {
        sceneView.session.pause()
        players = [:]
        UIApplication.shared.isIdleTimerDisabled = false
        super.viewWillDisappear(animated)
    }

    private func createPlayerNameLabel(_ name: String) -> SCNText {
        let text = SCNText(string: name, extrusionDepth: 4)
        let font = UIFont.preferredFont(forTextStyle: .title1)
        let material = SCNMaterial()
        text.font = font
        material.diffuse.contents = [
            UIColor.systemRed,
            UIColor.systemYellow,
            UIColor.systemTeal,
            UIColor.systemBlue,
            UIColor.systemPink,
            UIColor.systemOrange,
            UIColor.systemIndigo,
            UIColor.systemPurple,
            UIColor.systemGreen
            ].randomElement() ?? UIColor.systemRed
        material.isDoubleSided = true
        text.materials = [material]
        return text
    }

    private func setupSceneView() {
        sceneView.delegate = self
        view.addSubview(sceneView)
        sceneView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        sceneView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        sceneView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sceneView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    private func setupARConfiguration() {
        let sceneARConfiguration = ARFaceTrackingConfiguration()
        sceneARConfiguration.maximumNumberOfTrackedFaces = ARFaceTrackingConfiguration.supportedNumberOfTrackedFaces
        sceneARConfiguration.isLightEstimationEnabled = true
        sceneView.session.run(sceneARConfiguration,
                              options: [.removeExistingAnchors, .resetTracking])
    }

    private func setupClueImageView() {
        view.addSubview(clueImageView)
        clueImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.33).isActive = true
        clueImageView.heightAnchor.constraint(equalTo: clueImageView.widthAnchor, multiplier: 4/3).isActive = true
//        clueImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        clueImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        clueImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
        faceNode = SCNNode(geometry: faceGeometry)
        faceNode.renderingOrder = -1

        let nameNode = SCNNode(geometry: faceGeometry)
        nameNode.position = SCNVector3(-0.1, 0.05, 0.0)
        nameNode.scale = SCNVector3(0.002, 0.002, 0.002)
        nameNode.geometry = createPlayerNameLabel("\(players.count + 1)")

        let resultingNode = SCNNode(geometry: nil)
        resultingNode.addChildNode(faceNode)
        resultingNode.addChildNode(nameNode)

        return resultingNode
    }

    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if let faceAnchor = (anchor as? ARFaceAnchor) {
            players.updateValue(faceAnchor, forKey: faceAnchor.identifier)
            viewModel.newPlayer(anchorID: faceAnchor.identifier)
        }
    }

    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        guard let faceAnchor = (anchor as? ARFaceAnchor),
            let faceGeometry = (faceNode.geometry as? ARSCNFaceGeometry) else {
            return
        }
        faceGeometry.update(from: faceAnchor.geometry)
        players.updateValue(faceAnchor, forKey: faceAnchor.identifier)
        viewModel.processNewARFrame(personFace: faceAnchor)
    }
}

extension GameScreenViewController: GameScreenViewModelDelegate {
    func changeClueImageTo(name: String) {
        DispatchQueue.main.async {
            self.clueImageView.image = UIImage(named: name)
        }
    }
}
