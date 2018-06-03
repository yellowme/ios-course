//
//  DetailViewController.swift
//  TableView
//
//  Created by Erick A. Montañez  on 6/1/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    var movieName: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        movieNameLabel.text = movieName
    }
}
