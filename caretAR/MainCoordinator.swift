//
//  MainCoordinator.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    required init(navigationController navController: UINavigationController) {
        self.navigationController = navController
    }

    public func start() {
        let viewModel = MainScreenViewModel(Coordinator: self)
        let viewControlller = MainScreenViewController(viewModel: viewModel)
        navigationController.pushViewController(viewControlller, animated: true)
    }

    public func gameSettings() {
        let viewModel = GameSettingsViewModel(coordinator: self)
        let viewController = GameSettingsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

    public func playGame(model: GameSettingsModel) {
        let viewModel = GameScreenViewModel(coordinator: self, model: model)
        let viewController = GameScreenViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

    public func showRanking(ranking: [String]) {
        let viewModel = RankingScreenViewModel(coordinator: self, ranking: ranking)
        let viewController = RankingScreenViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
