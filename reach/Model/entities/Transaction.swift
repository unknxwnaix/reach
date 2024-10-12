//
//  Transaction.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import Foundation
import SwiftUI

struct Transaction: Codable {
    let id: Int
    let name: String
    let amount: String // оставляем как String
    let datetime: String // оставляем как String
    let user: Int
    let category: Int
    let operationType: Int
    let payingMethod: Int
    let currency: Int

    private enum CodingKeys: String, CodingKey {
        case id, name, amount, datetime, user, category
        case operationType = "operation_type"
        case payingMethod = "paying_method"
        case currency
    }
}
