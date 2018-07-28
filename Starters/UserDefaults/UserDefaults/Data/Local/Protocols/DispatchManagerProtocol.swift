//
//  DispatchManagerProtocol.swift
//  UserDefaults
//
//  Created by Daniel Rejon on 6/30/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol DispatchManagerProtocol {
    // Dispatch
    func save(message: String?)
    func retrieve() -> String?
    func clear()
    
    // Login
    func login()
    func logout()
    func didLogIn() -> Bool
}
