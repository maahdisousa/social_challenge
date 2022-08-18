//
//  PostTableViewCell.swift
//  social_challenge
//
//  Created by Marília de Sousa on 18/08/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let  identifier = "PostTableViewCell"
    
    let imageUser: UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userName: UILabel = {
        let userName = UILabel()
        userName.text = "Seu Menino"
        userName.tintColor = .black
        userName.font =  UIFont.boldSystemFont(ofSize: 16)
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    let card: UIView = {
        let card = UIView()
        card.backgroundColor = .lightGray
        card.layer.cornerRadius = 32
        return card
    }()
    
    let postTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 0.5
        textView.layer.cornerRadius = 12
        textView.tintColor = .black
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "heart")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let numberOfLikes: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.tintColor = .black
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(card)
        contentView.addSubview(imageUser)
        contentView.addSubview(userName)
        contentView.addSubview(postTextView)
        contentView.addSubview(likeButton)
        contentView.addSubview(numberOfLikes)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        card.frame = contentView.bounds
        
        loadCardConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadCardConstraints() {
        let imageUserConstraints = [
            imageUser.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 30),
            imageUser.topAnchor.constraint(equalTo: card.topAnchor, constant: 30),
            imageUser.widthAnchor.constraint(equalToConstant: 65),
            imageUser.heightAnchor.constraint(equalToConstant: 65)
        ]
        
        let userLabelConstraints = [
            userName.leadingAnchor.constraint(equalTo: imageUser.trailingAnchor, constant: 10),
            userName.centerYAnchor.constraint(equalTo: imageUser.centerYAnchor)
        ]
        
        let textViewConstraints = [
            postTextView.topAnchor.constraint(equalTo: imageUser.bottomAnchor, constant: 25),
            postTextView.leadingAnchor.constraint(equalTo: imageUser.leadingAnchor),
            postTextView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: -30),
            postTextView.heightAnchor.constraint(equalToConstant: 180)
        ]
        
        let likeButtonConstraints = [
            likeButton.trailingAnchor.constraint(equalTo: postTextView.trailingAnchor, constant: -10),
            likeButton.bottomAnchor.constraint(equalTo: postTextView.bottomAnchor, constant: -10),
            likeButton.widthAnchor.constraint(equalToConstant: 20),
            likeButton.heightAnchor.constraint(equalToConstant: 16)
        ]
        
        let numberOfLikesConstraints = [
            numberOfLikes.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -5),
            numberOfLikes.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(imageUserConstraints)
        NSLayoutConstraint.activate(userLabelConstraints)
        NSLayoutConstraint.activate(textViewConstraints)
        NSLayoutConstraint.activate(likeButtonConstraints)
        NSLayoutConstraint.activate(numberOfLikesConstraints)
    }
    
    func configureCell(model: PostsModel) {
        postTextView.text = model.content
        numberOfLikes.text = String(model.likeCount)
    }
    
}
