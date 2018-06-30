//
//  ViewController.swift
//  Navigation
//
//  Created by Luis Burgos on 6/6/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class DispatchViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    private var mainFlow: Flow = .login
    
    var dataManager: DispatchManagerProtocol? = DispatchManager()
    var sessionManager: SessionManagerProtocol? = SessionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageLabel.text =
            dataManager?.retrieve() ?? "No message"
        
        if let session = sessionManager?.retrieve(), session.loggedIn {
            mainFlow = .pokemons
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setMainFlow(to: self.mainFlow)
        }
    }
    
}

