//
//  Goal.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import Foundation

struct Goal: Codable, Identifiable {
    let id: Int
    let user: Int
    let name: String
    let description: String
    let amount: Double
    let currency: Int?
    let goalType: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case user
        case name
        case description
        case amount
        case currency
        case goalType = "goal_type"
    }
}
