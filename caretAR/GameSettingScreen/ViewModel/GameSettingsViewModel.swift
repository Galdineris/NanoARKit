//
//  GameSettingsViewModel.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation
protocol GameSettingsViewModelDelegate: class {
}

class GameSettingsViewModel {
    private let coordinator: MainCoordinator
    private var model: GameSettingsModel

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.model = GameSettingsModel()
    }

    public func numberOfExpressions() -> Int {
        return model.expressions.count
    }

    public func name(index: Int) -> String {
        let value = Array(model.expressions)[index].value
        return value.1
    }

    public func state(index: Int) -> Bool {
        let value = Array(model.expressions)[index].value
        return value.0
    }
}
