//
//  PokemonsParser.swift
//  SimpleAPIClient
//
//  Created by Luis Burgos on 6/8/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class PokemonsParser: AppParser<[SimplePokemon]> {
    override func parse(_ data: Data) -> [SimplePokemon]? {
        do {
            let decoder = JSONDecoder()
            let pokemons = try decoder.decode([SimplePokemon].self, from: data)
            return pokemons
        } catch {
            return nil
        }        
    }
}
