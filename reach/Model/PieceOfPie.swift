//
//  PieceOfPie.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 04-10-2024.
//

import Foundation
import SwiftUI

struct PieceOfPie: Identifiable {
    let id = UUID()
    let color: Color
    let percent: CGFloat
    var value: CGFloat
}
