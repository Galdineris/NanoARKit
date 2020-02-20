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

    public func stateChanged(atIndex: Int, withState: Bool) {
        let key = Array(model.expressions)[atIndex].key
        let value = model.expressions[key]

        if let string = value?.1 {
            model.expressions.updateValue((withState, string), forKey: key)
        }
    }

    public func TESTFUNCTION() {
        print(model.expressions)
    }
}
