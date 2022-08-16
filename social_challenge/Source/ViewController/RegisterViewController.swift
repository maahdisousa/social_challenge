//
//  ViewController.swift
//  social_challenge
//
//  Created by Marília de Sousa on 10/08/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "Cadastrar"
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 40.0)
        return label
    }()
    
    let nameTextField: UITextField = {
        let nameField = UITextField()
        nameField.placeholder = "Nome"
        nameField.translatesAutoresizingMaskIntoConstraints = false
        return nameField
    }()
    
    let emailTextField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "E-mail"
        emailField.translatesAutoresizingMaskIntoConstraints = false
        return emailField
    }()
    
    let passwordTextFiel: UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "Senha"
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        return passwordField
    }()
    
    lazy private var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Registrar", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(onTapRegisterButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(registerLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextFiel)
        view.addSubview(loginButton)
        
        loadConstraints()
    }
    
    func loadConstraints() {
        
        let labelConstraints = [
            registerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            registerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ]
        
        let nameTextFieldConstraints = [
            nameTextField.leadingAnchor.constraint(equalTo: registerLabel.leadingAnchor),
            nameTextField.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 50),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            nameTextField.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        let emailTextFieldConstraints = [
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        let passwordTextFieldConstraints = [
            passwordTextFiel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextFiel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextFiel.widthAnchor.constraint(equalToConstant: 300),
            passwordTextFiel.heightAnchor.constraint(equalToConstant: 45)
        ]
        
        let loginButtonConstraints = [
            loginButton.topAnchor.constraint(equalTo: passwordTextFiel.bottomAnchor, constant: 50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 150),
            loginButton.heightAnchor.constraint(equalToConstant: 45)
        ]
    

        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(nameTextFieldConstraints)
        NSLayoutConstraint.activate(emailTextFieldConstraints)
        NSLayoutConstraint.activate(passwordTextFieldConstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
    }
    
    @objc func onTapRegisterButton() {
        Task {
            guard let name = nameTextField.text,
                  let email = emailTextField.text,
                  let password = passwordTextFiel.text
            else { return }
            
            if name.isEmpty || email.isEmpty || password.isEmpty { return }
            
            await registerNewUser(userName: name, userEmail: email, userPassword: password)
            
            print("Usuário registrado com sucesso!")
            
        }
    }
    
    func obtainUsers() async -> [UserModel] {
        let userService = UserService()
        
        do {
            let users = try await userService.getAllUsers()
            return users
        } catch {
            print(error)
        }
        
        return []
    }
    
    func obtainPosts() async -> [PostsModel] {
        let postsService = PostsService()
        
        do {
            let posts = try await postsService.getAllPosts()
            return posts
        } catch {
            print(error)
        }
        return[]
    }
    
    func registerNewUser(userName: String, userEmail: String, userPassword: String) async {
        let serviceUser = UserService()
        
        do {
            try await serviceUser.registerUser(registerUserModel: RegisterUserModel (
                    name: userName,
                    email: userEmail,
                    password: userPassword
                )
            )
        } catch {
            print(error)
        }
    }
    
}

