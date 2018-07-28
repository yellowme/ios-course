//
//  DispatchManager.swift
//  UserDefaults
//
//  Created by Daniel Rejon on 6/30/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class DispatchManager: DispatchManagerProtocol {
    // Dispatcher
    func save(message: String?) {
        UserDefaults.standard.set(
            message,
            forKey: LocalKeys.loadingMessage.rawValue
        )
    }
    
    func retrieve() -> String? {
        return UserDefaults.standard.string(forKey: LocalKeys.loadingMessage.rawValue)
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: LocalKeys.loadingMessage.rawValue)
    }
    
    // Login
    func login() {
        UserDefaults.standard.set(true, forKey: LocalKeys.didLogin.hashValue)
    }
    
    func logout() {
        
    }
    
    func didLogIn() -> Bool {
        
    }
}
