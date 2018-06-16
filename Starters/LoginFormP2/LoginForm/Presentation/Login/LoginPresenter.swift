//
//  LoginPresenter.swift
//  LoginForm
//
//  Created by Luis Burgos on 6/15/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class LoginPresenter: LoginViewPresenter {
    
    let view: LoginView
    
    required init(view: LoginView) {
        self.view = view
    }
    
    func login(_ name: String?, passsword: String?) {
        let infoProcessed = self.validateInformation(name, password: passsword)
        
        if infoProcessed.isValid {
            view.setProgress(to: true)
            // TODO: Call Web Service
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.view.setProgress(to: false)
                self.view.showMainScreen()
            }
        } else {
            view.display(infoProcessed.erroMessage!)
        }
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
