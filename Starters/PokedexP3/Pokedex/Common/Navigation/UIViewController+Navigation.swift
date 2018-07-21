//
//  UIViewController+Ext.swift
//  TableView
//
//  Created by Luis Burgos on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

enum Flow {
    case pokemons
    case welcome
    
    func getTransition() -> (controller: String, storyboard: String, isEmbededInNavigation: Bool) {
        switch self {
            case .pokemons:
                return ("PokemonsViewController", "Pokemons", true)
            case .welcome:
                return ("WelcomeViewController", "Welcome", false)
        }
    }
}

extension UIViewController {
    func setMainFlow(to flow: Flow) {
        let transition = flow.getTransition()
        let controller = getController(
            transition.controller,
            fromStoryboard: transition.storyboard,
            embedInNavigation: transition.isEmbededInNavigation
        )
        set(root: controller)
    }
}

extension UIViewController {
    func getController(_ named: String, fromStoryboard: String, embedInNavigation: Bool = false) -> UIViewController {
        let storyboard = UIStoryboard(name: fromStoryboard, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: named)
        
        if embedInNavigation {
            return UINavigationController(rootViewController: controller)
        }
        
        return controller
    }
    
    func set(root viewController: UIViewController?, animatesTransition: Bool = true){
        guard viewController != nil else {
            return
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if appDelegate.window == nil {
            print("Window on delegate is nil, creating new main screen with bounds")
            appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        appDelegate.window?.rootViewController = viewController
        
        UIView.transition(with: appDelegate.window!, duration: animatesTransition ? 0.5 : 0.0, options: .transitionCrossDissolve, animations: {
            appDelegate.window?.makeKeyAndVisible()
        }, completion: nil)
    }
}

