//
//  SongLoader.swift
//  Delegation
//
//  Created by Luis Burgos on 5/31/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class SongLoader {
    var delegate: SongLoaderResponder?
    
    func prepareCrowdScream() {
        delegate?.willBeginDownload()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.delegate?.didFinishDownload()
        }
    }
}
