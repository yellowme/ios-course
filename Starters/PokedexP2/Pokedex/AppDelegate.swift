//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Luis Burgos on 6/30/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit
import Bugle

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Bugle.setup(with: options)
        return true
    }

}

extension AppDelegate {
    fileprivate var options: BugleOptions {
        return [
            .tint: UIColor.bluish,            
        ]
    }
}


