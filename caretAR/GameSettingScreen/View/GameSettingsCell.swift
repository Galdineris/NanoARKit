//
//  GameSettingsCell.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit

protocol GameSettingsCellDelegate: class {
    func pass(state: Bool, cell: UITableViewCell)
}

final class GameSettingsCell: UITableViewCell {

    init() {
        super.init(style: .default, reuseIdentifier: nil)
        self.setUpLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public lazy var expressionLabel: UILabel = {
        let expressionLabel = UILabel(frame: .zero)
        expressionLabel.translatesAutoresizingMaskIntoConstraints = false
        return expressionLabel
    }()

    public lazy var expressionSwitch: UISwitch = {
        let expressionSwitch = UISwitch(frame: .zero)
        expressionSwitch.translatesAutoresizingMaskIntoConstraints = false
        return expressionSwitch
    }()

    public weak var delegate: GameSettingsCellDelegate?

    private func setUpLayout() {
        expressionSwitch.addTarget(self, action: #selector(stateChanged), for: .valueChanged)

        self.addSubview(expressionLabel)
        self.addSubview(expressionSwitch)

        expressionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                 constant: 5).isActive = true
        expressionLabel.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor,
                                                constant: -10).isActive = true
        expressionLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true

        expressionSwitch.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor,
                                                 constant: -10).isActive = true
        expressionSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                                   constant: -5).isActive = true
        expressionSwitch.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor,
                                                multiplier: 0.2).isActive = true
    }

    @objc private func stateChanged() {
        delegate?.pass(state: expressionSwitch.isOn, cell: self)
    }
}
