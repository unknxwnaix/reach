//
//  ContentView.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 30-09-2024.
//

import SwiftUI

struct AuthorizationView: View {
    @Binding var isLoginMode: Bool // Добавляем связь с AuthenticationView
    @EnvironmentObject var vm: AuthorizationViewModel
    @EnvironmentObject var userSessionManager: UserSessionManager
    
    var body: some View {
        ZStack {
            WaveBackGroundView()
                .transition(.slide)
            
            VStack(spacing: 20) {
                Spacer()
                Spacer()
                
                Text("Authorization")
                    .font(.customRoundedFont(.extraLarge))
                    .foregroundColor(Color("textColor"))
                    .fontWeight(.bold)
                
                ZStack {
                    VStack {
                        InputFieldView(hint: "Username", imageName: "person", text: $vm.username)
                        InputFieldView(hint: "Password", imageName: "lock", text: $vm.password, isSecure: true)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
                    .shadow(radius: 10)
                    .padding(.horizontal, 35)
                    
                    if vm.isContinueAvailable {
                        HStack {
                            Spacer()
                            
                            Button {
                                vm.login()
                            } label: {
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
                            .transition(.scale) // Переход с масштабированием
                        }
                    }
                }
                .animation(.easeInOut(duration: 0.5), value: vm.isContinueAvailable)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        isLoginMode = false // Переключаемся на регистрацию
                    }) {
                        Text("Register")
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
                
                // Отображение сообщения об ошибке
                if !vm.errorMessage.isEmpty {
                    Text(vm.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                // Переход на профиль после успешной авторизации
                if vm.isLoggedIn, let user = vm.loggedInUser {
                    NavigationLink(
                        destination: ProfileView(user: user),
                        isActive: $vm.isLoggedIn,
                        label: {
                            EmptyView()
                        })
                }
            }
            .onAppear {
                vm.fetchUsersOnAppear() // Загрузка пользователей при открытии сцены
            }
        }
    }
}

#Preview {
    // Создаем состояние для переключения между режимами
    let isLoginMode = Binding<Bool>(get: { true }, set: { _ in })
    
    AuthorizationView(isLoginMode: isLoginMode)
        .environmentObject(AuthorizationViewModel(userSessionManager: UserSessionManager.shared))
}
