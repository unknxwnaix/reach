//
//  User.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let login: String
    let password: String
    let fullName: String
    let email: String

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case password = "password"
        case fullName = "full_name"
        case email
    }
}
