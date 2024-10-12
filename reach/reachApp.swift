//
//  reachApp.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 30-09-2024.
//

import SwiftUI

@main
struct reachApp: App {
    @StateObject private var userSessionManager = UserSessionManager.shared
    
    var body: some Scene {
        WindowGroup {
//            AuthenticationView()
//                .environmentObject(userSessionManager)
            MainWindowView()
                .environmentObject(MainWindowViewModel())
        }
    }
}
