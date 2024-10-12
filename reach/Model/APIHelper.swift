//
//  APIHelper.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

// APIHelper.swift

import Foundation
import SwiftUI

class APIHelper {
    static let shared = APIHelper()
    // private let baseURL = "http://192.168.1.96:8000/api/"
    private let baseURL = "http://172.20.10.3:8000/api/" // С телефона

    // Метод для получения всех пользователей
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)users/") else {
            completion(.failure(APIError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }

        task.resume()
    }

    // Метод для регистрации пользователя
    func registerUser(username: String, password: String, email: String, fullName: String, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)users/") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let user = [
            "login": username,
            "password": password,
            "email": email,
            "full_name": fullName
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: user, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    completion(.success(jsonResponse))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    func fetchTransactions(completion: @escaping (Result<[Transaction], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)transactions/") else {
            completion(.failure(APIError.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            // Логируем ответ сервера
            print(String(data: data, encoding: .utf8) ?? "Не удалось преобразовать данные в строку")

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601 // Устанавливаем стратегию декодирования для даты
                let transactions = try decoder.decode([Transaction].self, from: data)
                completion(.success(transactions))
            } catch let decodingError {
                print("Ошибка декодирования: \(decodingError)")
                completion(.failure(decodingError))
            }
        }

        task.resume()
    }


    // Возможные ошибки API
    enum APIError: Error {
        case invalidURL
        case noData
        case decodingError
    }
}
