//
//  GameScreenViewModel.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation

protocol GameScreenViewModelDelegate: class {
}

class GameScreenViewModel {
    private let coordinator: MainCoordinator
    private var model: GameScreenModel

    init(coordinator viewModelCoordinator: MainCoordinator) {
        self.coordinator = viewModelCoordinator
        self.model = GameScreenModel()
    }
}
