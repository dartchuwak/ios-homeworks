//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 28.11.2022.
//

import UIKit


class ProfileHeaderView: UIView, UITextFieldDelegate {
        
    let imagePhoto = UIImage(named: "image")
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .cyan
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        image.clipsToBounds = true
        return image
    }()
    
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
       return button
    }()
    
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Hipster Cat"
        label.textAlignment = .left
        return label
    }()
    
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.tintColor = .gray
        label.textColor = .gray
        label.text = "My status could be here..."
        label.textAlignment = .left
        return label
    }()
    
    
    
    let statusTextField: UITextField = {
       let tf = UITextField()
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.backgroundColor = .white
        tf.font = .systemFont(ofSize: 15)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 15
        tf.clipsToBounds = true
        return tf
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(profileImage)
        
        self.statusTextField.delegate = self
        
        profileImage.image = imagePhoto
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        
        self.addSubview(headerLabel)
        headerLabel.frame = CGRect(x: self.center.x, y: self.center.y, width: 0, height: 0)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        
        self.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 34).isActive = true
        statusLabel.leadingAnchor.constraint(equalTo:  profileImage.trailingAnchor, constant: 16).isActive = true
        statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        self.addSubview(statusTextField)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        statusTextField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16).isActive = true
        statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16).isActive = true
        
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16).isActive = true
        button.addTarget(self, action: #selector (buttonPressed), for: .touchUpInside)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func buttonPressed() {
        print(statusLabel.text ?? "")
        if statusTextField.text != nil && statusTextField.text != "" {
            statusLabel.text = statusTextField.text
        } else { return }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusTextField.endEditing(true)
        if statusTextField.text != nil && statusTextField.text != "" {
            statusLabel.text = statusTextField.text
            
        }
        return false
    }
}




