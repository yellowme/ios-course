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
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        headingLabel.center.x  -= view.bounds.width
        userNameField.center.x -= view.bounds.width
        passwordField.center.x -= view.bounds.width
        loginButton.center.y += loginButton.frame.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.start()
    }
}

extension LoginViewController: LoginView {
    func showMainScreen() {
        setMainFlow(to: .pokemons)
    }
    
    func runEnterAnimations() {
        executeEnterFormAnimations()
    }
    
    func runExitAnimations() {
        executeExitFormAnimations()
    }
}

// MARK: Form Animations
extension LoginViewController {
    private func executeEnterFormAnimations() {
        UIView.animate(withDuration: 0.8, animations: {
            self.headingLabel.center.x += self.view.bounds.width
            self.userNameField.center.x += self.view.bounds.width
            self.passwordField.center.x += self.view.bounds.width
        }) { _ in
            self.executeEnterLoginButton()
        }
    }
    
    private func executeExitFormAnimations() {
        UIView.animate(withDuration: 0.8, animations: {
            self.headingLabel.center.x  -= self.view.bounds.width
            self.userNameField.center.x -= self.view.bounds.width
            self.passwordField.center.x -= self.view.bounds.width
        }) { _ in
            self.executeExitLoginButton()
        }
    }
}

// MARK: Button Animations
extension LoginViewController {
    private func executeEnterLoginButton() {
        UIView.animate(withDuration: 0.4) {
            self.loginButton.center.y -= self.loginButton.frame.height
        }
    }
    
    private func executeExitLoginButton() {
        UIView.animate(withDuration: 0.4, animations: {
            self.loginButton.center.y += self.loginButton.frame.height
        }) { _ in
            self.presenter.enterMainScreen()
        }
    }
}
