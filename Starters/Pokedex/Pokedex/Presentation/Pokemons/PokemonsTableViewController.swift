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
    var sessionManager: SessionManagerProtocol? = SessionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = AppDataSource(array: [])
        cellDecorator = SimplePokemonCellDecorator()
        
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
            
            self.dataSource?.items = pokemons
            self.tableView.reloadData()
        }
    }

}

extension PokemonsTableViewController: BaseView {
    func setProgress(to isLoading: Bool, with alpha: CGFloat? = nil, overlay: UIColor? = nil) {
        guard let parentView = self.parent?.view else { return }
        
        if isLoading {
            self.parent?.showIndicator(
                on: parentView,
                options: BaseViewIndicatorOptions(
                    indicatorColor: .blue,
                    alpha: 0.6,
                    overlayColor: .lightGray
                )
            )
        } else {
            self.parent?.hideActivityIndicator(on: parentView)
        }
    }
}
