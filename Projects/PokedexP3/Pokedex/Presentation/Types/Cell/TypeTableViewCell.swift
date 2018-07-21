//
//  TypeTableViewCell.swift
//  Pokedex
//
//  Created by Luis Burgos on 7/20/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

class TypeTableViewCell: UITableViewCell {
    
    //MARK: - Identifier
    
    static let identifier = "TypeTableViewCell"
    
    //MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var filterIcon: UIImageView!
    @IBOutlet weak var typeNameLabel: UILabel!
    
    //MARK: - Cell
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
