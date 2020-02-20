//
//  MainScreenViewModel.swift
//  caretAR
//
//  Created by Rafael Galdino on 18/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation

protocol MainScreenViewModelDelegate: class {
    func notCompatible()
}

class MainScreenViewModel {
    private let coordinator: MainCoordinator
    weak var delegate: MainScreenViewModelDelegate?

    init(Coordinator viewCoordinator: MainCoordinator) {
        self.coordinator = viewCoordinator
    }

    public func playGame(hasFaceTracking faceTracking: Bool) {
        if faceTracking {
            coordinator.playGame()
        } else {
            delegate?.notCompatible()
        }
    }
}
