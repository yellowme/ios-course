//
//  DispatchManager.swift
//  UserDefaults
//
//  Created by Luis Burgos on 6/30/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class DispatchManager: DispatchManagerProtocol {
    func save(message: String?) {
        UserDefaults.standard.set(
            message,
            forKey: LocalKeys.loadingMessage.rawValue
        )
    }
    
    func retrieve() -> String? {
        return UserDefaults.standard.string(
            forKey: LocalKeys.loadingMessage.rawValue
        )
    }
    
    func clear() {
        UserDefaults.standard.removeObject(
            forKey: LocalKeys.loadingMessage.rawValue
        )
    }
}
