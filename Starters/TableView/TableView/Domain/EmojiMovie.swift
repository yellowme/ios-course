//
//  EmojiMovie.swift
//  TableView
//
//  Created by Luis Burgos on 6/2/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class EmojiMovie: Movie {
    var id: String
    var name: String
    // TODO: Add emoji attribute
    
    // TODO: Also add the attribute to the initializer
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
