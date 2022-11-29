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
    UINavigationBar.appearance().barTintColor = .white
    let navBar = navigationController.navigationBar
    let standardAppearance = UINavigationBarAppearance()
    standardAppearance.configureWithOpaqueBackground()
    standardAppearance.backgroundEffect = UIBlurEffect(style: .light)
    standardAppearance.backgroundColor = UIColor(white: 1, alpha: 0.85)
    navBar.standardAppearance = standardAppearance
    navBar.scrollEdgeAppearance = standardAppearance
    return navigationController
}


func createSecondNavigationController() -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: ProfileViewController())
    navigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "diamond"), tag: 0)
    UINavigationBar.appearance().barTintColor = .white
    let navBar = navigationController.navigationBar
    let standardAppearance = UINavigationBarAppearance()
    standardAppearance.configureWithOpaqueBackground()
    standardAppearance.backgroundEffect = UIBlurEffect(style: .light)
    standardAppearance.backgroundColor = UIColor(white: 1, alpha: 0.85)
    navBar.standardAppearance = standardAppearance
    navBar.scrollEdgeAppearance = standardAppearance
    return navigationController
}

