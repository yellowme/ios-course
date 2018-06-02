# Project: Outlet Catalog

Code related: [Projects/OutletCatalog](/Projects/OutletCatalog)

## What you learn

* Limited set of outlets to create beautiful user interfaces
* Storyboards and view controllers
* How to interact with common outlets

## Identify Available Outlets

### 1. Object library

Xcode gives us an object library with view elements in order to build our user interfaces.

![Palette](/Assets/PJ-03-00.png)

### 2. Add elements to the view controller

You need to add:

* Label
* Button
* Segmented Control
* Text Field
* Slider
* Switch
* Activity Indicator View
* Progress View

![View Controller](/Assets/PJ-03-01.png)

### 3. Run the App, see the results

## Control Outlets from View Controllers

### 1. Activate the Assistent Editor for both views (storyboard and controllers)

![Assistant Editor](/Assets/PJ-03-02.png)

### 2. Prepare the View Controller

```swift
import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    // HERE: Add all outlets binding

    // MARK: - Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}
```

### 3. Bind the outlets from the Storyboard onto the View Controller class. Use `CTRL + Drag and Drop`

```swift
import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var displayOptionsSegmented: UISegmentedControl!
    @IBOutlet weak var backgroundInfoTextField: UITextField!
    @IBOutlet weak var levelSlider: UISlider!
    @IBOutlet weak var receiveNotificationsSwitch: UISwitch!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressBarIndicator: UIProgressView!
    @IBOutlet weak var formStepper: UIStepper!

    // HERE: Add all outlets binding

    // MARK: - Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}
```

### 4. Run the App, see the results

## Control Actions from View Controllers

### 1. Bind the action using `CTRL + Drag and Drop`

### 2. Your code should look like this:

```swift
import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var displayOptionsSegmented: UISegmentedControl!
    @IBOutlet weak var backgroundInfoTextField: UITextField!
    @IBOutlet weak var levelSlider: UISlider!
    @IBOutlet weak var receiveNotificationsSwitch: UISwitch!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressBarIndicator: UIProgressView!
    @IBOutlet weak var formStepper: UIStepper!

    // HERE: Add all outlets binding

    // MARK: - Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapLoginButton(_ sender: UIButton) {
        print("Login button clicked")
    }

}
```

### 3. Run the App, see the results

## Play Around!

*See more inside the [project](./OutletCatalog/)*

Your storyboard should look similar after this module:

![Palette](/Assets/PJ-03-03.png)

Your code should look similar after this module:

```swift
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
```