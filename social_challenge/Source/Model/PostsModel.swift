//
//  PostsModel.swift
//  social_challenge
//
//  Created by Thiago Henrique on 10/08/22.
//

import Foundation

struct PostsModel: Decodable {
    let id: String
    let content: String
    let likeCount: Int
    let userId: String
    let createdAt: String
    let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, content
        case likeCount = "like_count"
        case userId = "user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
