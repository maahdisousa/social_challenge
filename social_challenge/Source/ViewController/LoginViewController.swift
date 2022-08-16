//
//  LoginViewController.swift
//  social_challenge
//
//  Created by Marília de Sousa on 16/08/22.
//

import UIKit

class LoginViewController: UIViewController {

    let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    
    let emailTextField: UITextField = {
        let emailFild = UITextField ()
        emailFild.placeholder = "E-mail"
        emailFild.translatesAutoresizingMaskIntoConstraints = false
        return emailFild
    }()
    
    let passwordTextFiel: UITextField = {
        let passwordFild = UITextField ()
        passwordFild.placeholder = "Senha"
        passwordFild.translatesAutoresizingMaskIntoConstraints = false
        return passwordFild
    }()
    
    lazy private var loginButton: UIButton = {
        let button = UIButton ()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(loginLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextFiel)
        view.addSubview(loginButton)
        
        loadConstraint()
    }
    
    func loadConstraint () {
        
        let labelConstraint = [
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ]
        
        let emailTextFieldConstraint = [
            emailTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 50),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        let passwordTextFielConstraint = [
            passwordTextFiel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextFiel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 50),
            passwordTextFiel.widthAnchor.constraint(equalToConstant: 300),
            passwordTextFiel.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        let loginButtonTextFieldConstraint = [
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextFiel.bottomAnchor, constant: 50),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        
        
        NSLayoutConstraint.activate(labelConstraint)
        NSLayoutConstraint.activate(emailTextFieldConstraint)
        NSLayoutConstraint.activate(passwordTextFielConstraint)
        NSLayoutConstraint.activate(loginButtonTextFieldConstraint)
        
    }
    
    
}
