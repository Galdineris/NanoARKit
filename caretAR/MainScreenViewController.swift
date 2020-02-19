//
//  ViewController.swift
//  caretAR
//
//  Created by Rafael Galdino on 18/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import UIKit
import ARKit

class MainScreenViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.preferredFont(forTextStyle: .title1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var playButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var settingsButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var menuStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let viewModel: MainScreenViewModel

    required init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        titleLabel.text = "caretAR"
        setupButton()
        self.layoutInterface()
    }

    func setupButton() {
        playButton.setTitle("Jogar", for: .normal)
        settingsButton.setTitle("Configurações", for: .normal)
        playButton.addTarget(self,
                             action: #selector(play),
                             for: .touchUpInside)
        settingsButton.addTarget(self,
                                 action: #selector(settings),
                                 for: .touchUpInside)
    }

    private func layoutInterface() {
        for view in [
            titleLabel,
            playButton,
            settingsButton
            ] {
                menuStackView.addArrangedSubview(view)
        }
        menuStackView.alignment = .center
        menuStackView.distribution = .fillEqually
        menuStackView.axis = .vertical
        self.view.addSubview(menuStackView)
        menuStackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        menuStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor,
        multiplier: 0.75).isActive = true
        menuStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        menuStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }

    @objc public func play() {
        viewModel.playGame(hasFaceTracking: ARFaceTrackingConfiguration.isSupported)
    }

    @objc public func settings() {
        viewModel.settings()
    }

}

extension MainScreenViewController: MainScreenViewModelDelegate {
    func notCompatible() {
        return
    }
}
