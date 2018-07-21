//
//  String+Formatter.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/13/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

extension String {
    func toNumberIdentifier() -> String {
        return String(format: "#%@", self)
    }
}
