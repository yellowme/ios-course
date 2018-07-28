//
//  LoginManagerProtocol.swift
//  UserDefaults
//
//  Created by Daniel Rejon on 6/30/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol LoginManagerProtocol {
    func login()
    func logout()
    func didLogIn() -> Bool
}
