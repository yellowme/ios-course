//
//  LoginPresenter.swift
//  LoginForm
//
//  Created by Luis Burgos on 6/15/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class LoginPresenter {
    let view: LoginView
    let sessionManager: SessionManagerProtocol
    
    required init(view: LoginView, sessionManager: SessionManagerProtocol) {
        self.view = view
        self.sessionManager = sessionManager
    }
    
    fileprivate func validateInformation(
        _ name: String?, password: String?) -> (isValid: Bool, erroMessage: String?) {
        
        guard let name = name , !name.isEmpty else  {
            return (false, "Enter valid username")
        }
        
        guard let password = password, !password.isEmpty else {
            return (false, "Enter valid password")
        }
        
        return (true, nil);
    }
}

extension LoginPresenter: LoginViewPresenter {
    func login(_ name: String?, passsword: String?) {
        let infoProcessed = self.validateInformation(name, password: passsword)
        
        if infoProcessed.isValid {
            view.setProgress(to: true)
            // TODO: Call Web Service
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.sessionManager.save(session:
                    Session(loggedIn: true, userName: name!)
                )
                self.view.setProgress(to: false)
                self.view.runExitAnimations()
            }
        } else {
            view.display(infoProcessed.erroMessage!)
        }
    }
    
    func start() {
        view.runEnterAnimations()
    }
    
    func enterMainScreen() {
        view.showMainScreen()
    }
}
