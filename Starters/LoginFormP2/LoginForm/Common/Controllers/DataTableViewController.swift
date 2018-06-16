//
//  DataTableViewController.swift
//  SimpleAPIClient
//
//  Created by Luis Burgos on 6/8/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

protocol DataTableView {
    associatedtype Model
    var dataSource: AppDataSource<Model>? { get set }
    var cellDecorator: AppCellDecorator<Model>? { get set }
}

class DataTableViewController<DataModel>: UITableViewController, DataTableView {
    
    // MARK: - Variables
    
    var cellIdentifier = "Cell"
    
    // MARK: - DataTableView
    
    var dataSource: AppDataSource<DataModel>?
    var cellDecorator: AppCellDecorator<DataModel>?
    
    // MARK: - Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfRowsInSection(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        let movie = dataSource?.modelAt(indexPath: indexPath)
        cellDecorator?.decorate(cell: cell, using: movie)
        return cell
    }
}
