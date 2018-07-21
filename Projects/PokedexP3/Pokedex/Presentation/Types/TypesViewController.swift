//
//  TypesViewController.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/20/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

protocol TypeSelectionDelegate {
    func typeSelection(didChoose type: PokemonType?)
}

class TypesViewController: DataTableViewController<TypeTableViewCell, PokemonType> {
    
    var delegate: TypeSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = AppDataSource(array: PokemonType.allTypes())
        cellDecorator = TypeTableCellDecorator()
        decorateTableView()
    }
    
    override func cellIdentifier() -> String {
        return TypeTableViewCell.identifier
    }
    
    override func registerTableCellNib() {
        let cellNib = UINib(nibName: TypeTableViewCell.identifier, bundle: nil)
        self.tableView.register(
            cellNib,
            forCellReuseIdentifier: TypeTableViewCell.identifier
        )
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentType = dataSource?.modelAt(indexPath: indexPath)
        delegate?.typeSelection(didChoose: currentType)
        navigationController?.popViewController(animated: true)        
    }
}

extension TypesViewController {
    private func decorateTableView() {
        title = "Types"
        tableView.rowHeight = 80.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        navigationController?.navigationBar.tintColor = .white
    }
}
