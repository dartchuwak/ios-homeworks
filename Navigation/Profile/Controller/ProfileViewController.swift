//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeadView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.90, alpha: 1)
        view.addSubview(profileHeadView)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeadView.frame = self.view.frame
        profileHeadView.translatesAutoresizingMaskIntoConstraints = false
        profileHeadView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileHeadView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        profileHeadView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        profileHeadView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}


