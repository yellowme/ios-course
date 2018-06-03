//
//  DispatcherViewController.swift
//  Dispatcher
//
//  Created by Luis Burgos on 5/17/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class DispatcherViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("DispatcherViewController - loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DispatcherViewController - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DispatcherViewController - viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("DispatcherViewController - viewWillLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("DispatcherViewController - viewDidAppear")
    }
    
    // MARK: - Methods to test when adding Navigation
    
    override func viewWillDisappear(_ animated: Bool) {
        print("DispatcherViewController - viewWillDisappear")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("DispatcherViewController - viewDidDisappear")
        super.viewDidDisappear(animated)
    }
}

