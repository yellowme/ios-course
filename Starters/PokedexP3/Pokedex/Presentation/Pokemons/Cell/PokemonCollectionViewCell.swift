//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/11/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Types
    
    public enum TypesBehavior {
        case single(label: String)
        case double(firstLabel: String, secondLabel: String)
    }
    
    //MARK: - Variables
    
    static let identifier = "PokemonCollectionViewCell"
    
    //MARK: - Outlets
    
    @IBOutlet weak var numberIdentifierLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var twoTypesViewContainer: UIView!
    @IBOutlet weak var singleTypeViewContainer: UIView!
    
    //MARK: - Outlets - Single
    
    @IBOutlet weak var singleTypeLabel: UILabel!
    
    //MARK: - Outlets - Double
    
    @IBOutlet weak var doubleTypeFirstLabel: UILabel!
    @IBOutlet weak var doubleTypeSecondLabel: UILabel!
    
    //MARK: - Cell
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setTypesBehavior(_ type: TypesBehavior) {
        switch type {
        case .single(let label):
            twoTypesViewContainer.isHidden = true
            singleTypeViewContainer.isHidden = false
            singleTypeLabel.text = label
            singleTypeLabel.backgroundColor = PokemonType.color(from: label)
            singleTypeViewContainer.backgroundColor = PokemonType.color(from: label)
            break
        case .double(let firstLabel, let secondLabel):
            twoTypesViewContainer.isHidden = false
            singleTypeViewContainer.isHidden = true
            doubleTypeFirstLabel.text = firstLabel
            doubleTypeFirstLabel.backgroundColor = PokemonType.color(from: firstLabel)
            doubleTypeSecondLabel.text = secondLabel
            doubleTypeSecondLabel.backgroundColor = PokemonType.color(from: secondLabel)
            break
        }
    }
}

