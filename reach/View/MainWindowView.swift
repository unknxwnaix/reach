//
//  MainWindow.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 04-10-2024.
//

import SwiftUI
import Charts

struct MainWindowView: View {
    @ObservedObject var vm = MainWindowViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(PieceOfPie.example.indices, id: \.self) { index in
                            Chart {
                                ForEach(PieceOfPie.example[index].sorted { $0.value > $1.value }) { sector in
                                    SectorMark(angle: .value("Value", sector.value), innerRadius: .ratio(0.6), angularInset: 3)
                                        .foregroundStyle(sector.color)
                                        .cornerRadius(10)
                                }
                            }
                            .chartLegend(.visible)
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.5)
                                    .scaleEffect(x: phase.isIdentity ? 1.0 : 0.6, y: phase.isIdentity ? 1 : 0.6)
                                    .offset(y: phase.isIdentity ? 0 : 100)
                                    
                            }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
            }
            .navigationTitle("Диаграммы")
            .padding()
        }
    }
}

#Preview {
    MainWindowView()
        .environmentObject(MainWindowViewModel())
}
