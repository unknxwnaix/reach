//
//  Color.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 07-10-2024.
//

import Foundation
import SwiftUI

extension Color {
    static func random() -> Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
