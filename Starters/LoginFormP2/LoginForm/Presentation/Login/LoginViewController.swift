//
//  LoginViewController.swift
//  LoginForm
//
//  Created by Luis Burgos on 6/15/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, IndicatorDecorator {
    var indicatorColor: UIColor = .red
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var presenter: LoginViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
    }
    
    @IBAction func didTapLogin(_ sender: UIButton) {
        presenter.login(
            userNameField.text,
            passsword: passwordField.text
        )
    }
}

extension LoginViewController: LoginView {
    func showMainScreen() {
        // TODO: Call flow navigation methods
        debugPrint("Show main view")
    }
}
