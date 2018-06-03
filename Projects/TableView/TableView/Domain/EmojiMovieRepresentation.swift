//
//  EmojiMovieRepresentation.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

struct EmojiMovieRepresentation: Movie {
    var id: String
    var name: String
    var emoji: String
    
    init(id: String, name: String, emoji: String) {
        self.id = id
        self.name = name
        self.emoji = emoji
    }
}
