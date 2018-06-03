//
//  MasterViewController.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import UIKit

class MasterViewController: UITableViewController {
    
    // MARK: - Variables
    var cellIdentifier = "Cell"
    
    /*var dataSource: MoviesDataSource<Movie>? =
        MoviesDataSource(array: DataHelper.provideSimpleMovies())
    var cellDecorator: MovieCellDecorator? = SimpleMovieCellDecorator()*/
    
    var dataSource: MoviesDataSource<Movie>? =
        MoviesDataSource(array: DataHelper.provideEmojiMovies())
    var cellDecorator: MovieCellDecorator? = EmojiMovieCellDecorator()
    
    // MARK: - Controller
    
    override func viewDidLoad() {
        title = "Las mejores películas"
    }
    
}

// MARK: - Data Source
extension MasterViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfRowsInSection(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        //Attempt to "dequeue" a cell
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
            cell?.accessoryType = .disclosureIndicator
        }
        
        let movie = dataSource?.modelAt(indexPath: indexPath)
        cellDecorator?.decorate(cell: cell, using: movie)
        return cell
    }
}

// MARK: - Cell
extension MasterViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = dataSource?.modelAt(indexPath: indexPath) else { return }
        
        let detailController = getController(
            named: "DetailViewController",
            from: "Main"
        ) as! DetailViewController
    
        detailController.message = movie.name
        navigationController?.pushViewController(detailController, animated: true)
    }
}
