//
//  UIImageView+Ext.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/13/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import SDWebImage

public extension UIImageView {
    public func loadImage(from urlString: String) {
        if let url = URL(string: urlString) {
                self.sd_setImage(with: url)
        }
    }
}
