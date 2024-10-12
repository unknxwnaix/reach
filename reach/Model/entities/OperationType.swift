//
//  OperationType.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import Foundation

struct OperationType: Codable, Identifiable {
    let id: Int
    let typeName: String

    enum CodingKeys: String, CodingKey {
        case id
        case typeName = "type_name"
    }
}
