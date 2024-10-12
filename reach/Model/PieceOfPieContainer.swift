//
//  PieceOfPieContainer.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 04-10-2024.
//

import Foundation
import SwiftUI

class PieceOfPieContainer: ObservableObject {
    @Published var chartData = [
        PieceOfPie(color: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), percent: 8, value: 0),
        PieceOfPie(color: Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), percent: 32 , value: 0),
        PieceOfPie(color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), percent: 45, value: 0),
        PieceOfPie(color: Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), percent: 15, value: 0)
    ]
    
    func calcOfPaths() {
        var value: CGFloat = 0

        for index in 0..<chartData.count {
            chartData[index].value = value
            value += chartData[index].percent
        }
    }
}
