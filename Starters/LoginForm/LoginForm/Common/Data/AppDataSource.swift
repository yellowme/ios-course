//
//  MoviesDataSource.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class AppDataSource<T>: DataSource {
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
