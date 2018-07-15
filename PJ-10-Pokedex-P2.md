# App Course: Pokédex - Part 2

Code related: [Projects/PokedexP2](/Projects/PokedexP2)

## What you learn

* How to customize navigation controller header
* How to add a search bar
* How to interact with UICollectionView data source in order to filter a given set of elements.

## Initial setup

You must use the [Pokedex - Part 2 Starter](/Starters/PokedexP2) for this module. At this point we are using an enhanced folder structure using previous projects as reference. Run the app you should see:

![Main](/Assets/PJ-10-02-01.png)

## Prepare custom header

### Add logo on navigation bar

Inside `Assets` folder be sure that the logo asset is named: `pokedex`.

Inside the `UIViewController+Positions` extension add the following method:

```swift
func addPokedexLogo() {
    let image = UIImage(named: String.pokedexIcon)
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    imageView.contentMode = .scaleAspectFit
    imageView.image = image
    self.navigationItem.titleView = imageView
}
```

Now call this method at the end of the `viewDidLoad` inside your `PokemonsViewController` file:

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    ...
    ...
    addPokedexLogo()
}
```

### Setup navigation bar color

Inside the `AppDelegate` file at the following extension:

```swift
//MARK: - Navigation Bar
extension AppDelegate {
    private func setupNavigationBar() {
        UINavigationBar.appearance().backgroundColor = UIColor.vermillion
        UINavigationBar.appearance().barTintColor = UIColor.vermillion
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedStringKey.foregroundColor : UIColor.white
        ]
        UINavigationBar.appearance().barStyle = .blackOpaque
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        if let statusbar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusbar.backgroundColor = UIColor.vermillion
        }
    }
}
```

Finally call the method inside the `didFinishLaunchingWithOptions` of your `AppDelegate` file:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Bugle.setup(with: options)
        setupNavigationBar()
        return true
}
```

Run the app and you should see something like this:

![Navigation Done](/Assets/PJ-10-02-02.png)

## Add UISearchBar and filters

### Add search bar object to storyboard

**The search bar:**

* Inside your `Pokemons.storyboard` file add a `Search Bar` inside the red container view
* Inside the `Size Inspector` change the search bar width to be equal to 279
* Inside the `Size Attributes` set the `Bar Tint` to *vermillion* color
* Inside the `Size Inspector` activate top, bottom and left outer rules. Also activate inner width rule.

**The filter button:**

* Inside your `Pokemons.storyboard` file add a `Button` inside the red container view
* Inside the `Size Inspector` change sizes to match 79x36
* Inside the `Size Attributes` set the `Text Color` to *textColor* or *white* color
* Inside the `Size Attributes` set the `Background Color` to *bluish* color
* Inside the `Size Inspector` activate top, bottom and rigth outer rules. Also activate inner width rule.

### Decorate search bar outlets

#### 1. Bind search outlets

```swift
...
@IBOutlet weak var filterButton: UIButton!
@IBOutlet weak var searchBar: UISearchBar!
...
```

#### 2. Decorate filter button

In order to decorate our search bar and filter button you must need to add the following extension:

```swift
//MARK: Decoration
extension PokemonsViewController {
    private func decorateFilterButton() {
        filterButton.layer.cornerRadius = 10
        filterButton.layer.borderWidth = 3
        filterButton.layer.borderColor = UIColor.white.cgColor
    }

    private func decorateSearchBar() {
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .vermillion
        searchBar.tintColor = .white
    }
}
```

Finally call both methods inside the `viewDidLoad`:

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    ...
    ...
    addPokedexLogo()
    decorateFilterButton()
    decorateSearchBar()
}
```

### Add search bar logic controller

Now we need to use the `UISearchBarDelegate` protocol:

```swift
//MARK: - Search
extension PokemonsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
```

Do not forget to set the `PokemonsViewController` as the search bar delegate:

```swift
self.searchBar.delegate = self
```

Modify the `loadData` method to receive a search string:

```swift
func loadData(name: String? = nil) {
    ...
}
```

Call the `loadData` method inside `textDidChange` delegate method inside the recently created extension:

```swift
//MARK: - Search
extension PokemonsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        loadData(name: searchText)
    }
}
```

### Modify data requests

Inside the `PokemonsService` file modify the `getAllPokemons` method to allow a name parameter and make the proper endpoint request depending on this new parameter value:

```swift
func getAllPokemons(
        name: String? = nil,
        parser: AppParser<[SimplePokemon]>? = nil,
        completion: @escaping ([SimplePokemon]?, String?) -> Void) {

        dataTask?.cancel()

        var endpointURL = apiURL + pokemonsPath
        if let name = name {
            endpointURL += "?"
            endpointURL += "name_like=\(name)"
        }

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
```

Modify `loadData` to properly call the recently updated `getAllPokemons` method:

```swift
func loadData(name: String? = nil) {
    setProgress(to: true)
    dataHelper.getAllPokemons(name: name, parser: PokemonsParser()) { pokemons, error in
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

![Search Bar](/Assets/PJ-10-02-03.gif)

## Challenge

Now you will need to create the new filters view and connect both filters and pokemons views through a delegate.

You will need new components:

* View Controller to list all pokemons types
* Delegate protocol to communicate types controller with pokemons controller
* Update pokemon service helper to allow type parameter

### Hint

Consider the following protocol:

```swift
protocol TypeFilterSelectionDelegate{
    func filter(didChoose type: String?)
}
```

Your `PokemonsViewController` should be the `Delegate`. The new filters view controller should have an optional delegate variable.