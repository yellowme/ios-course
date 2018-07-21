//
//  Bugle+Merge.swift
//  Bugle
//
//  Created by Luis Burgos on 2/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit.UIColor

/**
 Combines user defined and "play" method call options to unwrapped all settings for
 the alerts.
 
 - parameter options: Bugle pieces passed through the "play" method call.
 - parameter defaultOptions: User preferred bugle pieces defined after call "setup" method.
 
 - returns: The title, action title, cancel message, tint color and error tint color for the alert
 */
internal func merge(_ options: BugleOptions?, with defaultOptions: BugleOptions?) -> MergedOptions {
    if options == nil {
        guard defaultOptions != nil else {
            fatalError("Error - you must call setup before accessing this method")
        }
    }
    
    guard let title = (options?[.title] as? String) ?? (defaultOptions![.title] as? String) else {
        fatalError("Error - you must provide a common alert title")
    }
    
    guard let actionTitle = (options?[.action] as? String) ?? (defaultOptions![.action] as? String) else {
        fatalError("Error - you must provide a common action title")
    }
    
    guard let cancelMessage = (options?[.cancel] as? String) ?? (defaultOptions![.cancel] as? String) else {
        fatalError("Error - you must provide a cancel action label")
    }
    
    let tintColor = (options?[.tint] as? UIColor) ?? (defaultOptions![.tint] as? UIColor)
    let errorTintColor = (options?[.errorTint] as? UIColor) ?? (defaultOptions![.errorTint] as? UIColor)
    
    return (
        title,
        actionTitle,
        cancelMessage,
        (tint: tintColor, errorTint: errorTintColor)
    )
}
