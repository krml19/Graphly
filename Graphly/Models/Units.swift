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
    let populations: [(min: Int, max: Int)] = [(min: 0, max: 1000), (min: 1000, max: 10000), (min: 10000, max: 50000), (min: 50000, max: 100000), (min: 100000, max: 1000000), (min: Int(1e6), max: Int(2e6))]
    
    
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
