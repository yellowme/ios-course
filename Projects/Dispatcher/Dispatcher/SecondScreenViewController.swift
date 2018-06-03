//
//  SecondScreenViewController.swift
//  Dispatcher
//
//  Created by Luis Burgos on 5/17/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {
    
    override func loadView() {
        super.loadView()
        print("SecondScreenViewController - loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondScreenViewController - viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondScreenViewController - viewWillAppear")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("SecondScreenViewController - viewWillLayoutSubviews")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondScreenViewController - viewDidAppear")
    }
    
    // MARK: - Methods to test when adding Navigation
    
    override func viewWillDisappear(_ animated: Bool) {
        print("SecondScreenViewController - viewWillDisappear")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("SecondScreenViewController - viewDidDisappear")
        super.viewDidDisappear(animated)
    }
}

