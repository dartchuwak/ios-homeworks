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
        self.navigationController?.navigationBar.isHidden = false
        view.backgroundColor = UIColor(white: 0.90, alpha: 1)
        view.addSubview(profileHeadView)
        profileHeadViewLayout()
    }
    
    private func profileHeadViewLayout() {
        NSLayoutConstraint.activate([
            profileHeadView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeadView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileHeadView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeadView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}


