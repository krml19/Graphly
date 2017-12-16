//
//  Constants.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/16/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Cocoa

struct Constants {
    struct Grid {
        static let yLabelWidth: CGFloat = 40.0
    }
    
    struct Scatter {
        static let scatterColor = NSColor.blue.withAlphaComponent(0.4)
        static let scatterShapeSize: CGFloat = 7.0
    }
    
    struct Menu {
        static let selectionColor: NSColor = NSColor.black.withAlphaComponent(0.5)
    }
}
