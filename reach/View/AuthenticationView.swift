//
//  AuthenticationView.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import SwiftUI

struct AuthenticationView: View {
    @State private var isLoginMode = true
    @EnvironmentObject var sessionManager: UserSessionManager

    var body: some View {
        Group {
            if sessionManager.isLoggedIn {
                // Если пользователь уже вошел, показываем профиль
                ProfileView(user: User(id: 1, login: "user1", password: "password1", fullName: "User One", email: "user1@example.com"))
            } else {
                if isLoginMode {
                    AuthorizationView(isLoginMode: $isLoginMode)
                        .environmentObject(AuthorizationViewModel(userSessionManager: sessionManager))
                } else {
                    RegistrationView(isLoginMode: $isLoginMode)
                        .environmentObject(RegistrationViewModel(sessionManager: sessionManager))
                }
            }
        }
    }
}

#Preview {
    AuthenticationView()
        .environmentObject(UserSessionManager.shared)
}

