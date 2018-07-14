//
//  BugleOptions.swift
//  Bugle
//
//  Created by Luis Burgos on 2/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

/**
 Defines all the custom options for the alert.
 */
public enum BuglePiece {
    /**
     Is the the tint color for "single" or "confirmation" alert types.
     It's param value must be of type UIColor.
     */
    case tint
    
    /**
     Is the the tint color for "risky" alert types.
     It's param value must be of type UIColor.
     */
    case errorTint
    
    /**
     Is the common cancelation message. (e.g., No, Cancel, Forget it!)
     */
    case cancel //REQUIRED
    
    /**
     Is the common cancelation string message.
     */
    case title //REQUIRED
    
    /**
     Is the common confirmation action string message.
     */
    case action //REQUIRED    
}
