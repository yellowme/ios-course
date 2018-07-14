# User Defaults

Code related: [Projects/Pokedex](/Projects/Pokedex)

## What you learn

* How to use UICollectionView
* How to create custom cells on UICollectionView and UITableView

## Initial setup

You must use the [Pokedex Starter](/Starters/Pokedex) for this module. At this point we are using an enhanced folder structure using previous projects as reference. Run the app you should see the following screens:

Welcome             |  Main View (Basic)
:-------------------------:|:-------------------------:
![Welcome](/Assets/PJ-10-01.png)  |  ![Main](/Assets/PJ-10-02.png)

## Replace UITableView with a UICollectionView

### Add collection object to storyboard

1. Delete everything inside `Pokemons.storyboard`
2. Drag and drop an UIViewController
3. Embed the current controller inside a `UINavigationViewController`
4. Add an UIView and UICollectionView outlets to the recently created controller
5. Configure spaces and sizes for each view

At this point you should have something like this:

![New pokemons storyboard](/Assets/PJ-10-03.png)

*Note:* If you run the app at this point it should crash.

### Add collection logic controller

1. Change inheritance inside `PokemonsTableViewController.swift` from `DataTableViewController<Pokemon>` to `BaseViewController`.
2. Temporally comment `dataSource` and `cellDecorator` related lines.
3. Locate and remove `tableView` related lines.
4. Rename the file from `PokemonsTableViewController.swift` to `PokemonsViewController.swift`. *Note:* Do not forget to update **UIViewController+Navigation.swift**.
5. Inside your file `PokemonsViewController.swift` update class name and extesion section to match new naming.
6. Run the app.

At this point you should have something like this:

![New pokemons storyboard](/Assets/PJ-10-04.png)

## Prepare custom cells

### Create folder and files

1. Under `Pokemons` group add a subgroup called `Cell`
2. Inside `Cell` group create two files: `PokemonCollectionViewCell.swift` and `PokemonCollectionViewCell.xib`
3. Inside `PokemonCollectionViewCell.swift` add the following code:

```swift
import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {

    static let identifier = "PokemonCollectionViewCell"

    override public func awakeFromNib() {
        super.awakeFromNib()
    }

}
```

## Work on our custom cell

Using our design reference you should identify at least the following elements:

1. Number label
2. Pokemon image
3. Name label
4. Types section (1 or 2 types)

Now the easy way to create this layouting is grouping elements.

1. Number label, pokemon image.
2. Name label, types section.

### Add outlets to XIB

Open the `PokemonCollectionViewCell.xib` and delete the auto-generated view. Add a `UICollectionViewCell` from object palette.

#### Configure the main view

1. Resize the main view to be 200x200
2. Inside the **Size Inspector** under **Autoresizing** section activate all guides.
3. Inside the **Attributes Inspector** set the collection reusable view identifier to be `PokemonCollectionViewCell`

#### Configure the cell main sections

1. Add two UIView outlets inside the cell xib.
2. First section should be 200x138
3. Second section should be 200x62
4. For each view, inside the **Size Inspector** under **Autoresizing** section activate only the inner guides.

At this point you should have something like this:

![Cell Main Sections](/Assets/PJ-10-05.png)

#### Configure the first section

1. Add an UILabel for the pokemon number identifier
2. Number identifier label should be 40x40
3. For Number identifier label, inside the **Size Inspector** under **Autoresizing** section activate outer left, right and top guides.
4. Add an UIImageView for the pokemon image
5. Pokemon image should be 100x100
6. For Pokemon image, inside the **Size Inspector** under **Autoresizing** section activate all the inner guides and the outer top guide.

![First Section](/Assets/PJ-10-06.png)

#### Configure the second section

1. Add an UILabel for the pokemon name
2. Name label should be 184x21
3. For name label, inside the **Size Inspector** under **Autoresizing** section activate all guides except the outer bottom guide.

![Second Section](/Assets/PJ-10-07.png)

#### Configure the types section

