//
//  UserSessionManager.swift
//  reach
//
//  Created by Maxim Dmitrochenko on 06-10-2024.
//

import Foundation

class UserSessionManager: ObservableObject {
    static let shared = UserSessionManager()
    
    @Published var isLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    
    init() {
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    func logIn() {
        isLoggedIn = true
    }
    
    func logOut() {
        isLoggedIn = false
    }
}
