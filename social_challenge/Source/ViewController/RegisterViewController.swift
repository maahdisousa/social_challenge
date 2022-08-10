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
        Task{
            print(await obtainPosts())
        }
        view.backgroundColor = .red
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
}

