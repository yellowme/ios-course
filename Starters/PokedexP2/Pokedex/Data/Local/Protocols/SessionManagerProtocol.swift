//
//  SessionManagerProtocol.swift
//  UserDefaults
//
//  Created by Luis Burgos on 6/30/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol SessionManagerProtocol {
    func save(session: Session?)
    func retrieve() -> Session
    func clear()
}
