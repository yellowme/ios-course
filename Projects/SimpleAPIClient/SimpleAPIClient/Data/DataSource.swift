//
//  DataSource.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol DataSource {
    associatedtype Model
    var numberOfSections: Int { get }
    func numberOfRowsInSection(section: Int) -> Int
    func modelAt(indexPath: IndexPath) -> Model?
}
