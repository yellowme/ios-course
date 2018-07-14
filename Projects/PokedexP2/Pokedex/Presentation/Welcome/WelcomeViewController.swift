//
//  WelcomeViewController.swift
//  Pokedex
//
//  Created by Luis Burgos on 6/30/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class WelcomeViewController: BaseViewController {

    //MARK: - Outlets

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var nicknameField: UITextField!
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var enterNicknameLabel: UILabel!

    //MARK: - Variables
    
    var initialLogoCenter: CGPoint!
    
    //MARK: - Controller
    
    var presenter: WelcomeViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = WelcomePresenter(view: self, manager: SessionManager())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeInvisible(enterNicknameLabel, nicknameField, beginButton)
        initialLogoCenter = logo.center
        logo.center = self.view.center
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.start()
    }
    
    //MARK: - Actions

    @IBAction func didTapCatchEmAllButton(_ sender: UIButton) {
        presenter.chooseUsername(nicknameField.text)
    }
    
}

extension WelcomeViewController: WelcomeView {
    func showMainScreen() {
        setMainFlow(to: .pokemons)
    }
    
    func runEnterAnimations() {
        logo.moveAnimatedTo(point: initialLogoCenter) {
            self.nicknameField.fadeIn(alongWith: self.beginButton, self.enterNicknameLabel)
        }
    }
    
    func runExitAnimations() {
        logo.fadeOut(alongWith: beginButton, enterNicknameLabel, nicknameField) {
            self.presenter.enterMainScreen()
        }
    }
}
