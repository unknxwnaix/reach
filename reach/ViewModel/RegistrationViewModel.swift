//
//  RegistrationViewModel.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import SwiftUI
import Combine

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var email = ""
    @Published var fullName = ""
    
    var sessionManager: UserSessionManager

    init(sessionManager: UserSessionManager) {
        self.sessionManager = sessionManager
    }
    
    var isContinueAvailable: Bool {
        !username.isEmpty && !password.isEmpty && !email.isEmpty && !fullName.isEmpty
    }
    
    func registerUser() {
        // Вызов APIHelper для регистрации
        APIHelper.shared.registerUser(username: username, password: password, email: email, fullName: fullName) { result in
            switch result {
            case .success(_):
                // Сразу логиним пользователя после успешной регистрации
                _ = User(id: UUID().hashValue, login: self.username, password: self.password, fullName: self.fullName, email: self.email)
                self.sessionManager.logIn()
            case .failure(let error):
                print("Ошибка регистрации: \(error)")
            }
        }
    }
}
