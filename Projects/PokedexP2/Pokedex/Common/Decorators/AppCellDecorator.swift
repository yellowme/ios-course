//
//  AppCellDecorator.swift
//  SimpleAPIClient
//
//  Created by Luis Burgos on 6/8/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class AppCellDecorator<T>: CellDecorator {
    func decorate(cell: UITableViewCell, using model: T?) {
        //IMPORTANT: Must override
    }
}

class AppCollectionCellDecorator<ConcreteCell, Model>: CollectionCellDecorator where ConcreteCell: UICollectionViewCell {
    func decorate(cell: ConcreteCell, using model: Model?) {
        //IMPORTANT: Must override
    }
}
