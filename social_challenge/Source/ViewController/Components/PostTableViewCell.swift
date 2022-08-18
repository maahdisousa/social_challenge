//
//  PostTableViewCell.swift
//  social_challenge
//
//  Created by Marília de Sousa on 18/08/22.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let  identifier = "PostTableViewCell"
    
    let postLabel: UILabel = {
        let label = UILabel()
        label.text = "Postagem"
        label.tintColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let imageUser: UIImageView = {
        let image = UIImageView()
        image.tintColor = .black
        image.image = UIImage(systemName: "person.crop.cicle")
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userName: UILabel = {
        let userName = UILabel()
        userName.text = "Seu Menino"
        userName.tintColor = .black
        userName.font = .systemFont(ofSize: 20)
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    let card: UIView = {
        let card = UIView()
        card.backgroundColor = .lightGray
        card.layer.cornerRadius = 32
        return card
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(card)
        contentView.addSubview(imageUser)
        contentView.addSubview(userName)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        card.frame = contentView.bounds
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
