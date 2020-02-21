//
//  GameScreenViewModel.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation
import ARKit

protocol GameScreenViewModelDelegate: class {
    func changeClueImageTo(name: String)
}

class GameScreenViewModel {
    private let coordinator: MainCoordinator
    private var model: GameScreenModel
    weak var delegate: GameScreenViewModelDelegate?

    init(coordinator viewModelCoordinator: MainCoordinator, model: GameSettingsModel) {
        self.coordinator = viewModelCoordinator
        self.model = GameScreenModel(gameSettings: model)
    }

// MARK: GAME LOGIC
    public func startNewGame() {
        changeCurrentExpression()
        model.currentRound = 0
        model.isGameActive = true
    }

    public func processNewARFrame(personFace: ARFaceAnchor) {
        guard model.isGameActive else {
            return
        }
        for blendShape in model.currentExpression.blendShapes {
            if let value = personFace.blendShapes[blendShape] {
                if !(value.floatValue >= model.currentExpression.threshold) {
                    return
                }
            }
        }
        expressionMatchedBy(playerID: personFace.identifier)
    }

    public func newPlayer(anchorID: UUID) {
        model.playersPoints.updateValue(0, forKey: anchorID)
    }

    public func changeCurrentExpression() {
        if let randomElement = model.expressions.randomElement() {
            model.currentExpression = randomElement
        }
        delegate?.changeClueImageTo(name: model.currentExpression.name)
    }

    public func expressionMatchedBy(playerID: UUID) {
        guard let score = model.playersPoints[playerID] else {
            return
        }
        model.playersPoints.updateValue(score + 1, forKey: playerID)
        changeCurrentExpression()
    }
}
