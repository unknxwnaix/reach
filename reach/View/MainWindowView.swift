//
//  MainWindow.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 04-10-2024.
//

import SwiftUI

struct MainWindowView: View {
    @ObservedObject var viewModel = MainWindowViewModel()
    @State private var indexOftappedSlice = -1
    
    var body: some View {
        VStack {
            if viewModel.transactions.isEmpty {
                Text("Нет данных для отображения")
                    .font(.headline)
                    .foregroundColor(.gray)
            } else {
                // Диаграмма трат
                Text("Траты")
                    .font(.headline)
                    .padding(.top)
                chartCircleView(expenseChartData: viewModel.expenseChartData)
                    .frame(width: 100, height: 200)
                chartListView(chartData: viewModel.expenseChartData)
                    .padding(8)
                    .frame(width: 300, alignment: .trailing)
                Text("Всего потрачено: \(String(format: "%.2f", viewModel.transactions.filter { $0.operationType == 3 }.reduce(0) { $0 + (Float($1.amount) ?? 0) }))")
                
                // Диаграмма зачислений
                Text("Зачисления")
                    .font(.headline)
                    .padding(.top)
                chartCircleView(expenseChartData: viewModel.incomeChartData)
                    .frame(width: 100, height: 200)
                chartListView(chartData: viewModel.incomeChartData)
                    .padding(8)
                    .frame(width: 300, alignment: .trailing)
                Text("Всего зачислено: \(String(format: "%.2f", viewModel.transactions.filter { $0.operationType == 2 }.reduce(0) { $0 + (Float($1.amount) ?? 0) }))")
            }
        }
        .onAppear {
            viewModel.fetchTransactions() // Загружаем транзакции при появлении вью
        }
    }
}

extension MainWindowView {
    private func chartCircleView(expenseChartData: [PieceOfPie]) -> some View {
        ZStack {
            ForEach(0..<expenseChartData.count) { index in
                Circle()
                    .trim(from: index == 0 ? 0.0 : expenseChartData[..<index].map { $0.percent / 100 }.reduce(0, +),
                          to: expenseChartData[..<(index + 1)].map { $0.percent / 100 }.reduce(0, +))
                    .stroke(expenseChartData[index].color, lineWidth: 100)
                    .scaleEffect(index == indexOftappedSlice ? 1.2 : 1)
                    .animation(.spring())
            }
        }
    }
    
    private func chartListView(chartData: [PieceOfPie]) -> some View {
        ForEach(0..<chartData.count) { index in
            HStack {
                Text(String(format: "%.1f", Double(chartData[index].percent)) + "%")
                    .onTapGesture {
                        indexOftappedSlice = indexOftappedSlice == index ? -1 : index
                    }
                    .font(indexOftappedSlice == index ? .headline : .subheadline)
                RoundedRectangle(cornerRadius: 3)
                    .fill(chartData[index].color)
                    .frame(width: 20, height: 20)
            }
        }
    }
}

#Preview {
    MainWindowView()
        .environmentObject(MainWindowViewModel())
}
