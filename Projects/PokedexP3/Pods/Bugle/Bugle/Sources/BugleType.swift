//
//  BugleType.swift
//  Bugle
//
//  Created by Luis Burgos on 2/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit.UIAlertController

/**
 Wrappers for define style and setup for the alert
 */
typealias BugleActionStyles = (confirm: UIAlertActionStyle, cancel: UIAlertActionStyle, color: UIColor?)
typealias Tinter = (tint: UIColor?, errorTint: UIColor?)
typealias MergedOptions = (title: String, action: String, cancel: String, tinter: Tinter)

/**
 Available bugle types with defined styles and setups
 */
public enum BugleType {
    case single
    case confirmation
    case risky
    
    /**
     Creates a Style depending on selected type.
     
     - parameter options: Colors, meessages and common titles defined by the user.
     
     - returns: Set of styles given a type.
     */
    func style(for options: Tinter) -> BugleActionStyles {
        switch self {
        case .risky:            
            return (.cancel, .default, options.errorTint)
        default:
            return (.default, .cancel, options.tint)
        }
    }
}
