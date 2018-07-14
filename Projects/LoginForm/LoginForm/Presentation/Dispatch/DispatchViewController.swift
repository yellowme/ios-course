//
//  ViewController.swift
//  Navigation
//
//  Created by Luis Burgos on 6/6/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class DispatchViewController: UIViewController {

    private let mainFlow: Flow = .login
    var dataManager: DispatchManagerProtocol! = DispatchManager()
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text = dataManager.retrieve()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setMainFlow(to: self.mainFlow)
        }
    }
    
}

