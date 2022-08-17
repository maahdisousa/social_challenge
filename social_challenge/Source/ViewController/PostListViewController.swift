//
//  PostListViewController.swift
//  social_challenge
//
//  Created by Marília de Sousa on 17/08/22.
//

import UIKit

class PostListViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ada Network"
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    let userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle.fill")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let textFieldPost: UITextView = {
        let text = UITextView()
        text.layer.borderWidth = 0.5
        text.translatesAutoresizingMaskIntoConstraints =  false
        text.tintColor = .black
        text.layer.cornerRadius = 12
        return text
    }()
    
    let imagePost: UIImageView = {
        let imagePost = UIImageView()
        imagePost.image = UIImage(systemName: "photo.fill")
        imagePost.tintColor = .black
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        imagePost.contentMode = .scaleToFill
        return imagePost
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(userImage)
        view.addSubview(textFieldPost)
        view.addSubview(imagePost)
        
        loadConstraint()
    }

    func loadConstraint() {
        
        let titleLabelConstraint = [
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ]
        
        let userImageConstraint = [
            userImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            userImage.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 27),
            userImage.heightAnchor.constraint(equalToConstant: 27)
        ]
        
        let textFielPostConstraint = [
            textFieldPost.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            textFieldPost.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            textFieldPost.trailingAnchor.constraint(equalTo: userImage.trailingAnchor),
            textFieldPost.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let imagePostConstraint = [
            imagePost.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            imagePost.topAnchor.constraint(equalTo: textFieldPost.bottomAnchor, constant: 10),
            imagePost.widthAnchor.constraint(equalToConstant: 27),
            imagePost.heightAnchor.constraint(equalToConstant: 21)
            
        ]
        
        NSLayoutConstraint.activate(titleLabelConstraint)
        NSLayoutConstraint.activate(userImageConstraint)
        NSLayoutConstraint.activate(textFielPostConstraint)
        NSLayoutConstraint.activate(imagePostConstraint)
    }
    

}
