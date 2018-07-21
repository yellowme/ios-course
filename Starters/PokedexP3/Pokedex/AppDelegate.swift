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
        setupNavigationBar()
        return true
    }

}

//MARK: - Navigation Bar
extension AppDelegate {
    private func setupNavigationBar() {
        UINavigationBar.appearance().backgroundColor = UIColor.vermillion
        UINavigationBar.appearance().barTintColor = UIColor.vermillion
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white
        ]
        UINavigationBar.appearance().barStyle = .blackOpaque
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        if let statusbar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusbar.backgroundColor = UIColor.vermillion
        }
    }
}

//MARK: - Bugle
extension AppDelegate {
    fileprivate var options: BugleOptions {
        return [
            .tint: UIColor.bluish,            
        ]
    }
}


