//
//  Unit.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa

struct Unit {
    let index: Int
    let code: Int
    let year: Int
    let population: Int
    let learnersNum: Int
    let salary: NSDecimalNumber
    
    init(index: Int, code: Int, year: Int, population: Int, learnersNum: Int, salary: NSDecimalNumber) {
        self.index = index
        self.code = code
        self.year = year
        self.population = population
        self.learnersNum = learnersNum
        self.salary = salary
    }
}

extension Unit: Decodable {
    enum UnitKeys: String, CodingKey { // declaring our keys
        case index = "index"
        case code = "code"
        case year = "year"
        case population = "population"
        case learnersNum = "langs"
        case salary = "salary"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: UnitKeys.self) // defining our (keyed) container
        let index: Int = try container.decode(Int.self, forKey: .index)
        let code: Int = try container.decode(Int.self, forKey: .code)
        let year: Int = try container.decode(Int.self, forKey: .year)
        let population: Int = try container.decode(Int.self, forKey: .population)
        let learnersNum: Int = try container.decode(Int.self, forKey: .learnersNum)
        let salaryString: String = try container.decode(String.self, forKey: .salary)
        let salary: NSDecimalNumber = NSDecimalNumber(string: salaryString)
        
        self.init(index: index, code: code, year: year, population: population, learnersNum: learnersNum, salary: salary)
    }
}
