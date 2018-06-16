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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setMainFlow(to: self.mainFlow)
        }
    }
    
}

