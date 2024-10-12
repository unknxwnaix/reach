//
//  TransactionCategory.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import Foundation

struct TransactionCategory: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
}
