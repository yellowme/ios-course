# Project: LoginForm

Code related: [Projects/LoginForm](/Projects/LoginForm)

## What you learn

* Forms
* Good Practices for iOS Development
* MVP Architecture
* Advanced Protocols
* Animations

## Initial Setup

The project setup is similar to the [Navigation Project Setup](/PJ-04-Navigation.md#initial-setup)

At this point your project structure should look like this:

![Project structure](/Assets/PJ-08-01.png)

Now we need to practice more with all the learning until now.

1. Add a Login Storyboard inside the folder `Presentation/Login`

2. Add a *UIViewController* definition inside `LoginViewController.swift`. Do not forget the *storyboard id*.

3. Add a View Controller inside the `Login.storyboard` and bind it to the *swift* controller class.

4. Create a login form screen using the *outlet library*. You will need to use: **2 UITextFields, 1 UIButton, 1 UILabel.**

5. Bind the *IBOutlets* with the proper `LoginViewController.swift`

6. Bind the *IBActions* for the login button. Leave the method body empty for now.

7. Verifiy the class `UIViewController+Navigation.swift` in order to guarantee the *login flow* case matchs the name of the recently created files.

8. Modify the `DispatchViewController.swift` to display the login for as first screen of the app.

Finally you should have something like the following screen:

![Login Screen](/Assets/PJ-08-02.png)

## MVP

Now we need to adopt the MVP pattern for our login feature:

### Define a *contract* for the feature

You could use a similar approach like the one from the [YellowPod](https://github.com/yellowme/base-ios/tree/feature/base-features-structure/YellowPod/YellowPod/Presentation#login)

```swift
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
```

### Adopt the *view* protocol inside the `LoginViewController.swift`

```swift
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    var presenter: LoginViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
    }

    @IBAction func didTapLogin(_ sender: UIButton) {
        presenter.login(
            userNameField.text,
            passsword: passwordField.text
        )
    }
}

extension LoginViewController: LoginView {
    func display(message: String) {
        // TODO: Use "Bugle" lib
        debugPrint(message)
    }

    func setProgress(active: Bool) {
        // TODO: Use activty indicator from UIViewController
        debugPrint("Set active to:  \(active)")
    }

    func showMainScreen() {
        // TODO: Call flow navigation methods
        debugPrint("Show main view")
    }
}
```

### Create a `LoginPresenter.swift` file and class

### Adopt the *view presenter* protocol inside the `LoginPresenter.swift`

```swift
import Foundation

class LoginPresenter: LoginViewPresenter {

    let view: LoginView

    required init(view: LoginView) {
        self.view = view
    }

    func login(_ name: String?, passsword: String?) {
        let infoProcessed = self.validateInformation(name, password: passsword)

        if infoProcessed.isValid {
            view.setProgress(active: true)
            // TODO: Call Web Service
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.view.setProgress(active: false)
                self.view.showMainScreen()
            }
        } else {
            view.display(message: infoProcessed.erroMessage!)
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
```

### YellowPod to the rescue

In the future you could refer the [MVP Guide](https://github.com/yellowme/base-ios/tree/feature/base-features-structure/YellowPod/YellowPod/Common/ViewPresenter) when working with this architecture.

## Advanced Protocols

After open the [Starter - Part 2](/Starters/LoginFormP2) project for this module. Follow the steps below.

### Add group

Create a new folder inside the `Common` folder called `ViewPresenter`. Move the class `BaseViewControllerIndicator.swift` inside this new folder.

### Base view common protocol

Consider the following protocol:

```swift
import UIKit

protocol BaseView: class {
    func setProgress(to isLoading: Bool, with alpha: CGFloat?, overlay: UIColor?)
    func display(_ message: String?)
}
```

Create a file and add this protocol to this project.

### Add base controller

Create a new file called `BaseViewController.swift` inside the folder `ViewPresenter`

```swift
class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```

### Add default implementation

Add the next extension to your `BaseViewController.swift` file:

```swift
extension BaseView {
    func setProgress(to isLoading: Bool, with alpha: CGFloat? = nil, overlay: UIColor? = nil) {
        setProgress(to: isLoading, with: alpha, overlay: overlay)
    }
}
```

**Important:** This is a trick to allow the caller omit the alpha and the overlay paramters.

### Add decorator protocol

Add the next protocol to your `BaseViewController.swift` file:

```swift
protocol IndicatorDecorator {
    var indicatorColor: UIColor { get set }
}
```

### Add conditional conformance

Add the next conditional conformance extension to your `BaseViewController.swift` file:

```swift
extension BaseView where Self: UIViewController {
    func setProgress(to isLoading: Bool, with alpha: CGFloat?, overlay: UIColor?) {
        if isLoading {
            let color = (self as? IndicatorDecorator)?.indicatorColor ?? .blue
            self.showIndicator(
                on: view,
                options: BaseViewIndicatorOptions(
                    indicatorColor: color,
                    alpha: alpha ?? 0.6,
                    overlayColor: overlay ?? .white
                )
            )
        } else {
            self.hideActivityIndicator(on: view)
        }
    }

    func display(_ message: String?) {
        guard let message = message else { return }
        debugPrint(message)
        //TODO: Display alert view controller or use "Bugle" library.
    }
}
```

### Use the base controller

You only need to extend from the base class:

```swift
import UIKit

class LoginViewController: BaseViewController {
  ...
}
```

Until this step this should be the full `LoginViewController` code:

```swift
import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    var presenter: LoginViewPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
    }

    @IBAction func didTapLogin(_ sender: UIButton) {
        presenter.login(
            userNameField.text,
            passsword: passwordField.text
        )
    }
}

extension LoginViewController: LoginView {
    func showMainScreen() {
        // TODO: Call flow navigation methods
        debugPrint("Show main view")
    }
}
```

### Update the loginc contract

You need to extend the *LoginView* from the  *BaseView*:

```swift
protocol LoginView: BaseView {
    func showMainScreen()
}
```

### BONUS: Decorate the indicator

If you want a custom behavior for the loading indicator, you could do something like this:

```swift
import UIKit

class MyCustomBaseController: BaseViewController, IndicatorDecorator {
    var indicatorColor: UIColor = .red
}
```

## Animations

After open the [Starter - Part 3](/Starters/LoginFormP3) project for this module. Follow the steps below.

### Bind outlets

Bind the heading UILabel and the "go" UIButton as Outlets inside the class `LoginViewController.swift`

### Modify the contract

We need to make the view and the presenter aware of new events for running animations:

```swift
import Foundation

protocol LoginView: BaseView {
    func showMainScreen()
    func runEnterAnimations()
    func runExitAnimations()
}

protocol LoginViewPresenter {
    init(view: LoginView)
    func start()
    func login(_ name: String?, passsword: String?)
    func enterMainScreen()
}
```

### Modify the presenter

Implemente the new contract methods inside your `LoginPresenter`:

```swift
extension LoginPresenter: LoginViewPresenter {
    func login(_ name: String?, passsword: String?) {
        let infoProcessed = self.validateInformation(name, password: passsword)

        if infoProcessed.isValid {
            view.setProgress(to: true)
            // TODO: Call Web Service
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
```

### Modify the view

Also implement the new contract methods inside your `LoginViewController`:

```swift
extension LoginViewController: LoginView {
    func showMainScreen() {
        // setMainFlow(to: .pokemons)
    }

    func runEnterAnimations() {
        // executeEnterFormAnimations()
    }

    func runExitAnimations() {
        // executeExitFormAnimations()
    }
}
```

### Initial State

Remember that we use `viewWillAppear` to modify outlets before displaying the UI to the user. In this case we need to modify the position of the outlet.

Also, we use `viewDidAppear` to run enter animations inside our view controller.

```swift
    ...

    override func viewWillAppear(_ animated: Bool) {
        headingLabel.center.x  -= view.bounds.width
        userNameField.center.x -= view.bounds.width
        passwordField.center.x -= view.bounds.width
        loginButton.center.y += loginButton.frame.height
    }

    override func viewDidAppear(_ animated: Bool) {
        presenter.start()
    }

    ...
```

### Add animations

First we need to add methods to handle form elements transition:

```swift
// MARK: Form Animations
extension LoginViewController {
    private func executeEnterFormAnimations() {
        UIView.animate(withDuration: 0.8, animations: {
            self.headingLabel.center.x += self.view.bounds.width
            self.userNameField.center.x += self.view.bounds.width
            self.passwordField.center.x += self.view.bounds.width
        }) { _ in
            self.executeEnterLoginButton()
        }
    }

    private func executeExitFormAnimations() {
        UIView.animate(withDuration: 0.8, animations: {
            self.headingLabel.center.x  -= self.view.bounds.width
            self.userNameField.center.x -= self.view.bounds.width
            self.passwordField.center.x -= self.view.bounds.width
        }) { _ in
            self.executeExitLoginButton()
        }
    }
}
```

Now we add methods for handling button transitions

```swift
// MARK: Button Animations
extension LoginViewController {
    private func executeEnterLoginButton() {
        UIView.animate(withDuration: 0.4) {
            self.loginButton.center.y -= self.loginButton.frame.height
        }
    }

    private func executeExitLoginButton() {
        UIView.animate(withDuration: 0.4, animations: {
            self.loginButton.center.y += self.loginButton.frame.height
        }) { _ in
            self.presenter.enterMainScreen()
        }
    }
}
```

### BONUS: Extend animations

Another way to animate visual elements is to use the class `CGAffineTransform` which allow us to easily scale, rotate and translate views.

Inside the *// MARK: Button Animations* create a new method:

```swift
    ...

    private func continueEnterAnimations() {
        let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
        let translate = CGAffineTransform(translationX: 0, y: -10)

        UIView.animate(withDuration: 0.6) {
            let transform = scale.concatenating(translate)
            self.headingLabel.transform = transform
        }
    }

    ...
```

Finally modify your `executeEnterLoginButton` method:

```swift
    ...

    private func executeEnterLoginButton() {
        UIView.animate(withDuration: 0.4, animations: {
            self.loginButton.center.y -= self.loginButton.frame.height
        }) { _ in
            self.continueEnterAnimations()
        }
    }

    ...
```