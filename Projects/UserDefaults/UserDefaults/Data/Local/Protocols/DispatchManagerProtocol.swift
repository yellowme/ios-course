//
//  DispatchManagerProtocol.swift
//  UserDefaults
//
//  Created by Luis Burgos on 6/30/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol DispatchManagerProtocol {
    func save(message: String?)
    func retrieve() -> String?
    func clear()
}







