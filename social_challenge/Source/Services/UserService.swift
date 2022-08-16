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
    
    func loginUser(email: String, password: String) async throws -> SessionModel {
        let loginString = "\(email):\(password)"
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        guard let url = URL(string: Constants.baseUrl + "/users/login") else { fatalError("Missing URL") }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        urlRequest.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let result = try JSONDecoder().decode(SessionModel.self, from: data)
            
            return result
        } catch {
            throw error
        }
    }
    
}
