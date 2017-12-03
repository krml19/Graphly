//
//  Collection+Range.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

extension Collection {
    func inRange(index: Int) -> Bool {
        return index >= 0 && index < self.count
    }
}
