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
        return label
    }()

    private lazy var secondPlaceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var thirdPlaceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        setupStack()
        setupRanking()
    }

    private func setupStack() {
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
        firstPlaceLabel.text = viewModel.firstPlace()
        secondPlaceLabel.text = viewModel.secondPlace()
        thirdPlaceLabel.text = viewModel.thirdPlace()
    }
}
