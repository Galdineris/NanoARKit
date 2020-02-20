//
//  GameScreenModel.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation

struct GameScreenModel {
    var expressions: [Expression]
    var currentExpression: Expression
    var playersPoints: [UUID: Int]
    var numberOfRounds: Int
    var currentRound: Int
    var isGameActive: Bool
    init(gameSettings: GameSettingsModel) {
        self.expressions = gameSettings.expressions
        self.currentExpression = Expression()
        self.playersPoints = [:]
        self.numberOfRounds = 0
        self.currentRound = 0
        self.isGameActive = false
    }
}
