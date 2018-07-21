# App Course: Pokédex - Part 3

Code related: [Projects/PokedexP3](/Projects/PokedexP3)

## What you learn

* How to use abstract table to speed up development
* How to connect two views with a delegate
* How to modify API client to add search parameters

## Initial setup

You must use the [Pokedex - Part 3 Starter](/Starters/PokedexP3) for this module. At this point we are using an enhanced folder structure using previous projects as reference. Run the app you should see:

![Main](/Assets/PJ-10-03-01.png)

## Create Types View

### Add assets

Inside `Assets` folder be sure that the filter asset is added.

### Create folder and files

1. Under `Presentation` group add a subgroup called `Types`
2. Under `Types` group add a subgroup called `Cell`
3. Inside `Cell` group create two files: `TypeTableViewCell.swift` and `TypeTableViewCell.xib`
4. Inside `TypeTableViewCell.swift` add the following code:

```swift
import UIKit

class TypeTableViewCell: UITableViewCell {

    static let identifier = "TypeTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
```

### Think about our custom cell

Using our design reference you should identify at least the following elements:

1. Filter icon image view
2. Type title label

**Behavior:** Our cell should provide a method to update background color and setup type name label text.

### Add outlets to XIB

Open the `TypeTableViewCell.xib` and delete the auto-generated view. Add a `UITableViewCell` from object palette.

**Note:** Do not forget to set the *custom class* to TypeTableViewCell.

#### Configure the cell container

1. Resize the main view to be 358x80
2. Inside the **Size Inspector** under **Autoresizing** section activate all outer guides.
3. Inside the **Attributes Inspector** set the collection reusable view identifier to be `TypeTableViewCell`

#### Configure the cell outlets

1. Add an UILabel outlet inside the cell xib for the type name.
2. UILabel should be 187x28 and center inside the cell container.
3. Add an UIImageView outlet inside the cell xib for the filter icon.
4. UIImageView should be 53x28.
5. Inside the **Attributes Inspector** under **View** section set the *Content Mode* option to *Aspect Fit*.
6. Inside the **Size Inspector** under **Autoresizing** section activate only the inner guides for both outlets.

At this point you should have something like this:

![Cell Type](/Assets/PJ-10-03-02.png)

### Add working code for our custom cell

#### 1. Bind any outlets to your swift cell class

```swift
import UIKit

class TypeTableViewCell: UITableViewCell {

    //MARK: - Identifier

    static let identifier = "TypeTableViewCell"

    //MARK: - Outlets

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var filterIcon: UIImageView!
    @IBOutlet weak var typeNameLabel: UILabel!

    //MARK: - Cell

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
```

#### 2. Create a tpye table cell concrete decorator

At this point we are using the following hook classes:

* `CellDecorator.swift`
* `AppCellDecorator.swift`
* `PokemonType.swift`

Add the following method inside `PokemonType.swift`:

```swift
    ...

    func color() -> UIColor {
        return PokemonType.color(from: self.rawValue)
    }

    ...
```

Under the `Decorators` folder create a new file `TypeTableCellDecorator.swift`:

```swift
import UIKit

class TypeTableCellDecorator: AppCellDecorator<PokemonType> {
    override func decorate(cell: UITableViewCell, using model: PokemonType?) {
        let typeCell = cell as! TypeTableViewCell
        typeCell.typeNameLabel?.text = model!.rawValue.uppercased()
        typeCell.containerView?.backgroundColor = model!.color()
    }
}
```

### Create types controller table view

1. Inside `Presentation/Types` group create two files: `TypesViewController.swift` and `Types.storyboard`
2. Inside `TypesViewController.swift` add the following code:

```swift
import UIKit

class TypesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```

### Reuse data table controller to speed up development

Modify `DataTableViewController.swift`:

