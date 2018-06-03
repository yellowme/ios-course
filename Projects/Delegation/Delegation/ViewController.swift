//
//  ViewController.swift
//  Delegation
//
//  Created by Luis Burgos on 5/31/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    let loader = SongLoader()
    
    override func viewDidLoad() {
        label.text = "Are you ready?"
        loader.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.center = view.center
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loader.prepareCrowdScream()
    }

}

extension ViewController: SongLoaderResponder {
    /*func willBeginDownload() {
        label.text = "You've been.. "
    }*/
    
    func didFinishDownload() {
        label.text = "Thunderstruck!"
    }
}

