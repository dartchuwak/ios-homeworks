//
//  NavigationControllers.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import Foundation
import UIKit

func createFirstNavigationController() -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: FeedViewController())
    navigationController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "triangle"), tag: 0)
    return navigationController
}


func createSecondNavigationController() -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: ProfileViewController())
    navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "diamond"), tag: 0)
    return navigationController
}


func createTabBarController() -> UITabBarController {
    let tapBarController = UITabBarController()
    tapBarController.viewControllers = [createFirstNavigationController(),createSecondNavigationController()]
    return tapBarController
}
