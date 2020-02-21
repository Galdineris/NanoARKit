//
//  RankingScreenViewController.swift
//  caretAR
//
//  Created by Artur Carneiro on 20/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit

final class RankingScreenViewController: UIViewController {
    private let viewModel: RankingScreenViewModel

    private lazy var rankingStack: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var firstPlaceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Futura", size: 24)
        label.textColor = .systemGray6
        return label
    }()

    private lazy var rankingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Futura", size: 24)
        return label
    }()

    private lazy var secondPlaceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Futura", size: 24)
        label.textColor = .systemGray6
        return label
    }()

    private lazy var thirdPlaceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Futura", size: 24)
        label.textColor = .systemGray6
        return label
    }()

    init(viewModel: RankingScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setupStack()
        setupRanking()
    }

    private func setupStack() {
        rankingStack.addArrangedSubview(rankingLabel)
        rankingStack.addArrangedSubview(firstPlaceLabel)
        rankingStack.addArrangedSubview(secondPlaceLabel)
        rankingStack.addArrangedSubview(thirdPlaceLabel)

        rankingStack.axis = .vertical
        rankingStack.alignment = .center
        rankingStack.distribution = .fillEqually

        view.addSubview(rankingStack)

        rankingStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rankingStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        rankingStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        rankingStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }

    private func setupRanking() {
        rankingLabel.text = "RANKING"
        firstPlaceLabel.text = viewModel.firstPlace()
        secondPlaceLabel.text = viewModel.secondPlace()
        thirdPlaceLabel.text = viewModel.thirdPlace()
    }
}
