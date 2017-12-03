//
//  Units.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

struct Units {
    var list: [Unit] = []
    
    var minYear: UInt {
        let min = list.map({$0.year}).min() ?? 0
        return UInt(min)
    }
    
    var maxYear: UInt {
        let max = list.map({$0.year}).max() ?? 0
        return UInt(max)
    }
    
    var sizeYear: Int {
        let size = Set(list.map({$0.year}))
        return size.count
    }
}
