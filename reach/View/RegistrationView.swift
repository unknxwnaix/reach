//
//  RegistrationView.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 30-09-2024.
//

import SwiftUI

struct RegistrationView: View {
    @Binding var isLoginMode: Bool // Добавляем связь с AuthenticationView
    @StateObject private var viewModel = RegistrationViewModel(sessionManager: UserSessionManager.shared)

    var body: some View {
        ZStack {
            WaveBackGroundView()

            VStack(spacing: 20) {
                Spacer()
                Spacer()

                Text("Registration")
                    .font(.customRoundedFont(.extraLarge))
                    .foregroundColor(Color("textColor"))
                    .fontWeight(.bold)

                ZStack {
                    VStack {
                        InputFieldView(hint: "Username", imageName: "person", text: $viewModel.username)
                        InputFieldView(hint: "Password", imageName: "lock", text: $viewModel.password, isSecure: true)
                        InputFieldView(hint: "Email", imageName: "mail", text: $viewModel.email)
                        InputFieldView(hint: "Full name", imageName: "figure.mixed.cardio", text: $viewModel.fullName)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(radius: 10)
                    .padding(.horizontal, 35)

                    HStack {
                        Spacer()

                        if viewModel.isContinueAvailable {
                            Button(action: {
                                viewModel.registerUser()
                            }) {
                                ZStack {
                                    Circle()
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(.green)
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30, weight: .bold))
                                }
                            }
                            .padding(.trailing, 5)
                        }
                    }
                }

                Spacer()

                HStack {
                    Button(action: {
                        isLoginMode = true // Переключаемся на авторизацию
                    }) {
                        Text("Log In")
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                            .padding(20)
                    }
                    .padding(.leading, 35)
                    .background(Color.white)
                    .clipShape(RightRoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 0)
                    .shadow(radius: 10)

                    Spacer()
                }

                Spacer()
            }
        }
    }
}

#Preview {
    // Создаем состояние для переключения между режимами
    let isLoginMode = Binding<Bool>(get: { true }, set: { _ in })
    
    RegistrationView(isLoginMode: isLoginMode)
        .environmentObject(RegistrationViewModel(sessionManager: UserSessionManager.shared))
}

