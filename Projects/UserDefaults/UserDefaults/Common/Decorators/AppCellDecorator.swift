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
