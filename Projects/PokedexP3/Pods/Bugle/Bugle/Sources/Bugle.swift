//
//  Bugle.swift
//  Yellowme
//
//  Created by Luis Burgos on 1/3/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit.UIAlertController
import UIKit.UIViewController

/**
 Implement this on your UIViewController in order to listen to user actions.
 */
@objc public protocol BugleDelegate {
    func didConfirm()
    @objc optional func didCancel()
}

/**
 Common bugle configuration pieces definition
 */
public typealias BugleOptions = [BuglePiece: Any]

/**
 Helper for displaying alerts without writing boilerplate code.
 */
public class Bugle {
    /**
     Public API access
     */
    public static let shared = Bugle()
    
    /**
     Set of user defined options after calling "setup" method.
     */
    private static var preferredOptions: BugleOptions?

    /**
     Establish preferred user options when calling "play" method.
     If this method is not called before trying to display an alert the
     application would crash.
     */
    public class func setup(with options: BugleOptions) {
        Bugle.preferredOptions = options
    }
    
    /**
     Helper init
     */
    private init() { }
    
    /**
     Displays the UIAlertViewController depending on options given or
     singletion setup.
     
     - parameter message: Content message.
     - parameter options: Set of custom params which modify preferred behavior defined by the user.
     - parameter decorated: Flag to decide whether the alert should change it's tint color or not.
     - parameter controller: Reference from where this method its called.
     - parameter type: Could be "single", "confirmation", "risky.
     */
    public func play(
        _ message: String,
        _ options: BugleOptions? = nil,
        _ decorated: Bool = true,
        on controller: UIViewController,
        ofType type: BugleType = .single) {
        
        // Prepare setup or thorw some fatal errors
        let options = merge(options, with: Bugle.preferredOptions)
        let alert = prepare(with: options.title, message)
        let style = type.style(for: options.tinter)
        let delegate: BugleDelegate? = (controller as? BugleDelegate)
        
        // Decide actions and styles
        switch type {
        case .risky:
            fallthrough
        case .confirmation:
            alert.addAction(UIAlertAction(title: options.action, style: style.confirm, handler: { (action: UIAlertAction!) in
                delegate?.didConfirm()
            }))
            
            alert.addAction(UIAlertAction(title: options.cancel, style: style.cancel, handler: { (action: UIAlertAction!) in
                delegate?.didCancel?()
            }))
            break
        default:
            alert.addAction(UIAlertAction(title: options.action, style: UIAlertActionStyle.default) { action in
                delegate?.didConfirm()
            })
        }
        
        // Now the final step is to present the Alert on the UI
        if decorated, let color = style.color {
            presentDecorated(alert, on: controller, tintColor: color)
        } else {
            controller.present(alert, animated: true, completion: nil)
        }
    }
}


