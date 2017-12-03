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
    let populations: [(min: Int, max: Int)] = [(min: Int(1e0), max: Int(5e4)),
                                               (min: Int(5e4), max: Int(8e4)),
                                               (min: Int(8e4), max: Int(1e5)),
                                               (min: Int(1e5), max: Int(3e5)),
                                               (min: Int(3e5), max: Int(7e5)),
                                               (min: Int(7e5), max: Int(2e6))]
    
    
    var minYear: Int {
        return list.map({$0.year}).min() ?? 0
    }
    
    var maxYear: Int {
        return list.map({$0.year}).max() ?? 0
    }
    
    var sizeYear: Int {
        return Set(list.map({$0.year})).count
    }
    
    var years: [Int] {
        let unique: [Int] = Array(Set(list.map({$0.year})))
        return unique.sorted { (a, b) -> Bool in
            return a < b
        }
    }
}
