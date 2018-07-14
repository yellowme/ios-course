//
//  Bugle+Ext.swift
//  Bugle
//
//  Created by Luis Burgos on 2/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit.UIAlertController
import UIKit.UIColor
import UIKit.UIViewController

extension Bugle {
    /**
     Avoids repeating your self when creating "alert" type controllers
     */
    internal func prepare(with title: String, _ message: String) -> UIAlertController{
        return UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    }
    
    /**
     Takes an UIAlertController and applys a given tint color.
     */
    internal func presentDecorated(_ alert: UIAlertController, on: UIViewController, tintColor: UIColor) {
        alert.view.tintColor = tintColor
        on.present(alert, animated: true, completion: {
            alert.view.tintColor = tintColor
        })
    }
}
