//
//  EmojiMovieCellDecorator.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import UIKit

struct EmojiMovieCellDecorator: MovieCellDecorator {
    func decorate(cell: UITableViewCell, using model: Movie?) {
        let emojiMovie = model as! EmojiMovieRepresentation
        cell.textLabel?.text = emojiMovie.emoji
        cell.detailTextLabel?.text = "Película #\(emojiMovie.id)"
    }
}
