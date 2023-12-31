//
//  SceneDelegate.swift
//  threebuttons
//
//  Created by Илья Мудрый on 05.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
		let viewController = ViewController()
		viewController.configureUI()
		window?.rootViewController = viewController
		window?.makeKeyAndVisible()
	}
}
