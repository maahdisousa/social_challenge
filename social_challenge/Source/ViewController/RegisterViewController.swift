//
//  ViewController.swift
//  social_challenge
//
//  Created by Marília de Sousa on 10/08/22.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userService = UserService()
        // Do any additional setup after loading the view.
        Task {
            try! await userService.getAllUsers()
        }
        view.backgroundColor = .red
    }


}