1. Add an UIView outlet inside second section view
2. UIView should be 50x23
3. Add an UILabel for a single pokemon type use case
4. Name label should be 50x23
5. For both view and label, inside the **Size Inspector** under **Autoresizing** section activate all inner guides.
6. Inside the **Attributes Inspector** activate the **Hidden** drawing option for the view added on step one
7. Copy the step one view content and paste it one time, modify this view width to be 100x23
8. Copy the inner label and align both labels center one next to the other
9. Change text content and colors on these two labels.

![Types Section](/Assets/PJ-10-08.png)

### Draw cells on Pokemons collection view

#### 1. Add a temporal variable to hold a pokemon array

#### 2. Inside the `loadData` server response set the pokemons reponse to the controller pokemons variable. *Note:* Do not forget to reload collection view

#### 3. Bind the UICollectionView to your `PokemonsViewController.swift`

At this point your `PokemonsViewController` should have something like this:

```swift
class PokemonsViewController: BaseViewController {

    //MARK: - Variables

    private let dataHelper = PokemonsService()
    var sessionManager: SessionManagerProtocol? = SessionManager()
    var pokemons: [Pokemon] = [] //Temporal variable

    //MARK: - Outlets

    @IBOutlet weak var collectionView: UICollectionView!

    //MARK: - Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        //dataSource = AppDataSource(array: [])
        //cellDecorator = SimplePokemonCellDecorator()
        var pokedexTitle = String.pokedex
        if let session = sessionManager?.retrieve() {
            pokedexTitle += " - \(session.userName)"
        }
        title = pokedexTitle
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }

    //MARK: - Loading Data

    func loadData() {
        setProgress(to: true)
        dataHelper.getAllPokemons(PokemonsParser()) { pokemons, error in
            self.setProgress(to: false)

            guard error == nil else {
                self.display(error!)
                return
            }

            guard let pokemons = pokemons, pokemons.count > 0 else {
                self.display(String.emptyList)
                return
            }

            self.pokemons = pokemons
            self.collectionView.reloadData()
        }
    }

}
```

#### 4. Use an extension to make `PokemonsViewController` delegate of `UICollectionViewDelegate`and `UICollectionViewDataSource`

#### 5. Implement the following methods: `numberOfItemsInSection`. `cellForItemAt`

#### 6. The method `numberOfItemsInSection` should return the controller pokemons count

At this point your `extension` should have something like this:

```swift
extension PokemonsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PokemonCollectionViewCell.identifier,
            for: indexPath
        ) as! PokemonCollectionViewCell

        let currentPokemon = pokemons[indexPath.row]
        print(currentPokemon)
        return cell
    }
}
```

#### 7. Set the collection view delegate to be `PokemonsViewController`

#### 8. Set the collection view data source to be `PokemonsViewController`

At this point your `viewDidLoad` should have something like this:

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    var pokedexTitle = String.pokedex
    if let session = sessionManager?.retrieve() {
        pokedexTitle += " - \(session.userName)"
    }
    title = pokedexTitle

    collectionView.delegate = self
    collectionView.dataSource = self
}
```

#### 9. The method `cellForItemAt` must dequeue `PokemonCollectionViewCell`, decorate it and return it

#### Our application just crashed

This occurs cause we forget to register our custom cell for the collection view to recognized. Add the following method inside an extesion of the `PokemonsViewController.swift`

```swift
extension PokemonsViewController {
    private func registerPokemonCell() {
        let cellXib = UINib(nibName: PokemonCollectionViewCell.identifier, bundle: nil)
        collectionView.register(
            cellXib,
            forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier
        )
    }
}
```

Call this method inside the `viewDidLoad`:

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    var pokedexTitle = String.pokedex
    if let session = sessionManager?.retrieve() {
        pokedexTitle += " - \(session.userName)"
    }
    title = pokedexTitle

    collectionView.delegate = self
    collectionView.dataSource = self

    registerPokemonCell()
}
```

Run the app and you should see something like this:

![Types Section](/Assets/PJ-10-09.png)

**Note:** Don't worry about the grid columns and the layout, we are going to fix it in the following sections.

