//
//  ViewController+Ext.swift
//  MoviesList
//
//  Created by Luis Burgos on 7/28/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

extension ViewController {
    internal func displayAdditionAlert(mainHandler: ((String) -> Swift.Void)?) {
        let alert = UIAlertController(
            title: "New movie",
            message: "Add a new movie",
            preferredStyle: .alert)
        
        let saveAction = UIAlertAction(
            title: "Save",
            style: .default
        ) { _ in
                
                guard
                    let textField = alert.textFields?.first,
                    let nameToSave = textField.text
                    else {
                        return
                }
                
                mainHandler?(nameToSave)
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .default
        )
        
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

