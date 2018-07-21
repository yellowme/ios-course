//
//  UIViewController+Positions.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/10/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

extension UIViewController {
    func addPokedexLogo() {
        let image = UIImage(named: String.pokedexIcon)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView
    }
    
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
