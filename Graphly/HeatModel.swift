//
//  HeatModel.swift
//  Graphly
//
//  Created by Krzysztof Rózga on 03/12/2017.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation

class HeatModel {
    let yearIndex: Int
    let populationIndex: Int
    let ratio: Float
    
    init(unit: Unit, yearIndex: Int, populationIndex: Int) {
        self.yearIndex = yearIndex
        self.populationIndex = populationIndex
        self.ratio = Float(unit.learnersNum)/Float(unit.salary)
        if ratio == 0.0 {
            log.error(ratio)
            print(unit.learnersNum)
            print(unit.salary)
        }
    }
}
