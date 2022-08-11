//
//  RegisterUserModel.swift
//  social_challenge
//
//  Created by Thiago Henrique on 11/08/22.
//

import Foundation

struct RegisterUserModel: Encodable {
    let name: String
    let email: String
    let password: String
}
