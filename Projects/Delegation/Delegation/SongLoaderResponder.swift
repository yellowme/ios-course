//
//  SoundLoader.swift
//  Delegation
//
//  Created by Luis Burgos on 5/31/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

@objc protocol SongLoaderResponder {
    @objc optional func willBeginDownload()
    func didFinishDownload()
}
