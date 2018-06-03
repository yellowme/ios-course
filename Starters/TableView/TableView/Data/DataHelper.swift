
//
//  File.swift
//  TableView
//
//  Created by Luis Burgos on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class DataHelper {
    static func provideSimpleMovies() -> [Movie] {
        return [
            SimpleMovie(id: "1", name: "Volver al futuro"),
            SimpleMovie(id: "2", name: "Planeta de los simios"),
            SimpleMovie(id: "3", name: "Harry Potter")
        ]
    }
    
    /*
     * 🕓⬅️🚗💨
     * 🌎🐵🐵🐵
     * 👦🏻👓⚡️
     * ❌👨🏻👨🏻👨🏻
     * ⭐️💣💣🔫🔫
     */
    static func provideEmojiMovies() -> [Movie] {
        return [
            EmojiMovie(id: "1", name: "🕓⬅️🚗💨"),
            EmojiMovie(id: "2", name: "🌎🐵🐵🐵")
        ]
    }
}
