//
//  PokemonsContract.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/28/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol PokemonsView: BaseView {
    func displayPokemons(_ pokemons: [Pokemon])
}

protocol PokemonsViewPresenter {
    init(view: PokemonsView)
    func load()
    func search(name: String?, type: String?)    
}
