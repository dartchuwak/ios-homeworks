//
//  MainTabBarControllerController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 28.11.2022.
//

import UIKit

class MainTabBarControllerController: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [createFirstNavigationController(),createSecondNavigationController()]
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundEffect = UIBlurEffect(style: .light)
            appearance.backgroundColor = UIColor(white: 1, alpha: 0.85)
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance

            
        }
    }
}
