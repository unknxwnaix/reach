//
//  AuthorizationViewModel.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import SwiftUI
import Combine

class AuthorizationViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var loggedInUser: User?
    @Published var isLoggedIn: Bool = false
    @Published var users: [User] = [] // Массив пользователей

    var sessionManager: UserSessionManager
    
    init(userSessionManager: UserSessionManager) {
        self.sessionManager = userSessionManager
        self.isLoggedIn = sessionManager.isLoggedIn
    }
    
    var isContinueAvailable: Bool {
        !username.isEmpty && !password.isEmpty
    }
    
    func fetchUsersOnAppear() {
        // Получаем пользователей при открытии сцены
        fetchUsers { users in
            self.users = users
        }
    }

    func login() {
        // Проверка логина и пароля по массиву пользователей
        if let user = users.first(where: { $0.login == self.username && $0.password == self.password }) {
            self.loggedInUser = user
            self.sessionManager.logIn() // Логинимся и передаем пользователя в сессию
            self.isLoggedIn = true // Устанавливаем флаг авторизации
        } else {
            self.errorMessage = "Неверный логин или пароль"
        }
    }
    
    private func fetchUsers(completion: @escaping ([User]) -> Void) {
        APIHelper.shared.fetchUsers { result in
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    completion(users)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = "Ошибка загрузки пользователей: \(error)"
                }
            }
        }
    }
}
