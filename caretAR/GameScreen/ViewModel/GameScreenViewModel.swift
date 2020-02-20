//
//  GameScreenViewModel.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation

protocol GameScreenViewModelDelegate: class {
//    var players: [UUID: Any] { get set }
}

class GameScreenViewModel {
    private let coordinator: MainCoordinator
    private var model: GameScreenModel

    init(coordinator viewModelCoordinator: MainCoordinator) {
        self.coordinator = viewModelCoordinator
        self.model = GameScreenModel()

        self.expressionsToUse = model.expressions
        self.currentExpression = [:]
        self.playersPoints = [:]
        self.numberOfRoundsElapsed = 0
        self.currentRound = 0
        self.gameActive = false
    }

// MARK: GAME LOGIC
    private var gameActive: Bool {
            didSet {
    //            trigger game changes when paused
            }
        }
//    TODO: ?Make Custom Expression Class?
    private var expressionsToUse: [String: (Bool, String)]
    private var currentExpression: [String: (Bool, String)]
    private var playersPoints: [UUID: Int]
    private var numberOfRoundsElapsed: Int
    private var currentRound: Int

    public func startNewGame() {
        self.playersPoints = [:]
        self.numberOfRoundsElapsed = 0
        self.currentRound = 0
        self.gameActive = true
    }

    public func processNewARFrame() {
        guard self.gameActive else {
            return
        }
    }
}
