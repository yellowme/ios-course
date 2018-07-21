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

class DataTableViewController<Cell: UITableViewCell, DataModel>: UITableViewController, DataTableView {    
    // MARK: - DataTableView
    
    var dataSource: AppDataSource<DataModel>?
    var cellDecorator: AppCellDecorator<DataModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableCellNib()
    }
    
    func cellIdentifier() -> String {
        return "Cell"
    }
    
    // MARK: - Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.numberOfRowsInSection(section: section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier()) as! Cell
        let item = dataSource?.modelAt(indexPath: indexPath)
        DispatchQueue.main.async {
            self.cellDecorator?.decorate(cell: cell, using: item)
        }
        return cell
    }
    
    //MARK: - Register
    
    func registerTableCellNib() {
        //Could be override in order to register a custom cell
    }
}
