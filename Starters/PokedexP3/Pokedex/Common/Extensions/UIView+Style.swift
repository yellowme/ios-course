//
//  UIView+Style.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/28/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

enum Style {
    // HERE: Define all your Styles
}

extension UIView {
    func setStyle(_ style: Style) {
        /*
         switch style {
         case .BlueTextButton:
         if let button = self as? UIButton {
         button.tintColor = .warmBlue
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
         }
         break
         */
    }
}

//MARK: Style Helper
extension UIViewController {
    func setStyle(_ style: Style, for views: UIView...) {
        views.forEach { view in
            view.setStyle(style)
        }
    }
}
