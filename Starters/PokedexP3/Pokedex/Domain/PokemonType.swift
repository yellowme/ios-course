//
//  PokemonType.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/13/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

enum PokemonType: String {
    case all = "all"
    case normal = "normal"
    case fighting = "fighting"
    case flying = "flying"
    case poison = "poison"
    case ground = "ground"
    case rock = "rock"
    case bug = "bug"
    case ghost = "ghost"
    case fire = "fire"
    case water = "water"
    case grass = "grass"
    case electric = "electric"
    case psychic = "psychic"
    case ice = "ice"
    case dragon = "dragon"
    
    static func color(from rawType: String) -> UIColor {
        if let type = PokemonType(rawValue: rawType.lowercased()) {
            switch type {
                case .all:
                    return UIColor.windowsBlue
                case .fire:
                    return UIColor.dullOrange
                case .water:
                    return UIColor.waterBlue
                case .bug:
                    return UIColor.booger
                case .poison:
                    return UIColor.poisonPurple
                case .flying:
                    return UIColor.dustyLavender
                case .ground:
                    return UIColor.groundBrown
                case .ghost:
                    return UIColor.ghostPurple
                case .normal:
                    return UIColor.normalGray
                case .fighting:
                    return UIColor.brick
                case .dragon:
                    return UIColor.purpleishBlue
                case .psychic:
                    return UIColor.psychicPink
                case .grass:
                    return UIColor.grassGreen
                case .electric:
                    return UIColor.maize
                case .rock:
                    return UIColor.rockGray
                case .ice:
                    return UIColor.iceBlue
            }
        } else {
            return UIColor.windowsBlue
        }
    }
    
    func allTypes() -> [PokemonType] {
        return [
            .all,
            .normal,
            .fighting,
            .flying,
            .poison,
            .ground,
            .rock,
            .bug,
            .ghost,
            .fire,
            .water,
            .grass,
            .electric,
            .psychic,
            .ice,
            .dragon,
        ]
    }
}
