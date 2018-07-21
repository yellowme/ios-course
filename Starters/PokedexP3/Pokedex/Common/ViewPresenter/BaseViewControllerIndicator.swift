//  BaseViewControllerIndicator.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/16/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//
import UIKit

/**
 IMPORTANT: This tags are used to add/remove the view indicator layer.
 */
struct IndicatorConfig {
    static let overlayTag = 10010
    static let indicatorTag = 10011
}

struct BaseViewIndicatorOptions {
    let indicatorColor: UIColor
    let alpha: CGFloat?
    let overlayColor: UIColor?
    
    init(indicatorColor: UIColor, alpha: CGFloat?, overlayColor: UIColor?) {
        self.alpha = alpha
        self.overlayColor = overlayColor
        self.indicatorColor = indicatorColor
    }
}

extension UIViewController {
    internal func showIndicator(on view: UIView, options: BaseViewIndicatorOptions) {
        // This will be the alignment view for the activity indicator
        var superView: UIView = view
        
        //If we want an opaque overlay, do that work first then put the activity indicator within that view;
        //else just use the passed UIView to center it
        let overlay = UIView()
        overlay.frame = CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: view.frame.height)
        overlay.layer.backgroundColor = options.overlayColor?.cgColor ?? UIColor.lightGray.cgColor
        overlay.alpha = options.alpha ?? 0.3
        overlay.tag = IndicatorConfig.overlayTag
        
        overlay.center = superView.center
        overlay.isHidden = false
        superView.addSubview(overlay)
        superView.bringSubview(toFront: overlay)
        
        // now we'll work on adding the indicator to the overlay (now superView)
        superView = overlay
        
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        
        indicator.center = superView.center
        indicator.tag = IndicatorConfig.indicatorTag
        indicator.color = options.indicatorColor
        indicator.isHidden = false
        
        superView.addSubview(indicator)
        superView.bringSubview(toFront: indicator)
        
        indicator.startAnimating()
        
        //Also indicate network activity in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    internal func hideActivityIndicator(on view: UIView) {
        // Stop the network activity animation in the status bar
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        // Remove the activity indicator and optional overlay views
        view.viewWithTag(IndicatorConfig.indicatorTag)?.removeFromSuperview()
        view.viewWithTag(IndicatorConfig.overlayTag)?.removeFromSuperview()
    }
}
