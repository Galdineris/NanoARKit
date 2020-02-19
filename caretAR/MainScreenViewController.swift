//
//  ViewController.swift
//  caretAR
//
//  Created by Rafael Galdino on 18/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import UIKit

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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        titleLabel.text = "caretAR"
        playButton.setTitle("Jogar", for: .normal)
        settingsButton.setTitle("Configurações", for: .normal)
        self.layoutInterface()
        // Do any additional setup after loading the view.
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
}
