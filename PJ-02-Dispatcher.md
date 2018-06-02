# Project: Dispatcher

Code related: [Projects/Dispatcher](/Projects/Dispatcher)

## What you learn

* Application Lifecycle
* View Controller Lifecycle
* First Storyboard
* First Outlets
* First Segue

## Interact with the App Delegate

### 1. After creating a new Xcode project, go to the file `AppDelegate.swift`

Override:

* applicationWillResignActive
* applicationDidEnterBackground
* applicationWillEnterForeground
* applicationDidBecomeActive
* applicationDidBecomeActive
* applicationWillTerminate

```swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("AppDelegate -didFinishLaunchingWithOptions")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        print("AppDelegate -applicationWillResignActive")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print("AppDelegate -applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        print("AppDelegate -applicationWillEnterForeground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("AppDelegate -applicationDidBecomeActive")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("AppDelegate -applicationWillTerminate")
    }

}
```

### 2. Examine the console

You should see something like this:

![Console](/Assets/PJ-02-00.png)

## Setup your first controller

### 1. Change the name of the created from `ViewController` to `DispatcherViewController`.

*Pro-tip: Use the new refactor feature inside the Xcode.*

![After refactor](/Assets/PJ-02-01.png)

### 2. Open the `Main.storyboard`

![Main storyboard](/Assets/PJ-02-02.png)

### 3. Add an UILabel with a welcome message

![Adding label](/Assets/PJ-02-03.png)

### 4. Run the App, see the results

## Lifecycle by example

### 1. Open the `DispatcherViewController` file and add the next:

```swift
import UIKit

class DispatcherViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("DispatcherViewController - loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("DispatcherViewController - viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DispatcherViewController - viewWillAppear")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("DispatcherViewController - viewWillLayoutSubviews")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("DispatcherViewController - viewDidAppear")
    }

    // MARK: - Methods to test when adding Navigation

    override func viewWillDisappear(_ animated: Bool) {
        print("DispatcherViewController - viewWillDisappear")
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("DispatcherViewController - viewDidDisappear")
        super.viewDidDisappear(animated)
    }
}
```

### 2. Run the App!

You should see print statements at the Xcode console.

Wait do we missing something out? Why the console is not printing the results from calling `viewWillDisappear` and `viewDidDisappear` methods?

## First Segue

### 1. Add one `UIButton`

### 2. Add a new `UIViewController`

![Add button](/Assets/PJ-02-04.png)

### 3. Add a **segue** from the `UIButton` to the new `UIViewController`

![Finish interaction](/Assets/PJ-02-05.png)

### 5. Run the App! Now we have navigation!

## The Second View Controller

### 1. Create a Second View Controller class

```swift
import UIKit

class SecondScreenViewController: UIViewController {

    override func loadView() {
        super.loadView()
        print("SecondScreenViewController - loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondScreenViewController - viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SecondScreenViewController - viewWillAppear")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("SecondScreenViewController - viewWillLayoutSubviews")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SecondScreenViewController - viewDidAppear")
    }

    // MARK: - Methods to test when adding Navigation

    override func viewWillDisappear(_ animated: Bool) {
        print("SecondScreenViewController - viewWillDisappear")
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        print("SecondScreenViewController - viewDidDisappear")
        super.viewDidDisappear(animated)
    }
}
```

### 4. Run the App! Nothing happens?

### 5. Bind the new *swift* class with the second `UIViewController` inside the `Main.storyboard`

![Finish interaction](/Assets/PJ-02-06.png)

### 6. Run the App! It's done!

