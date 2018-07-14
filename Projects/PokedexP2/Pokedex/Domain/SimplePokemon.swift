//
//  SimpleMovie.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

struct SimplePokemon: Pokemon, Codable {
    let id: String?
    let types: [String]?
    let region: String?
    let generation: String?
    let imageUrl: String?
    let name: String?
    
    private enum CodingKeys: CodingKey {
        case id
        case types
        case region
        case generation
        case imageUrl
        case name
    }
}
