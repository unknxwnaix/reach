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
    @Published var expenseChartData = [PieceOfPie]()
    @Published var incomeChartData = [PieceOfPie]()
    @Published var transactions: [Transaction] = []
    @Published var errorMessage = ""
//    @Environment(\.verticalSizeClass) var verticalSizeClass
    
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
                    print("Загруженные транзакции: \(transactions)")
//                    self?.calculateChartData() // Обновляем данные для диаграммы
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = "Ошибка: \(error.localizedDescription)"
                    print("Ошибка загрузки транзакций: \(error.localizedDescription)") // Выводим ошибку в консоль
                }
            }
        }
    }
}
