//
//  TypeTableCellDecorator.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/20/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class TypeTableCellDecorator: AppCellDecorator<PokemonType> {
    override func decorate(cell: UITableViewCell, using model: PokemonType?) {
        let typeCell = cell as! TypeTableViewCell
        typeCell.typeNameLabel?.text = model!.rawValue.uppercased()
        typeCell.containerView?.backgroundColor = model!.color()
    }
}
