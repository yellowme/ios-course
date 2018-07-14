//
//  BaseViewController.swift
//  LoginForm
//
//  Created by Luis Burgos on 6/15/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit
import Bugle

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseView {
    func setProgress(to isLoading: Bool, with alpha: CGFloat? = nil, overlay: UIColor? = nil) {
        setProgress(to: isLoading, with: alpha, overlay: overlay)
    }
}

protocol IndicatorDecorator {
    var indicatorColor: UIColor { get set }
}

extension BaseView where Self: UIViewController {
    func setProgress(to isLoading: Bool, with alpha: CGFloat?, overlay: UIColor?) {
        if isLoading {
            let color = (self as? IndicatorDecorator)?.indicatorColor ?? .blue
            self.showIndicator(
                on: view,
                options: BaseViewIndicatorOptions(
                    indicatorColor: color,
                    alpha: alpha ?? 0.6,
                    overlayColor: overlay ?? .white
                )
            )
        } else {
            self.hideActivityIndicator(on: view)
        }
    }
    
    func display(_ message: String?) {
        guard let message = message else { return }
        let options: BugleOptions = [
            .cancel: String.cancel,
            .title: String.appName,
            .action:  String.understood,
        ]
        Bugle.shared.play(message, options, on: self)
    }
}