```swift
protocol DataTableView {
    associatedtype Model
    var dataSource: AppDataSource<Model>? { get set }
    var cellDecorator: AppCellDecorator<Model>? { get set }
}

class DataTableViewController<Cell: UITableViewCell, DataModel>: UITableViewController, DataTableView {
    // MARK: - DataTableView

    var dataSource: AppDataSource<DataModel>?
    var cellDecorator: AppCellDecorator<DataModel>?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableCellNib()
    }

    func cellIdentifier() -> String {
        return "Cell"
    }

    // MARK: - Data Source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfRowsInSection(section: section) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier()) as! Cell
        let item = dataSource?.modelAt(indexPath: indexPath)
        DispatchQueue.main.async {
            self.cellDecorator?.decorate(cell: cell, using: item)
        }
        return cell
    }

    //MARK: - Register

    func registerTableCellNib() {
        //Could be override in order to register a custom cell
    }
}
```

Inside `TypesViewController.swift` extend from DataTableViewController.

```swift
import UIKit

class TypesViewController: DataTableViewController<TypeTableViewCell, PokemonType> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```

Initialize data source and decorator inside *viewDidLoad*

```swift
import UIKit

class TypesViewController: DataTableViewController<TypeTableViewCell, PokemonType> {
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = AppDataSource(array: PokemonType.allTypes())
        cellDecorator = TypeTableCellDecorator()
    }
}
```

Override both `registerTableCellNib` and `cellIdentifier` methods:

```swift
import UIKit

class TypesViewController: DataTableViewController<TypeTableViewCell, PokemonType> {

    ...

    override func registerTableCellNib() {
        let cellNib = UINib(nibName: TypeTableViewCell.identifier, bundle: nil)
        self.tableView.register(
            cellNib,
            forCellReuseIdentifier: TypeTableViewCell.identifier
        )
    }

    override func cellIdentifier() -> String {
        return TypeTableViewCell.identifier
    }

    ...
}
```

### Connect navigation between pokemons list and types view

Inside `Types.storyboard`:

* Add an `UITableViewController` from object palette
* Set the custom class to `TypesViewController`
* Set the *Storyboard ID* to `TypesViewController`
* Make this controller the **initial view controller** inside the storyboard

![Storyboard Table View](/Assets/PJ-10-03-03.png)

Inside `Pokemons.storyboard`:

* Add a `Storyboard Reference` from object palette
* Inside the **Attributes Inspector** set the *Storyboard* to `Types`
* Click `All` button inside *Pokédex Scene*, drag and drop onto the *Storyboard Reference* in order to connect both controllers through a `Show` segue.

![Types Navigation](/Assets/PJ-10-03-04.png)

#### Decorate types view

Inside the `TypesViewController.swift` add the following extension:

```swift
extension TypesViewController {
    private func decorateTableView() {
        title = "Types"
        tableView.rowHeight = 80.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        navigationController?.navigationBar.tintColor = .white
    }
}
```

Now call this method at the end of the `viewDidLoad` inside your `TypesViewController` file.

### Run the App, see the results

![Types Navigation](/Assets/PJ-10-03-05.gif)

## Connect types and main view through delegates

### Create protocol

Add the following delegate at the top of the `TypesViewController.swift` file:

```swift
protocol TypeSelectionDelegate {
    func typeSelection(didChoose type: PokemonType?)
}
```

