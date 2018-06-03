//
//  SimpleMovie.swift
//  TableView
//
//  Created by Luis Burgos on 6/2/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class SimpleMovie: Movie {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
