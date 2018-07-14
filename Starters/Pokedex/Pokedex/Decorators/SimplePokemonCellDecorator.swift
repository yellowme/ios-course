//
//  SimpleMovieCellDecorator.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class SimplePokemonCellDecorator: AppCellDecorator<Pokemon> {
    override func decorate(cell: UITableViewCell, using model: Pokemon?) {
        let pokemon = model as! SimplePokemon
        cell.textLabel?.text = pokemon.name ?? "No name"
    }
}
