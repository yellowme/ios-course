//
//  ViewController.swift
//  Navigation
//
//  Created by Luis Burgos on 6/6/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class DispatchViewController: UIViewController {

    @IBOutlet weak var dispatchLabel: UILabel!
    private let mainFlow: Flow = .tabbedView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatchLabel.text = "Loading flow: \(mainFlow)"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setMainFlow(to: self.mainFlow)
        }
    }
    
}