### Fix collection view layout and columns

#### 1. Add two constants

```swift
private let numberOfColumns: CGFloat = 3.0
private let minSpacing: CGFloat = 3.0
```

#### 2. Add a private method to configure spacing and columns

```swift
private func setCollectionViewSpacing(){
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let width = UIScreen.main.bounds.width - (minSpacing * 2)

    layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    layout.itemSize = CGSize(width: width / numberOfColumns, height: width / numberOfColumns)
    layout.minimumInteritemSpacing = minSpacing
    layout.minimumLineSpacing = minSpacing

    collectionView!.collectionViewLayout = layout
}
```

#### 3. Call `setCollectionViewSpacing` method inside the `viewDidLoad`

Run the app and you should see something like this:

![Types Section](/Assets/PJ-10-10.png)

### Add working code for our custom cell

#### 1. Bind any outlets to your swift cell class

At this point you should have something like this:

```swift
import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {

    //MARK: - Variables

    static let identifier = "PokemonCollectionViewCell"

    //MARK: - Outlets

    @IBOutlet weak var numberIdentifierLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var twoTypesViewContainer: UIView!
    @IBOutlet weak var singleTypeViewContainer: UIView!

    //MARK: - Cell

    override public func awakeFromNib() {
        super.awakeFromNib()
    }

}
```

#### 2. Create a new cell decorator

Inside the file `CellDecorator.swift` add another protocol definition for a collection cell decorator:

```swift
protocol CollectionCellDecorator {
    associatedtype Model
    associatedtype Cell: UICollectionViewCell
    func decorate(cell: Cell, using model: Model?)
}
```

#### 3. Create the abstract collection cell decorator

Inside the file `AppCellDecorator.swift` add another class definition for a collection cell decorator:

```swift
class AppCollectionCellDecorator<ConcreteCell, Model>: CollectionCellDecorator where ConcreteCell: UICollectionViewCell {
    func decorate(cell: ConcreteCell, using model: Model?) {
        //IMPORTANT: Must override
    }
}
```

#### 3. Create a Pokemon collection cell concrete decorator

Under the `Decorators` folder create a new file `PokemonCollectionCellDecorator.swift`:

```swift
import UIKit

class PokemonCollectionCellDecorator: AppCollectionCellDecorator<PokemonCollectionViewCell, Pokemon> {
    override func decorate(cell: PokemonCollectionViewCell, using model: Pokemon?) {
        let pokemon = model as! SimplePokemon
        cell.nameLabel?.text = pokemon.name ?? "No name"
        //TODO: Decorate all other outlets
    }
}
```

#### 4. Update pokemons view controller

Add a variable for the decorator:

```swift
var cellDecorator: AppCollectionCellDecorator<PokemonCollectionViewCell, Pokemon>?
```

Initialize the variable inside the `viewDidLoad`:

```swift
cellDecorator = PokemonCollectionCellDecorator()
```

Call the decorator inside the `cellForItemAt` collection view method:

```swift
cellDecorator?.decorate(cell: cell, using: currentPokemon)
```

Run the app and you should see something like this:

![Types Section](/Assets/PJ-10-11.png)

## Challenge: Finish cell decoration using all attributes and outlets

Now it's time for you to play around! Complete the cell decoration for the pokemon cell.

*Note:* Don't forget to include the colors extension and a types reference. And **remember to use SDWebImage pod dependecy** for image loading.

**Hint:**

```swift
import UIKit

enum PokemonType: String {
    case normal = "normal"
    case fighting = "fighting"
    case flying = "flying"
    case poison = "poison"
    case ground = "ground"
    case rock = "rock"
    case bug = "bug"
    case ghost = "ghost"
    case fire = "fire"
    case water = "water"
    case grass = "grass"
    case electric = "electric"
    case psychic = "psychic"
    case ice = "ice"
    case dragon = "dragon"

    func all() -> [PokemonType] {
        return [] //TODO: Change
    }

    static func color(from rawType: String) -> UIColor{
        return .black //TODO: Change
    }
}
```