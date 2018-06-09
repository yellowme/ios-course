//
//  MasterViewController.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class PokemonsTableViewController: DataTableViewController<Pokemon> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = AppDataSource(array: [])
        cellDecorator = SimplePokemonCellDecorator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func loadData() {
        setProgres(active: true)
        // Simulate network
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.setProgres(active: false)
            
            // This is how we updated the table view data
            self.dataSource?.items += [SimplePokemon(name: "Pikachu")]
            self.tableView.reloadData()
        }
    }
    
    func setProgres(active: Bool) {
        //TODO: Implement
    }
    
    func display(message: String) {
        //TODO: Implement, use "Bugle"
    }
}
