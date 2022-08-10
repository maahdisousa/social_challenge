//
//  PostsService.swift
//  social_challenge
//
//  Created by Thiago Henrique on 10/08/22.
//

import Foundation

class PostsService {
    func getAllPosts() async throws -> [PostsModel]{
        do {
            let (postsRequest, _) = try await URLSession.shared.data(from: URL(string: Constants.baseUrl + "/posts")!)
            let jsonResult = try JSONDecoder().decode([PostsModel].self, from: postsRequest)
            return jsonResult
        } catch {
            throw error
        }
    }
}
