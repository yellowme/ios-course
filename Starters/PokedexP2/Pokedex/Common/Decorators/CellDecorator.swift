//
//  MovieCellDecorator.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

protocol CellDecorator {
    associatedtype Model
    func decorate(cell: UITableViewCell, using model: Model?)
}

protocol CollectionCellDecorator {
    associatedtype Model
    associatedtype Cell: UICollectionViewCell
    func decorate(cell: Cell, using model: Model?)
}
