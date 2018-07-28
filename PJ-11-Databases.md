# Databases

Code related: [Projects/Databases](/Projects/Databases)

## What you learn

* Model data using Xcode’s model editor
* Add new records to Core Data
* Fetch a set of records from Core Data

## Initial setup

Open Xcode and create a new iOS project based on the Single View App template. **Name the app "MoviesList" and make sure Use Core Data is checked.**

![Xcode](/Assets/PJ-11-01.png)

### Setup storyboard

Open the `Main.storyboard` and embed the view controller inside a navigation controller. (From Xcode’s Editor menu, select "Embed In" => "Navigation Controller")

Click on the navigation controller’s `Navigation Bar` to select it, then click on Prefers Large Titles in the Attributes Inspector.

Add a `TableView` from the object library into the view controller, then resize it so it covers the entire view. (Be sure to activate all guides inside Size Inspector)

Finally add a `BarButtonItem` and place it on the view controller’s navigation bar. Select the bar button item and change its system item to **Add**. Your canvas should look similar to the following screenshot:

![Add Button](/Assets/PJ-11-02.png)

### Setup controller

#### 1. Bind outlets and actions

```swift
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        ...
    }

    @IBAction func didTapAddButton(_ sender: UIBarButtonItem) {

    }
}
```

### 2. Model for the table view

Add the following property to ViewController.swift below the tableView IBOutlet:

```swift
var movies: [String] = []
```

Update your `viewDidLoad()` with the following:

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    title = "Movies"
    tableView.register(
        UITableViewCell.self,
        forCellReuseIdentifier: "Cell"
    )
    tableView.dataSource = self
}
```

### 3. Data for the tablev view

Add the following `UITableViewDataSource` extension below your class definition for ViewController:

```swift
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell",
            for: indexPath
        )
        cell.textLabel?.text = movies[indexPath.row]
        return cell
    }
}
```

### 4. Provide a way to add data

First, create a new file called `ViewController+Ext` and add the following:

```swift
import UIKit

extension ViewController {
    internal func displayAdditionAlert(mainHandler: ((String) -> Swift.Void)?) {
        let alert = UIAlertController(
            title: "New movie",
            message: "Add a new movie",
            preferredStyle: .alert)

        let saveAction = UIAlertAction(
            title: "Save",
            style: .default
        ) { _ in

                guard
                    let textField = alert.textFields?.first,
                    let nameToSave = textField.text
                    else {
                        return
                }

                mainHandler?(nameToSave)
        }

        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .default
        )

        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
```

Now that we have a way to display a dialog to add new movies, implement the `didTapAddButton` IBAction method:

```swift
@IBAction func didTapAddButton(_ sender: UIBarButtonItem) {
    displayAdditionAlert { nameToSave in
        self.movies.append(nameToSave)
        self.tableView.reloadData()
    }
}
```

### 5. Run and see the results

## Modeling your Data

Since you’ve elected to use Core Data, Xcode automatically created a Data Model file for you and named it `MoviesList.xcdatamodeld.`

![Xcdatamodeld](/Assets/PJ-11-03.png)

Open `MoviesList.xcdatamodeld.`:

* Click on `Add Entity` on the lower-left to create a new entity.
* Double-click the new entity and change its name to **Movie**,
* Select **Movie** on the left-hand side and click the plus sign (+) under Attributes.
* Set the new attribute’s name to, er, name and change its type to String:

![MovieModel](/Assets/PJ-11-04.png)

## Saving to Core Data

Open `ViewController.swift`, add the following Core Data module import below the UIKit import:

```swift
import CoreData
```

Next, replace the *movies* property definition with the following:

```swift
var movies: [NSManagedObject] = []
```

Update your `UITableViewDataSource` extension with the following:

```swift
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "Cell",
            for: indexPath
        )
        cell.textLabel?.text = movie.value(forKeyPath: "name") as? String
        return cell
    }
}
```

First, create a new file called `ViewController+Data` and add the following:

```swift
import UIKit
import CoreData

// MARK: - Data
extension ViewController {
    internal func save(name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        // You can consider a managed object context as an in-memory
        // “scratchpad” for working with managed objects.
        let managedContext = appDelegate.persistentContainer.viewContext

        // You must spell the KVC key (name in this case) exactly as
        // it appears in your Data Model
        let entity = NSEntityDescription.entity(
            forEntityName: "Movie",
            in: managedContext)!

        let movie = NSManagedObject(entity: entity, insertInto: managedContext)
        movie.setValue(name, forKeyPath: "name")

        do {
            try managedContext.save()
            movies.append(movie)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
```

Finally, find `didTapAddButton` method and replace the save action with the following:

```swift
@IBAction func didTapAddButton(_ sender: UIBarButtonItem) {
    displayAdditionAlert { nameToSave in
        self.save(name: nameToSave)
        self.tableView.reloadData()
    }
}
```

## Fetching from Core Data

To get data from your persistent store into the managed object context, you have to fetch it.

Open `ViewController+Data.swift` and add this a new method called `populateMovies`:

```swift
internal func populateMovies() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
        return
    }

    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Movie")

    do {
        movies = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
    }
}
```

Finally, open `ViewController.swift` and add this code below viewDidLoad():

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    populateMovies()
}
```

![Results](/Assets/PJ-11-05.gif)