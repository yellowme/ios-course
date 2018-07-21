//
//  UIView+Animations.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/10/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

extension UIView {
    func moveAnimatedTo(point: CGPoint, didFinish: (() -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.4,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.center = point
            },
            completion: { complete in
                didFinish?()
            }
        )
    }
    
    func fadeIn(alongWith views: UIView..., didFinish: (() -> Void)? = nil) {
        fade(views, toAlpha: 1, didFinish)
    }
    
    func fadeOut(alongWith views: UIView..., didFinish: (() -> Void)? = nil) {
        fade(views, toAlpha: 0, didFinish)
    }
    
    private func fade(_ views: [UIView], toAlpha: CGFloat, _ didFinish: (() -> Void)? = nil) {
        UIView.animate(
            withDuration: 0.4,
            animations: {
                self.alpha = toAlpha
                for anotherView in views {
                    anotherView.alpha = toAlpha
                }
            },
            completion: { complete in
                didFinish?()
            }
        )
    }
}
