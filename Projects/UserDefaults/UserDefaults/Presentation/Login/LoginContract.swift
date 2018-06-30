//
//  LoginContract.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/13/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation

protocol LoginView: BaseView {
    func showMainScreen()
    func runEnterAnimations()
    func runExitAnimations()
}

protocol LoginViewPresenter {
    init(view: LoginView, sessionManager: SessionManagerProtocol)
    func start()
    func login(_ name: String?, passsword: String?)
    func enterMainScreen()
}
