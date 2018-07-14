//
//  BaseView.swift
//  LoginForm
//
//  Created by Luis Burgos on 6/15/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

protocol BaseView: class {
    func setProgress(to isLoading: Bool, with alpha: CGFloat?, overlay: UIColor?)
    func display(_ message: String?)
}
