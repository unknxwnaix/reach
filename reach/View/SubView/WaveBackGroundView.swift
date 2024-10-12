//
//  WaveShape.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 30-09-2024.
//

import SwiftUI

struct WaveBackGroundView: View {
    let topGradient = LinearGradient(colors: [.orange, .red], startPoint: .leading, endPoint: .trailing)
    let bottomGradient = LinearGradient(colors: [.blue, .mint], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Path { path in
                    path.move(to: .zero)
                    path.addLine(to: CGPoint(x: 400, y: 0))
                    path.addCurve(to: CGPoint(x: 200, y: 100), control1: CGPoint(x: 380, y: 100), control2: CGPoint(x: 300, y: 100))
                    path.addCurve(to: CGPoint(x: 0, y: 300), control1: CGPoint(x: 100, y: 100), control2: CGPoint(x: 90, y: 300))
                }
                .stroke(topGradient.opacity(0.5), lineWidth: 40)
                .fill(topGradient)
                
                Spacer()

                Path { path in
                    path.move(to: .zero)
                    path.addLine(to: CGPoint(x: 400, y: 0))
                    path.addCurve(to: CGPoint(x: 200, y: 100), control1: CGPoint(x: 380, y: 100), control2: CGPoint(x: 300, y: 100))
                    path.addCurve(to: CGPoint(x: 0, y: 300), control1: CGPoint(x: 100, y: 100), control2: CGPoint(x: 90, y: 300))
                }
                .stroke(bottomGradient.opacity(0.5), lineWidth: 40)
                .fill(bottomGradient)
                .rotationEffect(.degrees(180))
            }
            .ignoresSafeArea()
        }
        }
}

#Preview {
    WaveBackGroundView()
}
