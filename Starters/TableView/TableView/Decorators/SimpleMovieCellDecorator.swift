//
//  SimpleMovieCellDecorator.swift
//  TableView
//
//  Created by Luis Burgos on 6/2/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class SimpleMovieCellDecorator: MovieCellDecorator {
    func decorate(cell: UITableViewCell, using movie: Movie?) {
        cell.textLabel?.text = movie?.name ?? "undefined"
        cell.detailTextLabel?.text = "Película #\(movie?.id ?? "??")"
    }
}
