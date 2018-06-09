# Project: Navigation

Code related: [Projects/Navigation](/Projects/Navigation)

## What you learn

* Navigation types:
  * Static Table View Controllers
  * UINavigationController
  * Nested Doll
  * Hub & Spoke
  * Tabbed View

## Initial Setup

You will need to:

* Create **5** main folders:
  * Dispatch, TabbedView, HubSpoke, NestedDoll, Common.
* Rename `Main.storyboard` and the `ViewController.swift` to `Dispatch.storyboard` and `DispatchViewController.swift`.
* Move the `Dispatch.storyboard` and `DispatchViewController.swift` files to the Dispatch folder.
* Create 3 storyboards:
  * `TabbedView.storyboard`, `HubSpoke.storyboard`, `NestedDoll.storyboard`.
  * On each *storyboard* add a UIViewController with one centered label.
  * Place the *storyboard* under its proper folder.
* Review the file `UIViewController+Navigation.swift` looking for the `Flow` enum. This enum contains the controller identifiers you should add to each controller inside its container storyboard.

At this point your project structure should look like this:

![Project structure](/Assets/PJ-04-01.png)

### Use the Starter project

You could use the [Starter](/Starters/NavigationP1) for this module. This project contains all the files to continue.

## Nested Doll

After open the [Starter](/Starters/NavigationP1) project for this module. Follow the steps below.

### Steps

#### 1. Go to the `NestedDoll` group and open the `NestedDoll.storyboard` file

#### 2. Change the *UIViewController* to be a `UITableViewController` and do not forget to keep the Storyboard ID

#### 3. Change the `Content` attribute inside the inspector to match `Static Cells`

![Make static cells](/Assets/PJ-04-02.png)

#### 4. Change the number of sections to have `2 sections`

#### 5. Now, you should have two sections. The first one should have `2 options` and the second should have `3 options`

#### 6. Change the header titles to be white spaces.

#### 7. Change the `Style` attribute inside the inspector  to `Basic` for each cell

#### 8. Change the `Accesory` indicator to match `Disclosure Indicator`

![Table View Cell Inspector](/Assets/PJ-04-03.png)

#### 9. Add labels for all the table options

Following this structure:

```bash
* Section 1:
  * General
  * Brightness
* Section 2:
  * Privacy
  * Sounds
  * Battery
```

#### 10. Run the app

Until this point your app should look like this:

![First Controller](/Assets/PJ-04-04.png)

### Use UINavigationController

#### 1. Embed the current controller inside a `UINavigationViewController`

![Embed in Navigation](/Assets/PJ-04-05.png)

#### 2. Change the navigation title to `Settings`

#### 3. Run the app! Sorry, but we need to do somthing before seeing the title

#### 4. Go to the `getTransition` method inside the `Flow` enum to change the set the boolean value to *true* for the `NestedDoll` case

#### 5. Run the app! Done

![Navigation Results](/Assets/PJ-04-06.png)

### Add a second static table

#### 1. Add a new `UITableViewController` and change it's setup to be exactly like the first table

Consider the following sections:

```bash
* Section 1:
  * Location
  * Contacts
  * Camera
  * Reminders
```

Inside your `NestedDoll.storyboard` you should have something like this:

![Second Controller](/Assets/PJ-04-07.png)

### Add navigation between tables

#### 1. Add a `segue` between the `General` cell to the second table view controller

![First to second](/Assets/PJ-04-08.png)

#### 2. Run the app

![Navigation Demo](/Assets/PJ-04-09.gif)

### Bonus: Add a third table

#### 1. Create more controllers

Create *3 controllers* that inherits from *UITableViewController*:

1. `SettingsTableViewController.swift`
2. `GeneralTableViewController.swift`
3. `CameraTableViewController.swift`

#### 2. Delete boilerplate code insde each new controller

#### 3. Set the controller

Go to the `NestedDoll.storyboard` and set the custom class for each controller inside the storyboard

#### 4. Change the title

Finally in order to display the proper title when navigate between tables, you must set the `title` property on each controller. Like this:

```swift
class CameraTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Camera"
    }

}
```

#### 5. Results

Your storyboard should look similar to the next image

![Final Nested Doll](/Assets/PJ-04-10.png)

#### 6. Run the app

![Bonus Navigation Demo](/Assets/PJ-04-11.gif)

## Hub & Spoke

### Setup

Go to the dispatcher and change the variable *mainFlow* to: `.hubSpoke`.

Remove the label and add 4 rectangle buttons. This buttons could have black as text color and yellow as background color.

Consider the following navigation options for your Hub:

```bash
- History
- Account
- Locations
- Membership
```

![Embed Hub](/Assets/PJ-04-02-02.png)

### Run the app

You should see something like this:

![Hub Buttons](/Assets/PJ-04-02-01.png)

### Add Navigation Controller

#### 1. Embed the controller inside a Navigation Controller

#### 2. Custom the controller title

#### 3. Go to the `getTransition` method inside the `Flow` enum to change the set the boolean value to *true* for the `HubSpoke` case

![Embed Hub](/Assets/PJ-04-02-03.png)

### Segues and controllers

#### 1. Create the navigation

* Add `4 view controllers` inside the `HubSpoke.storyboard`
* Add `4 segues` to connect each button with a new view controller.
* Add titles to each new controller.
* Run the app!

#### 2. Results

![Hub Segues](/Assets/PJ-04-02-04.gif)

## Tabbed View

### Setup Tabs

Go to the dispatcher and change the variable *mainFlow* to: `.tabbedView`.

Consider the following navigation options for your Hub:

```bash
- Bookmarks
- Favorites
- Contacts
- History
```

#### 1. Embed the current controller inside a `UITabBarController`

![Embed in Tabs](/Assets/PJ-04-03-01.png)

### 2.Change identifier from controller

You must set the `TabbedViewViewController` identifier to the new tab bar controller and delete from the previous controller.

### Second item

1. Add a new view controller for the second tab bar item.
2. Embed the controller inside a `UINavigationController`.
3. Connect the Tab Bar Controller with the recently created navigation controller. See the following animation:

![Add tab item](/Assets/PJ-04-03-02.gif)

### Add more items

1. Add other **2 controllers** and change the item labels to match the suggested navigation options (Bookmarks, Favorites, Contacts, History).
2. Change each item tab icon using custom items.

![Add tab item](/Assets/PJ-04-03-03.png)

3. Run the app.

![Add tab item](/Assets/PJ-04-03-04.gif)