//
//  MainWindowViewModel.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 07-10-2024.
//

import Foundation
import SwiftUI
import Combine

class MainWindowViewModel: ObservableObject {
    @Published var expenseChartData = [PieceOfPie]() // Для трат
    @Published var incomeChartData = [PieceOfPie]() // Для зачислений
    @Published var transactions: [Transaction] = []
    @Published var errorMessage = ""
    
    private var apiHelper = APIHelper.shared
    
    init() {
        fetchTransactions() // загружаем данные при инициализации
    }
    
    // Получаем транзакции
    func fetchTransactions() {
        apiHelper.fetchTransactions { [weak self] result in
            switch result {
            case .success(let transactions):
                DispatchQueue.main.async {
                    self?.transactions = transactions
                    print("Загруженные транзакции: \(transactions)") // Выводим транзакции в консоль
                    self?.calculateChartData() // Обновляем данные для диаграммы
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = "Ошибка: \(error.localizedDescription)"
                    print("Ошибка загрузки транзакций: \(error.localizedDescription)") // Выводим ошибку в консоль
                }
            }
        }
    }


    func calculateChartData() {
        var totalExpenses: Float = 0
        var totalIncome: Float = 0

        // Считаем общую сумму трат и зачислений
        for transaction in transactions {
            if let amount = Float(transaction.amount) { // Преобразуем строку в Float
                if transaction.operationType == 3 { // Траты
                    totalExpenses += amount
                } else if transaction.operationType == 2 { // Зачисления
                    totalIncome += amount
                }
            }
        }

        // Генерируем части для диаграммы трат с оттенками красного
        var expenseChartData: [PieceOfPie] = []
        if totalExpenses > 0 {
            for (index, transaction) in transactions.enumerated() where transaction.operationType == 3 {
                if let amount = Float(transaction.amount) {
                    let transactionPercent = (amount / totalExpenses) * 100
                    let color = generateColor(base: .red, index: index, total: transactions.count)
                    expenseChartData.append(PieceOfPie(color: color, percent: CGFloat(transactionPercent), value: 0))
                }
            }
        }
        self.expenseChartData = expenseChartData

        // Генерируем части для диаграммы зачислений с оттенками зеленого
        var incomeChartData: [PieceOfPie] = []
        if totalIncome > 0 {
            for (index, transaction) in transactions.enumerated() where transaction.operationType == 2 {
                if let amount = Float(transaction.amount) {
                    let transactionPercent = (amount / totalIncome) * 100
                    let color = generateColor(base: .green, index: index, total: transactions.count)
                    incomeChartData.append(PieceOfPie(color: color, percent: CGFloat(transactionPercent), value: 0))
                }
            }
        }
        self.incomeChartData = incomeChartData

        // Рассчитываем пути для обеих диаграмм
        calcOfPaths(for: &self.expenseChartData)
        calcOfPaths(for: &self.incomeChartData)
    }

    // Функция для генерации оттенков цвета
    func generateColor(base: Color, index: Int, total: Int) -> Color {
        let shadeFactor = Double(index) / Double(total)
        return base.opacity(0.4 + shadeFactor * 0.6) // От 40% до 100% непрозрачности
    }


    
    func calcOfPaths(for chartData: inout [PieceOfPie]) {
        var value: CGFloat = 0
        for index in 0..<chartData.count {
            chartData[index].value = value
            value += chartData[index].percent
        }
    }
}
