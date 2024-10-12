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
    var value: Double
}

extension PieceOfPie {
    static var example : [[PieceOfPie]] = [
        [
            PieceOfPie(color: .cyan, value: 12000),
            PieceOfPie(color: .purple, value: 3400),
            PieceOfPie(color: .pink, value: 48000),
            PieceOfPie(color: .blue, value: 57000)
        ],
        [
            PieceOfPie(color: .yellow, value: 10200),
            PieceOfPie(color: .green, value: 4500),
            PieceOfPie(color: .indigo, value: 37600),
            PieceOfPie(color: .mint, value: 64000)
        ],
        [
            PieceOfPie(color: .teal, value: 14000),
            PieceOfPie(color: .orange, value: 6300),
            PieceOfPie(color: .blue, value: 51200),
            PieceOfPie(color: .brown, value: 7800)
        ],
        [
            PieceOfPie(color: .mint, value: 15000),
            PieceOfPie(color: .red, value: 2900),
            PieceOfPie(color: .yellow, value: 40000),
            PieceOfPie(color: .gray, value: 9200)
        ],
        [
            PieceOfPie(color: .cyan, value: 22000),
            PieceOfPie(color: .purple, value: 5400),
            PieceOfPie(color: .pink, value: 30000),
            PieceOfPie(color: .blue, value: 46000)
        ],
        [
            PieceOfPie(color: .yellow, value: 18200),
            PieceOfPie(color: .green, value: 7500),
            PieceOfPie(color: .indigo, value: 29600),
            PieceOfPie(color: .mint, value: 45000)
        ],
        [
            PieceOfPie(color: .teal, value: 12000),
            PieceOfPie(color: .orange, value: 5300),
            PieceOfPie(color: .blue, value: 42200),
            PieceOfPie(color: .brown, value: 6800)
        ],
        [
            PieceOfPie(color: .mint, value: 16000),
            PieceOfPie(color: .red, value: 3900),
            PieceOfPie(color: .yellow, value: 32000),
            PieceOfPie(color: .gray, value: 10200)
        ],
        [
            PieceOfPie(color: .cyan, value: 18000),
            PieceOfPie(color: .purple, value: 6500),
            PieceOfPie(color: .pink, value: 41000),
            PieceOfPie(color: .blue, value: 37000)
        ],
        [
            PieceOfPie(color: .yellow, value: 9200),
            PieceOfPie(color: .green, value: 12500),
            PieceOfPie(color: .indigo, value: 28600),
            PieceOfPie(color: .mint, value: 54000)
        ],
        [
            PieceOfPie(color: .teal, value: 17000),
            PieceOfPie(color: .orange, value: 9300),
            PieceOfPie(color: .blue, value: 52200),
            PieceOfPie(color: .brown, value: 8800)
        ],
        [
            PieceOfPie(color: .mint, value: 25000),
            PieceOfPie(color: .red, value: 4900),
            PieceOfPie(color: .yellow, value: 35000),
            PieceOfPie(color: .gray, value: 11200)
        ]
    ]
}
