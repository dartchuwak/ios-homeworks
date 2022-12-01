//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Press me", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemBlue
        
        return button
    }()
    
    let profileHeadView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.90, alpha: 1)
        view.addSubview(button)
        
        //Button layout
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        view.addSubview(profileHeadView)
        
        //profileView layout
        profileHeadView.frame = self.view.frame
        profileHeadView.translatesAutoresizingMaskIntoConstraints = false
        profileHeadView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileHeadView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        profileHeadView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        profileHeadView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}





