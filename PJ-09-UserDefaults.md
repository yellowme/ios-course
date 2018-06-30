# User Defaults

Code related: [Projects/UserDefaults](/Projects/UserDefaults)

## What you learn

* How to save data using UserDefaults
* How to retrieve data from UserDefaults
* Generic approach for user defaults

## Initial setup

You must use the [UserDefaults Starter](/Starters/UserDefaults) for this module. Inside the starter project you should have the project structure used on the [LoginForm project](/Projects/LoginForm)

## Easy way to save and retrieve data

### 1. Bind label outlet

### 2. Store a message

In order to save a *string*, just add the next line:

```swift
UserDefaults.standard.set("Are you ready?", forKey: "LoadingMessage")
```

**Note:** You need to be aware that you have access to multiple methods for store data:

* `integer(forKey:)` returns an integer if the key existed, or 0 if not.
* `bool(forKey:)` returns a boolean if the key existed, or false if not.
* `float(forKey:)` returns a float if the key existed, or 0.0 if not.
* `double(forKey:)` returns a double if the key existed, or 0.0 if not.

### 3. Retrieve a message

After saving a custom welcome message, we need to retrieve it from user defaults:

```swift
let loadingMessage = UserDefaults.standard.string(forKey: "LoadingMessage")
```

### 3. Use the stored message value

Now we can use the stored value to display the the message on our message label.

```swift
messageLabel.text = loadingMessage
```

At the end your code should look like this:

```swift
import UIKit

class DispatchViewController: UIViewController {

    private let mainFlow: Flow = .login

    @IBOutlet weak var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaults.standard.set("Are you ready?", forKey: "LoadingMessage")
        let loadingMessage = UserDefaults.standard.string(forKey: "LoadingMessage")

        messageLabel.text = loadingMessage

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setMainFlow(to: self.mainFlow)
        }
    }

}
```

## Local folder setup

At this point we are ready to create an structured way for using user defaults. First we need to add the `Local` folder to our project:

1. Add a new `Local` folder inside the `Data` folder using **Finder**
2. Add *new files* to our *UserDefaults* project inside the **Xcode**

## Structured way to save and retrieve data

Inside our folder `Data/Local` we need to create an **enum** to keep track of all our keys, named `LocalKeys.swift`, use the following structure:

```swift
enum LocalKeys: String {
    case loadingMessage = "loading-message"
}
```

**Note:** In the future you may end up using a structure like this:

```swift
enum LocalKeys: String {
    enum User: String {
        case current = "user-current"
    }

    enum Token: String {
        case authToken = "token-auth"
    }

    //HERE: Add your custom keys
}
```

Now, also inside our folder `Data/Local` the next file to create is a **protocol** to define our local data manager behavior. The file name should be `DispatchManagerProtocol.swift`.

```swift
protocol DispatchManagerProtocol {
    func save(message: String?)
    func retrieve() -> String?
    func clear()
}
```

We need to create a concrete data manager that uses our protocol. Inside our folder `Data/Local` create a new swift file called `DispatchManager.swift` which implements `DispatchManagerProtocol`.

```swift
class DispatchManager: DispatchManagerProtocol {
    func save(message: String?) {

    }

    func retrieve() -> String? {
        return nil
    }

    func clear() {

    }
}
```

Move the code inside the `DispatchViewController` inside the methods of our new `DispatchManager`. Finally we need update our `DispatchViewController` in order to use the structured implementation.

Your `DispatchViewController` code should look like this:

```swift
import UIKit

class DispatchViewController: UIViewController {

    private let mainFlow: Flow = .login
    var dataManager: DispatchManagerProtocol! = DispatchManager()

    @IBOutlet weak var messageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        messageLabel.text = dataManager.retrieve()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.setMainFlow(to: self.mainFlow)
        }
    }

}
```

## Refactor structure

In the future the amount of local managers we are going to use migth increase, so before continue we need to crate some folders.

1. Click the `Data/Local` group inside **Xcode** to display the options menu, select "New group"
2. Rename the created folder to `Protocols`
3. Move the `DispatchManagerProtocol` file inside the `Protocols` group
4. Click the `Data/Local` group inside **Xcode** to display the options menu, select "New group"
5. Rename the created folder to `Managers`
6. Move the `DispatchManager` file inside the `Managers` folder

## Challenge

Use `UserDefaults` to store:

* Session flag after user logs in
* Username entered by the user

Use the values stored to:

* Decide the main application flow (User should be redirected to pokemons list if has logged in)
* Display the user name as *title* for the pokemons screen. Use the template: `Pokédex - <Username>`

## Bonus

Use the [YellowPod - Local](https://github.com/yellowme/base-ios/tree/master/YellowPod/YellowPod/Data/Local) definition to combine the library [DefaultsKit](https://github.com/nmdias/DefaultsKit) with our structured way to save values.