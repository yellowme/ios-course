//
//  ViewController.swift
//  Alerts
//
//  Created by Luis Burgos on 6/7/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions

    @IBAction func didTapOneOption(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Yellowme",
            message: "iOS Course: From Zero to Hero",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "👍🏻", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTapTwoOption(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Do you already have CocoaPods installed?",
            message: "We will need it for the next module",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    @IBAction func didTapThreeOption(_ sender: UIButton) {
        self.displayCommonThreeOptions(.alert)
    }
    
    @IBAction func didTapActionSheet(_ sender: UIButton) {
        self.displayCommonThreeOptions(.actionSheet)
    }
    
    @IBAction func didTapShowAndHandle(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Do you already have CocoaPods installed?",
            message: "We will need it for the next module",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.displayLoveDialog()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { _ in
            self.displayShameDialog()
        }))
        
        self.present(alert, animated: true)
    }
    
}

extension ViewController {
    private func displayLoveDialog() {
        let alert = UIAlertController(
            title: "🧙🏻‍♂️",
            message: "We all love you",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "❤️", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func displayShameDialog() {
        let alert = UIAlertController(
            title: "🔔",
            message: "Shame! \nShame!",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "💔", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    private func displayCommonThreeOptions(_ style: UIAlertControllerStyle) {
        let alert = UIAlertController(
            title: "Complete the phrase!",
            message: "May the Force",
            preferredStyle: style
        )
        
        alert.addAction(
            UIAlertAction(title: "Be with you!", style: UIAlertActionStyle.default, handler: nil)
        )
        alert.addAction(
            UIAlertAction(title: "Be with me!", style: UIAlertActionStyle.default, handler: nil)
        )
        alert.addAction(
            UIAlertAction(title: "Be with us!", style: UIAlertActionStyle.default, handler: nil)
        )
        
        self.present(alert, animated: true, completion: nil)
    }
}

