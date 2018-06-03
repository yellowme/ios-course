//
//  UIViewController+Ext.swift
//  TableView
//
//  Created by Luis Burgos on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

extension UIViewController {
    func getController(named: String, from storyboard: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: named)
    }
}

