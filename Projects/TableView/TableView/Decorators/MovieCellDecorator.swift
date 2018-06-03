//
//  MovieCellDecorator.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import UIKit

protocol MovieCellDecorator {
    func decorate(cell: UITableViewCell, using model: Movie?)
}
