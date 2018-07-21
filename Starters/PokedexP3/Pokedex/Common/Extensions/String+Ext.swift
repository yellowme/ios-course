//
//  String+Ext.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/11/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

extension String {
    // MARK: - Consntats
    // HERE: Add yours
    static let empty = ""
    static let appName = "Pokédex"
    static let emptyList = "No hay resultados"
    static let understood = "Entendido"
    static let cancel = "Cancelar"
    static let forgetIt = "Olvídalo"
    static let fillAllFields = "Por favor, llena todos los campos"
    static let unknownZone = "Ubicación desconocida"
    static let no = "No"
    static let yes = "Si"
    static let pokedex = "Pokédex"
    
    // MARK: - Validations
    // HERE: Add yours
    static let enterValidUsername = "Ingresa un nombre de usuario válido"
    
    // MARK: - Icons
    // HERE: Add yours
    static let closeIcon = "close"
    static let pokedexIcon = "pokedex"
    
    //MARK: - Messages
    // HERE: Add yours
    static let invalidCodeMsg = "El código introducido es inválido"
    static let serverError = "Lo sentimos, no se pudo solicitar su servicio."
}

//MARK: - Conversion Helper
extension String {
    func isNotEmpty() -> Bool {
        return self != ""
    }
}
