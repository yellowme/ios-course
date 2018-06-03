//
//  SimpleMovieCellDecorator.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import UIKit

struct SimpleMovieCellDecorator: MovieCellDecorator {
    func decorate(cell: UITableViewCell, using model: Movie?) {
        let simpleMovie = model as! SimpleMovie
        cell.textLabel?.text = "Película #\(simpleMovie.id)"
        cell.detailTextLabel?.text = simpleMovie.name
    }
}
