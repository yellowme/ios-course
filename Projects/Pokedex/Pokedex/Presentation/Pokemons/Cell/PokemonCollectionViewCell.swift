//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/11/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Variables
    
    static let identifier = "PokemonCollectionViewCell"
    
    //MARK: - Outlets
    
    @IBOutlet weak var numberIdentifierLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var twoTypesViewContainer: UIView!
    @IBOutlet weak var singleTypeViewContainer: UIView!
    
    //MARK: - Cell
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

