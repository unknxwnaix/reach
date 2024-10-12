//
//  ProfileView.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import SwiftUI

struct ProfileView: View {
    var user: User

    var body: some View {
        VStack(spacing: 20) {
            Text("Добро пожаловать, \(user.fullName)!")
                .font(.title)
                .padding()

            Text("Email: \(user.email)")
                .foregroundColor(.gray)

            Spacer()
            
            Button("Logout") {
                UserSessionManager.shared.logOut()
            }
        }
        .navigationTitle("Профиль")
    }
}


#Preview {
    ProfileView(user: User(id: 1, login: "user1", password: "password1", fullName: "User One", email: "user1@example.com"))
}
