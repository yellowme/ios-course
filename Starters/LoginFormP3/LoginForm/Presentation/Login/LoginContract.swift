//
//  LoginContract.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/13/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation

protocol LoginView {
    func display(message: String)
    func setProgress(active: Bool)
    func showMainScreen()
}

protocol LoginViewPresenter {
    init(view: LoginView)
    func login(_ name: String?, passsword: String?)
}
