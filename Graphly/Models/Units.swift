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
    
    var minYear: Int {
        return list.map({$0.year}).min() ?? 0
    }
    
    var maxYear: Int {
        return list.map({$0.year}).max() ?? 0
    }
    
    var sizeYear: Int {
        return Set(list.map({$0.year})).count
    }
}
