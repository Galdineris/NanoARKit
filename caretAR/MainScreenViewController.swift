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
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var playButton: UIButton = {
        let view = UIButton(frame: .zero)
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
        self.view.backgroundColor = .systemRed
        setupTitleLabel()
        setupButton()
        self.layoutInterface()
    }

    private func setupButton() {
        playButton.setTitle("JOGAR", for: .normal)
        playButton.titleLabel?.font = UIFont(name: "Futura", size: 32)
        playButton.addTarget(self,
                             action: #selector(play),
                             for: .touchUpInside)
        playButton.backgroundColor = .systemGray6
        playButton.setTitleColor(.systemRed, for: .normal)
        playButton.layer.cornerRadius = 25
        playButton.clipsToBounds = true
    }

    private func setupTitleLabel() {
        titleLabel.text = "CaretAR"
        titleLabel.font = UIFont(name: "Futura", size: 32)
        titleLabel.textColor = .systemGray6
    }

    private func layoutInterface() {
        view.addSubview(titleLabel)
        view.addSubview(playButton)

        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                            constant: 20).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                                             constant: -20).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        playButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        playButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,
                                          multiplier: 0.5).isActive = true
    }

    @objc public func play() {
        viewModel.playGame(hasFaceTracking: ARFaceTrackingConfiguration.isSupported)
    }

}

extension MainScreenViewController: MainScreenViewModelDelegate {
    func notCompatible() {
        return
    }
}
