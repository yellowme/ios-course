
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
            SimpleMovie(id: "1", name: "Regreso al futuro"),
            SimpleMovie(id: "2", name: "El planeta de los simios"),
            SimpleMovie(id: "3", name: "Harry Potter"),
            SimpleMovie(id: "4", name: "X-Men"),
            SimpleMovie(id: "5", name: "Star Wars"),
        ]
    }
    
    static func provideEmojiMovies() -> [Movie] {
        return [
            EmojiMovieRepresentation(id: "1", name: "Volver al futuro", emoji: "🕓⬅️🚗💨"),
            EmojiMovieRepresentation(id: "2", name: "El planeta de los simios", emoji: "🌎🐵🐵🐵"),
            EmojiMovieRepresentation(id: "3", name: "Harry Potter", emoji: "👦🏻👓⚡️"),
            EmojiMovieRepresentation(id: "4", name: "X-Men", emoji: "❌👨🏻👨🏻👨🏻"),
            EmojiMovieRepresentation(id: "5", name: "Star Wars", emoji: "⭐️💣💣🔫🔫"),
        ]
    }
}
