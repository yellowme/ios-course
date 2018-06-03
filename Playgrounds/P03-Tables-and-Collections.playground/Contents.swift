// iOS Course Tables and Collections
// Author: Luis Burgos <luis@yellowme.mx>
//
// Steps:
// 1) Create a UITableViewController
// 2) Create a UITableViewController with title
// 3) Create the model, data source
// 4) Create a UITableViewController with title and associated the data source
// 5) Create a reusable cell decorator
// 6) Create a "Detail" view controller
// 7) Connect the detail view with the table view
// 8) Create another data source and cell dacorator

import UIKit
import PlaygroundSupport

/// MARK: --- PART 1 ---
// Create the base controller

class MasterViewController: UITableViewController {
    
}

let masterViewController = MasterViewController()

/// MARK: --- PART 2 ---
// Add a title to the view

/*class MasterViewController: UITableViewController {
    override func viewDidLoad() {
        title = "Las mejores películas"
    }
}

let masterViewController = MasterViewController() 
*/

/// MARK: --- PART 3 ---
// Add data source protocol, model and concrete implementations

protocol Movie {
    var id: String { get }
    var name: String { get }
}

struct SimpleMovie: Movie {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

protocol DataSource {
    associatedtype Model
    var numberOfSections: Int { get }
    func numberOfRowsInSection(section: Int) -> Int
    func modelAt(indexPath: IndexPath) -> Model?
}

class MoviesDataSource<T>: DataSource {
    // MARK: - Internal Properties
    var items: [T] = []
    
    // MARK: - Lifecycle
    init(array: [T]) {
        items = array
    }

    var numberOfSections: Int = 1
    
    func numberOfRowsInSection(section: Int) -> Int {
        return items.count
    }
    
    func modelAt(indexPath: IndexPath) -> T? {
        return items[indexPath.row]
    }
}

var simpleMovies = [
    SimpleMovie(id: "1", name: "Regreso al futuro"),
    SimpleMovie(id: "2", name: "El planeta de los simios"),
    SimpleMovie(id: "3", name: "Harry Potter"),
    SimpleMovie(id: "4", name: "X-Men"),
    SimpleMovie(id: "5", name: "Star Wars"),
]

/// MARK: --- PART 4 ---
// Bind the data source with the table view controller overriding the Table View methods

/*class MasterViewController: UITableViewController {
    var cellIdentifier = "Cell"
    var dataSource: MoviesDataSource<Movie>?
    
    override func viewDidLoad() {
        title = "Las mejores películas"
    }
}

// MARK: - Table view data source
extension MasterViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfRowsInSection(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) //Attempt to "dequeue" a cell
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
            cell?.accessoryType = .disclosureIndicator
        }
        
        let movie = dataSource?.modelAt(indexPath: indexPath)
        cell.textLabel?.text = movie!.name
        cell.detailTextLabel?.text = "Película #\(movie!.id)"
        return cell
    }
}

let masterViewController = MasterViewController()
masterViewController.dataSource = MoviesDataSource(array: simpleMovies)
 */

/// MARK: --- PART 5 ---
// Create a reusable cell decorator

/*protocol MovieCellDecorator {
    func decorate(cell: UITableViewCell, using model: Movie?)
}

struct SimpleMovieCellDecorator: MovieCellDecorator {
    func decorate(cell: UITableViewCell, using model: Movie?) {
        let simpleMovie = model as! SimpleMovie
        cell.textLabel?.text = "Película #\(simpleMovie.id)"
        cell.detailTextLabel?.text = simpleMovie.name
    }
}

class MasterViewController: UITableViewController {
    var cellIdentifier = "Cell"
    var dataSource: MoviesDataSource<Movie>?
    var cellDecorator: MovieCellDecorator?
    
    override func viewDidLoad() {
        title = "Las mejores películas"
    }
}

// MARK: - Table view data source
extension MasterViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfRowsInSection(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) //Attempt to "dequeue" a cell
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
            cell?.accessoryType = .disclosureIndicator
        }
        
        let movie = dataSource?.modelAt(indexPath: indexPath)
        cellDecorator?.decorate(cell: cell, using: movie)
        return cell
    }
}

let masterViewController = MasterViewController()
masterViewController.dataSource = MoviesDataSource(array: simpleMovies)
masterViewController.cellDecorator = SimpleMovieCellDecorator()*/

/// MARK: --- PART 6 ---
// Add a "Detail" view controller

/*class DetailViewController: UIViewController {
    var message: String = ""
    var label: UILabel!
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLayoutSubviews() {
        label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        label.textColor = .black
        label.text = message
        label.textAlignment = .center
        view.addSubview(label)
        label.center = view.center
    }
}*/

/// MARK: --- PART 7 ---
// Connect the detail view with the table view

/*extension MasterViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = dataSource?.modelAt(indexPath: indexPath) else { return }
        
        let detail = DetailViewController()
        detail.message = movie.name
        navigationController?.pushViewController(detail, animated: true)
    }
}*/

/// MARK: --- PART 8 ---
// Change the model, data source and decorator

/*struct EmojiMovieRepresentation: Movie {
    var id: String
    var name: String
    var emoji: String
    
    init(id: String, name: String, emoji: String) {
        self.id = id
        self.name = name
        self.emoji = emoji
    }
}

var emojisMovies = [
    EmojiMovieRepresentation(id: "1", name: "Volver al futuro", emoji: "🕓⬅️🚗💨"),
    EmojiMovieRepresentation(id: "2", name: "El planeta de los simios", emoji: "🌎🐵🐵🐵"),
    EmojiMovieRepresentation(id: "3", name: "Harry Potter", emoji: "👦🏻👓⚡️"),
    EmojiMovieRepresentation(id: "4", name: "X-Men", emoji: "❌👨🏻👨🏻👨🏻"),
    EmojiMovieRepresentation(id: "5", name: "Star Wars", emoji: "⭐️💣💣"),
]

struct EmojiMovieCellDecorator: MovieCellDecorator {
    func decorate(cell: UITableViewCell, using model: Movie?) {
        let emojiMovie = model as! EmojiMovieRepresentation
        cell.textLabel?.text = emojiMovie.emoji
        cell.detailTextLabel?.text = "Película #\(emojiMovie.id)"
    }
}

masterViewController.dataSource = MoviesDataSource(array: emojisMovies)
masterViewController.cellDecorator = EmojiMovieCellDecorator()
*/

/// MARK: --- RUNNING ---

// So far the UINavigationController may result unfamiliar, don't worry
let navigationController = UINavigationController(rootViewController: masterViewController)

PlaygroundPage.current.liveView = navigationController
