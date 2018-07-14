//
//  WelcomeContract.swift
//  Pokedex
//
//  Created by Luis Burgos on 6/30/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol WelcomeView: BaseView {
    func runEnterAnimations()
    func runExitAnimations()
    func showMainScreen()
}

protocol WelcomeViewPresenter {
    init(view: WelcomeView, manager: SessionManagerProtocol)
    func start()
    func chooseUsername(_ username: String?)
    func enterMainScreen()
}
