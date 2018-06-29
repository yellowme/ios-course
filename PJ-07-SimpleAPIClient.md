# Project: Simple API Client

Final code related: [Projects/SimpleAPIClient](/Projects/SimpleAPIClient)

## Requirements

**You must open** the module [Starter](/Starters/SimpleAPIClient)

## Understand the Endpoint and the Model

The **base URL** of our API is: `https://ios-course-poke-api.herokuapp.com`

### Endpoints

* `/pokemons` - To list all pokemons
* `/pokemons?types=FIRE` - Search by type
* `/pokemons?name=Charmander` - Search by exact name
* `/pokemons?name_like=charm` - Search by name using LIKE modifier
* `/pokemons?types=FIRE&name_like=charm` - Search by type and name using LIKE modifier
* `/pokemons/{id}` - To get a specific pokemon details

### Models

#### Pokémon

```json
{
    "id": "1",
    "name": "Bulbasaur",
    "types": [
      "GRASS",
      "POISON"
    ],
    "generation": "ONE",
    "region": "KANTO",
    "imageUrl": "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png"
}
```

## Uodate the Data Helper

Go to the [Starter](/Starters/SimpleAPIClient) project and open the `DateHelper.swift` file. Inside add:

* **apiURL** to be `https://ios-course-poke-api.herokuapp.com`
* **pokemonsPath** to be `/pokemons`

## Update the Model

Open the `SimplePokemon.swift` file. Update the model to match JSON response from server.

```swift
struct SimplePokemon {
    let id: String?
    let types: [String]?
    let region: String?
    let generation: String?
    let imageURL: String?
    let name: String?
}
```

**Important:** Do not forget to comment the line `self.dataSource?.items += [SimplePokemon(name: "Pikachu")]`

## Fetch the data

Open the `DateHelper.swift` file.

Add a `URLSession` constant and a `URLSessionDataTask` variable:

```swift
let defaultSession = URLSession(configuration: .default)
var dataTask: URLSessionDataTask?
```

Define a `getAllPokemons` method to fetch data from server.

```swift
func getAllPokemons(completion: @escaping (Data?, String?) -> Void) {
    dataTask?.cancel()

    if var urlComponents = URLComponents(string: apiURL + pokemonsPath) {

        guard let url = urlComponents.url else { return }

        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            //Declares a block that will be executed only when execution leaves the current scope.
            defer { self.dataTask = nil }

            guard error == nil else {
                completion(nil, error!.localizedDescription)
                return
            }

            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                DispatchQueue.main.async {
                    completion(data, nil)
                }
            }
        }

        dataTask?.resume()
    }
}
```

Open the `PokemonsTableViewController.swift` file. Add change the *fake* API call to use the new method of the *DataHelper*.

*Note:* Do not forget to add a constant `let dataHelper = DataHelper()`

```swift
func loadData() {
    setProgres(active: true)
    dataHelper.getAllPokemons { data, message in
        self.setProgres(active: false)

        debugPrint("Data: \(data)")
        debugPrint("Message: \(message ?? "No error message")")

        // self.tableView.reloadData()
    }
}
```

Watch the console, you should see something like this:

![Data response](/Assets/PJ-06-01.png)

## Parse the data

Until this point we have a `Data object` and we need to parse it.

Create a parser file inside the `Data` folder:

```swift
protocol Parser {
    associatedtype ResponseModel
    func parse(_ data: Data) -> ResponseModel?
}

class AppParser<Model>: Parser {
    func parse(_ data: Data) -> Model? {
        // Override and parse the concrete model
        return nil
    }
}
```

Create a concrete *PokemonsParser*:

```swift
class PokemonsParser: AppParser<[SimplePokemon]> {
    override func parse(_ data: Data) -> [SimplePokemon]? {
        // Parse data to create a Pokemon model
        return nil
    }
}
```

Modify the method `getAllPokemons` to accept a *parser* parameter and make the call to the `parse` method:

```swift
func getAllPokemons(_ parser: AppParser<[SimplePokemon]>? = nil, completion: @escaping ([SimplePokemon]?, String?) -> Void) {
    dataTask?.cancel()

    if var urlComponents = URLComponents(string: apiURL + pokemonsPath) {

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

Also modify the call to the method *getAllPokemons* inside the `loadData` to pass a `PokemonsParser` instance as parameter:

```swift
func loadData() {
    setProgres(active: true)
    dataHelper.getAllPokemons(PokemonsParser()) { pokemons, error in
        self.setProgres(active: false)

        guard error == nil else {
            self.display(message: error!)
            return
        }

        guard let pokemons = pokemons, pokemons.count > 0 else {
            self.display(message: "Empty list")
            return
        }

        self.dataSource?.items = pokemons
        self.tableView.reloadData()
    }
}
```

In order to parse the array of objects from the API response you need to make the `SimplePokemon` to use the `Codable` protocol and add a `CodingKey` enum inside the model:

```swift
struct SimplePokemon: Pokemon, Codable {
    let id: String?
    let types: [String]?
    let region: String?
    let generation: String?
    let imageURL: String?
    let name: String?

    private enum CodingKeys: CodingKey {
        case id
        case types
        case region
        case generation
        case imageURL
        case name
    }
}
```

Finally parse the `Data object` to return and *array of pokemons*:

```swift
class PokemonsParser: AppParser<[SimplePokemon]> {
    override func parse(_ data: Data) -> [SimplePokemon]? {
        do {
            let decoder = JSONDecoder()
            let pokemons = try decoder.decode([SimplePokemon].self, from: data)
            return pokemons
        } catch {
            return nil
        }
    }
}
```

## Display data on the UI

Verify your `SimplePokemonCellDecorator` class, it should look like this:

```swift
class SimplePokemonCellDecorator: AppCellDecorator<Pokemon> {
    override func decorate(cell: UITableViewCell, using model: Pokemon?) {
        let pokemon = model as! SimplePokemon
        cell.textLabel?.text = pokemon.name ?? "No name"
    }
}
```

## BONUS: Add a loading indicator

Go to the [YellowPod - BaseViewControllerIndicator](https://github.com/yellowme/base-ios/blob/master/YellowPod/YellowPod/Common/ViewPresenter/BaseViewControllerIndicator.swift) source file and add it to your project. For now you could add it under the folder `Presentation`.

Update the `setProgres` method:

```swift
func setProgres(active: Bool) {
    if active {
        self.showIndicator(on: view, options: BaseViewIndicatorOptions(
            indicatorColor: .blue, alpha: 0.6, overlayColor: .lightGray
        ))
    } else {
        self.hideActivityIndicator(on: view)
    }
}
```