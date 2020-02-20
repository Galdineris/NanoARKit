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
//    var players: [UUID: Any] { get set }
}

class GameScreenViewModel {
    private let coordinator: MainCoordinator
    private var model: GameScreenModel

    init(coordinator viewModelCoordinator: MainCoordinator, model: GameScreenModel) {
        self.coordinator = viewModelCoordinator
        self.model = model
    }

// MARK: GAME LOGIC
    
    public func startNewGame() {
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
        guard let score = model.playersPoints[personFace.identifier] else {
            return
        }
        model.playersPoints.updateValue(score + 1, forKey: personFace.identifier)
        if let randomElement = model.expressions.randomElement() {
            model.currentExpression = randomElement
        }
    }
}
