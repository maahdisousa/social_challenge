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
    
    func registerUser(registerUserModel: RegisterUserModel) async throws {
        let newUserJson = try JSONEncoder().encode(registerUserModel)
        guard let url = URL(string: Constants.baseUrl + "/users") else { fatalError("Missing URL") }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: urlRequest, from: newUserJson)
            print(data)
        } catch {
            throw error
        }
    
    }
    
}
