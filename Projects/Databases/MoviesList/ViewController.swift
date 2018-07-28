//
//  ViewController.swift
//  MoviesList
//
//  Created by Luis Burgos on 7/28/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "Cell"
        )
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateMovies()
    }

    @IBAction func didTapAddButton(_ sender: UIBarButtonItem) {
        displayAdditionAlert { nameToSave in
            self.save(name: nameToSave)
            self.tableView.reloadData()
        }
    }
}

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

