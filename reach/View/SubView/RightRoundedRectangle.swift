//
//  RightRoundedRectangle.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 30-09-2024.
//

import SwiftUI

struct RightRoundedRectangle: Shape {
    var cornerRadius: CGFloat = 50

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Левый верхний угол (без закругления)
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        
        // Правый верхний угол (закругленный)
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(-90),
                    endAngle: .degrees(0),
                    clockwise: false)
        
        // Правый нижний угол (закругленный)
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(90),
                    clockwise: false)
        
        // Левый нижний угол (без закругления)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}
