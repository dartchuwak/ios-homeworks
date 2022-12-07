//
//  LogInViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 05.12.2022.
//

import UIKit

class LogInViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView : UIScrollView!
    var contentView: UIView!
    
    let logo = UIImageView(image: UIImage(named: "logo"))
    
    let textFieldLogin: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Enter email"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        return textField
    }()
    
    let textFieldPassword: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.placeholder = "Enter password"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let logInButton: UIButton = {
        let button = UIButton(frame: .zero)
        let imageNormal = UIImage(named: "blue_pixel")
        button.setTitle("Log in", for: .normal)
        button.setBackgroundImage(imageNormal, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        
        self.scrollView = UIScrollView(frame: .zero)
        self.contentView = UIView(frame: .zero)
        self.scrollView.delegate = self
        self.scrollView.keyboardDismissMode = .interactive
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        
        
        contentView.addSubview(logo)
        
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0)
        ])
        
        let verticalStackView = UIStackView(arrangedSubviews: [textFieldLogin, textFieldPassword])
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 0
        verticalStackView.layer.borderColor = UIColor.lightGray.cgColor
        verticalStackView.layer.cornerRadius = 10
        verticalStackView.clipsToBounds = true
        verticalStackView.layer.borderWidth = 0.5
        
        contentView.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120).isActive = true
        verticalStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        verticalStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        contentView.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor, constant: 120).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        logInButton.addAction(UIAction { _ in self.present(ProfileViewController(), animated: true) }, for: .touchUpInside)
        
        textFieldLogin.delegate = self
        textFieldPassword.delegate = self
    
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
   
    

    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - view.safeAreaInsets.bottom + 20, right: 0)
        self.scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - view.safeAreaInsets.bottom + 20, right: 0)
    }
    

    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.scrollView.contentInset = .zero
        self.scrollView.scrollIndicatorInsets = .zero
    }
}


extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldLogin.endEditing(true)
        textFieldPassword.endEditing(true)
        return false
    }
}



