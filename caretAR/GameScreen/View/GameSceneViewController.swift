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

    private lazy var sceneView: ARSCNView = {
        let sceneView = ARSCNView(frame: .zero)
        sceneView.translatesAutoresizingMaskIntoConstraints = false
        return sceneView
    }()

    private let viewModel: GameScreenViewModel
    private let gameSettings: GameSettingsModel

    init(viewModel: GameScreenViewModel, gameSettings: GameSettingsModel) {
        self.viewModel = viewModel
        self.gameSettings = gameSettings
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = ARFaceTrackingConfiguration()
        configuration.maximumNumberOfTrackedFaces = ARFaceTrackingConfiguration.supportedNumberOfTrackedFaces
        sceneView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])

    }

}
