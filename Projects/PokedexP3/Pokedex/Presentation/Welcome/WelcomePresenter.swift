//
//  WelcomePresenter.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/10/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class WelcomePresenter {
    let view: WelcomeView
    let manager: SessionManagerProtocol
    
    required init(view: WelcomeView, manager: SessionManagerProtocol) {
        self.view = view
        self.manager = manager
    }
}

extension WelcomePresenter: WelcomeViewPresenter {    
    func start() {
        let currentSession = manager.retrieve()
        if currentSession.loggedIn {
            view.runExitAnimations()
        } else {
            view.runEnterAnimations()
        }
    }
    
    func chooseUsername(_ username: String?) {
        self.view.setProgress(to: true, with: 0.6, overlay: .transparent)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            self.view.setProgress(to: false)
            let infoProcessed = self.validateInformation(username)
            if infoProcessed.isValid {
                // Simulate network request for app context.
                let newSession = Session(loggedIn: true, userName: username!)
                self.manager.save(session: newSession)
                self.view.runExitAnimations()
            } else {
                self.view.display(infoProcessed.error!)
            }
        }
    }
    
    func enterMainScreen() {
        view.showMainScreen()
    }
}

extension WelcomePresenter {
    private func validateInformation(_ username: String?) -> (isValid: Bool, error: String?) {
        guard let username = username , username.isNotEmpty() else  {
            return (false, String.enterValidUsername)
        }
        
        return (true, nil);
    }
}
