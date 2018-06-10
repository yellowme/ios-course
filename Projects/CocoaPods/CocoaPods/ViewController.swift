//
//  ViewController.swift
//  CocoaPods
//
//  Created by Luis Burgos on 6/7/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit
import Bugle

class ViewController: UIViewController {

    var isFirstPlay = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapMainAction(_ sender: UIButton) {
        Bugle.shared.play("Hello World", on: self)
    }
}

extension ViewController: BugleDelegate {
    func didConfirm() {
        debugPrint("Confirm bugle")
        isFirstPlay = !isFirstPlay
        if !isFirstPlay {
            let options: BugleOptions = [
                .cancel: "No, forget it",
                .title: "Are you sure?",
                .action:  "Yes, I'm a savage",
                ]
            Bugle.shared.play("Push to master", options, on: self, ofType: .risky)
        }
    }
    
    // This method is optional
    func didCancel() {
        //TODO: Do something
    }
}

