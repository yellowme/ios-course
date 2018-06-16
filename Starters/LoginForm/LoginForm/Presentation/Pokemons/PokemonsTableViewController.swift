//
//  MasterViewController.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class PokemonsTableViewController: DataTableViewController<Pokemon> {
    
    private let dataHelper = PokemonsService()
    
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
    
    //MARK: Helpers
    
    func setProgres(active: Bool) {
        if active {
            self.showIndicator(on: view, options: BaseViewIndicatorOptions(
                indicatorColor: .blue, alpha: 0.6, overlayColor: .lightGray
            ))
        } else {
            self.hideActivityIndicator(on: view)
        }
    }
    
    func display(message: String) {
        //TODO: Implement
    }
}
