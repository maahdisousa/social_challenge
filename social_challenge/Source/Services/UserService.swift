//
//  UserService.swift
//  social_challenge
//
//  Created by Marília de Sousa on 10/08/22.
//

import Foundation

class UserService {
    func getAllUsers() async throws {
       let dataRequest = try await URLSession.shared.data(
        from: URL(string: Constants.baseUrl + "/users")!
       )
        
        print(dataRequest)
    }
}
