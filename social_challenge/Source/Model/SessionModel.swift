//
//  SessionModel.swift
//  social_challenge
//
//  Created by Thiago Henrique on 16/08/22.
//

import Foundation

// MARK: - Session
struct SessionModel: Codable {
    let user: UserModel
    let token: String
}
