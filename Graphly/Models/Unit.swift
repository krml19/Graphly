//
//  Unit.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

class Unit {
    
    let code: Int
    let year: Int
    let population: Int
    let learnersNum: Int
    let salary: NSDecimalNumber
    
    init(code: Int, year: Int, population: Int, learnersNum: Int, salary: NSDecimalNumber) {
        self.code = code
        self.year = year
        self.population = population
        self.learnersNum = learnersNum
        self.salary = salary
    }
    
}
