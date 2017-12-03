//
//  NSSlider+Tick.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

extension NSSlider {
    func tickValue() -> Int {
        let tick = Int(doubleValue * Double(numberOfTickMarks) / maxValue)
        return tick < numberOfTickMarks ? tick : numberOfTickMarks - 1
    }
}
