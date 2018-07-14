//
//  UIViewController+Positions.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/10/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

extension UIViewController {
    func sendOutTheScreenToLeft(_ views: UIView...) {
        views.forEach { view in
            view.center.x  -= self.view.bounds.width
        }
    }
    
    func makeInvisible(_ views: UIView...) {
        views.forEach { view in
            view.alpha = 0
        }
    }
}