*Note:* Based on naming convention from [Raywenderlich Styleguide](https://github.com/raywenderlich/swift-style-guide#delegates)

### Add delegate property

Inside the `TypesViewController` controller file add a `TypeSelectionDelegate` variable:

```swift
class TypesViewController: DataTableViewController<TypeTableViewCell, PokemonType> {

    var delegate: TypeSelectionDelegate?

    override func viewDidLoad() {
        ...
    }

    ...
}
```

### Call the delegate handler

Inside the `TypesViewController` override `didSelectRowAt` from table view delegate:

```swift
    ...

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentType = dataSource?.modelAt(indexPath: indexPath)
        delegate?.typeSelection(didChoose: currentType)
        navigationController?.popViewController(animated: true)        
    }

    ...
```

### Use the delegate on pokemons view

Inside the file `PokemonsViewController.swift` at the following variable:

```swift
class PokemonsViewController: BaseViewController {

    //MARK: - Variables

    ...
    var pokemonTypeFilter: PokemonType?
    ...
}
```

Also, add an extension implementing the `TypeSelectionDelegate` delegate method:

```swift
extension PokemonsViewController: TypeSelectionDelegate {
    func typeSelection(didChoose type: PokemonType?) {
        filterButton.backgroundColor = type?.color()
        filterButton.setTitle(
            type?.rawValue.uppercased(),
            for: UIControlState.normal
        )
        pokemonTypeFilter = type
        //TODO: Modify and call loadData()
    }
}
```

### Intercep navigation and modify segue destination

#### 1. Add segue identifier inside storyboard

Inside the `Pokemons.storyboard` file, select the segue between the *pokemons controller* and the *types storyboard reference* to add the identifier `FromPokemonsToTypes` using the **Attributes Inspector**

![Types Navigation](/Assets/PJ-10-03-06.png)

#### 2. Add segue identifier constant

```swift
private let typesSegueIdentifier = "FromPokemonsToTypes"
```

#### 3. Set the delegate

Under the `Controller` MARK override the `prepare` method:

```swift
    ...

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == typesSegueIdentifier {
            let destination = segue.destination as! TypesViewController
            destination.delegate = self
        }
    }

    ...
```

#### 4. Run the App, see the results

![Types Navigation](/Assets/PJ-10-03-07.gif)

## Modify API client

Inside the `PokemonsService` file modify the `getAllPokemons` method to allow a type parameter and make the proper endpoint request depending on this new parameter value:

```swift
import Foundation

class PokemonsService {
    private let apiURL = "https://ios-course-poke-api.herokuapp.com"
    private let pokemonsPath = "/pokemons"

    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?

    func getAllPokemons(
        name: String? = nil,
        type: PokemonType? = nil,
        parser: AppParser<[SimplePokemon]>? = nil,
        completion: @escaping ([SimplePokemon]?, String?) -> Void) {

        dataTask?.cancel()

        let endpointURL = endpoint(with: name, type: type)
        debugPrint(endpointURL)

        if var urlComponents = URLComponents(string: endpointURL) {

            guard let url = urlComponents.url else { return }

            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                //Declares a block that will be executed only when execution leaves the current scope.
                defer { self.dataTask = nil }

                guard error == nil else {
                    completion(nil, error!.localizedDescription)
                    return
                }

                guard let parser = parser else {
                    completion(nil, "Error has ocurred")
                    return
                }

                if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    DispatchQueue.main.async {
                        completion(parser.parse(data), nil)
                    }
                }
            }

            dataTask?.resume()
        }
    }

    func endpoint(with name: String? = nil, type: PokemonType? = nil) -> String {
        let endpoint = apiURL + pokemonsPath

        var parameters: [String] = []
        if let name = name, !name.isEmpty {
            parameters.append("name_like=\(name)")
        }

        if let type = type, !type.rawValue.isEmpty && type != .all {
            parameters.append("types_like=\(type.rawValue.uppercased())")
        }
        return endpoint.with(parameters)
    }
}

extension String {
    func with(_ parameters: [String]) -> String {
        var url = self

        if !parameters.isEmpty {
            url = parameters.reduce("\(url)?") { result, param in
                return "\(result)\(param)&"
            }
        }

        return url
    }
}
```

Modify `loadData` to properly call the recently updated `getAllPokemons` method:

```swift
func loadData(name: String? = nil) {
    setProgress(to: true)
        dataHelper.getAllPokemons(
            name: name, type: pokemonTypeFilter, parser: PokemonsParser()
        ) { pokemons, error in
            self.setProgress(to: false)

            guard error == nil else {
                self.display(error!)
                return
            }

            guard let pokemons = pokemons, pokemons.count > 0 else {
                self.display(String.emptyList)
                return
            }

            DispatchQueue.main.async {
                self.pokemons = pokemons
                self.collectionView.reloadData()
            }
        }
}
```

Run the app and you should see something like this:

![Filter search](/Assets/PJ-10-03-08.gif)
