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
        cell.numberIdentifierLabel?.text = pokemon.id?.toNumberIdentifier() ?? "??"
        cell.nameLabel?.text = pokemon.name ?? "No name"
        cell.imageView.loadImage(from: pokemon.imageUrl ?? "")    
        decorate(cell, for: pokemon.types)
    }
    
    private func decorate(_ cell: PokemonCollectionViewCell, for types: [String]?) {
        guard let types = types else {
            return
        }
        
        guard types.count > 0, types.count <= 2 else {
            return
        }
        
        let isSingle = types.count == 1
        cell.setTypesBehavior(
            isSingle ?
                .single(label: types[0]) :
                .double(firstLabel: types[0], secondLabel: types[1])
        )
    }
}
