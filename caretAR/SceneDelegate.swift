//
//  SceneDelegate.swift
//  caretAR
//
//  Created by Rafael Galdino on 18/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navVC = UINavigationController()

        navVC.navigationBar.tintColor = .black
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navVC.navigationBar.isTranslucent = true
        navVC.view.backgroundColor = .clear
        navVC.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navVC.navigationBar.shadowImage = UIImage()

        coordinator = MainCoordinator(navigationController: navVC)
        coordinator?.start()
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
