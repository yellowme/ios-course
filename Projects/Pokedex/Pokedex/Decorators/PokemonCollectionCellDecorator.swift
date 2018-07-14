//
//  PokemonCollectionCellDecorator.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/12/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class PokemonCollectionCellDecorator: AppCollectionCellDecorator<PokemonCollectionViewCell, Pokemon> {
    override func decorate(cell: PokemonCollectionViewCell, using model: Pokemon?) {
        let pokemon = model as! SimplePokemon
        cell.nameLabel?.text = pokemon.name ?? "No name"
        //TODO: Decorate all other outlets
    }
}
