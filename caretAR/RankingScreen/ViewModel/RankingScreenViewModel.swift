//
//  RankingScreenViewModel.swift
//  caretAR
//
//  Created by Artur Carneiro on 20/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation

final class RankingScreenViewModel {
    private let coordinator: MainCoordinator
    private var model: RankingScreenModel

    init(coordinator: MainCoordinator, ranking: [String]) {
        self.coordinator = coordinator
        self.model = RankingScreenModel(firstPlace: ranking[0], secondPlace: ranking[1], thirdPlace: ranking[2])
    }

    public func firstPlace() -> String {
        return model.firstPlace
    }

    public func secondPlace() -> String {
        return model.secondPlace
    }

    public func thirdPlace() -> String {
        return model.thirdPlace
    }
}
