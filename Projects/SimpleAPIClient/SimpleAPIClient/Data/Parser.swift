//
//  Parser.swift
//  SimpleAPIClient
//
//  Created by Luis Burgos on 6/8/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol Parser {
    associatedtype ResponseModel
    func parse(_ data: Data) -> ResponseModel?
}

class AppParser<Model>: Parser {
    func parse(_ data: Data) -> Model? {
        // Override and parse the concrete model
        return nil
    }
}
