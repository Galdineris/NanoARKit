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
        let vc = MainScreenViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }

    public func playGame() {
        return
    }

    public func settings() {
        return
    }
}
