//
//  PieceOfPieContainer.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 04-10-2024.
//

import Foundation
import SwiftUI

class PieceOfPieContainer: ObservableObject {
    @Published var chartData: [[PieceOfPie]] = [
        [
            PieceOfPie(color: .cyan, value: 12000),
            PieceOfPie(color: .purple, value: 3400),
            PieceOfPie(color: .pink, value: 48000),
            PieceOfPie(color: .blue, value: 57000),
            PieceOfPie(color: .orange, value: 8900)
        ],
        [
            PieceOfPie(color: .yellow, value: 10200),
            PieceOfPie(color: .green, value: 4500),
            PieceOfPie(color: .indigo, value: 37600),
            PieceOfPie(color: .mint, value: 64000),
            PieceOfPie(color: .brown, value: 7800)
        ],
        [
            PieceOfPie(color: .teal, value: 14000),
            PieceOfPie(color: .orange, value: 6300),
            PieceOfPie(color: .blue, value: 51200),
            PieceOfPie(color: .pink, value: 52000),
            PieceOfPie(color: .cyan, value: 6500)
        ],
        [
            PieceOfPie(color: .mint, value: 15000),
            PieceOfPie(color: .red, value: 2900),
            PieceOfPie(color: .yellow, value: 40000),
            PieceOfPie(color: .indigo, value: 68000),
            PieceOfPie(color: .gray, value: 9200)
        ]
    ]
}
