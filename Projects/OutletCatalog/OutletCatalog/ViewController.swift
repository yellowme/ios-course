//
//  ViewController.swift
//  OutletCatalog
//
//  Created by Luis Burgos on 5/17/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var displayOptionsSegmented: UISegmentedControl!  {
        didSet {
            displayOptionsSegmented.addTarget(
                self,
                action: #selector(onSegmentedValueChanged),
                for: .valueChanged
            )
        }
    }
    @IBOutlet weak var backgroundInfoTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var levelSlider: UISlider!
    @IBOutlet weak var receiveNotificationsSwitch: UISwitch! {
        didSet {
            receiveNotificationsSwitch.addTarget(
                self,
                action: #selector(onSwitchValueChanged),
                for: .valueChanged
            )
        }
    }
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressBarIndicator: UIProgressView!
    @IBOutlet weak var formStepper: UIStepper!
    
    // MARK: - Outlets with targets
    
    @IBOutlet weak var progressActionButton: UIButton!
    @IBOutlet weak var switchActionButton: UIButton!
    @IBOutlet weak var fieldActionButton: UIButton!
    
    // MARK: - Controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Burgos"
        loginButton.setTitle("Change my name!", for: .normal)
        progressBarIndicator.progress = 0
        backgroundInfoTextField.delegate = self
        secondTextField.delegate = self
        initButtonTargets()
    }
    
    // MARK: - Actions
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        nameLabel.text = "Luis Burgos"
        
        // Uncomment for demonstrate close keyboard after clicking
        // backgroundInfoTextField.resignFirstResponder()
        // secondTextField.resignFirstResponder()
    }
    
    @objc func didTapProgressAction(_ sender: UIButton) {
        progressIndicator.isAnimating ? progressIndicator.stopAnimating() : progressIndicator.startAnimating()
        progressBarIndicator.progress += 0.10
    }
    
    @objc func didTapSwitchAction(_ sender: UIButton) {
        print("User is receiving notifications?: \(receiveNotificationsSwitch.isOn)")
        receiveNotificationsSwitch.setOn(
            !receiveNotificationsSwitch.isOn,
            animated: true
        )
    }
    
    @objc func didTapFieldAction(_ sender: UIButton) {
        print("Value inside field: \(backgroundInfoTextField.text ?? "No value")")
    }
}

// MARK: - Text Field Delegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // Change to "true" to allow textField clear text
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing with: \(textField.text ?? "No value")")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing with\(textField.text ?? "No value")")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.view.endEditing(true)
        return false
    }
}

// MARK: - Listeners
extension ViewController {
    @objc func onSwitchValueChanged(_ sender: UISwitch) {
        print("onSwitchValueChanged triggers -> new value is \(sender.isOn)")
    }
    
    @objc func onSegmentedValueChanged(_ sender: UISegmentedControl) {
        print("onSegmentedValueChanged triggers -> new value is \(sender.selectedSegmentIndex)")
    }
}

// MARK: - UI Setup
extension ViewController {
    private func initButtonTargets() {
        progressActionButton.addTarget(self, action: #selector(didTapProgressAction), for: .touchUpInside)
        
        switchActionButton.addTarget(self, action: #selector(didTapSwitchAction), for: .touchUpInside)
        
        fieldActionButton.addTarget(self, action: #selector(didTapFieldAction), for: .touchUpInside)
    }
}
