//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import UIKit


class FeedViewController: UIViewController {
    
    let post = Post(title: "Make Love Not War")
    
    let one: UIButton = {
        let button = UIButton()
        button.setTitle("Button one", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()

    let two: UIButton = {
        let button = UIButton()
        button.setTitle("Button two", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        one.addTarget(self, action: #selector(goToPostButtonPressed), for: .touchUpInside)
        two.addTarget(self, action: #selector(goToPostButtonPressed), for: .touchUpInside)
        let stackView = UIStackView(arrangedSubviews: [one, two])
        stackView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300)
        stackView.center = view.center
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      
    }
    
    @objc func goToPostButtonPressed(sender: UIButton) {
        let title =  sender.titleLabel?.text
        let vc = PostViewController()
        vc.title = title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
