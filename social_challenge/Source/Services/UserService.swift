//
//  UserService.swift
//  social_challenge
//
//  Created by Marília de Sousa on 10/08/22.
//

import Foundation

class UserService {
    
    func getAllUsers() async throws -> [UserModel] {
        do {
            let (dataRequest, _) = try await URLSession.shared.data(
             from: URL(string: Constants.baseUrl + "/users")!
            )
         
             let result = try JSONDecoder().decode([UserModel].self, from: dataRequest)
             return result
        } catch {
            throw error
        }
    }
    
}
