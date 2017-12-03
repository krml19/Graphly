//
//  HeatMapViewModel.swift
//  Graphly
//
//  Created by Krzysztof Rózga on 03/12/2017.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Cocoa

class HeatMapViewModel {
    
    var heatModels = [HeatModel]()
    
    let units: Units = {
        return di.resolve(LocalDataProvider.self).models
    }()
    
    init() {
        for unit in units.list {
            heatModels.append(HeatModel(unit: unit,yearIndex: getYearIndex(unit: unit) , populationIndex: getPopulationIndex(unit: unit)))
        }
    }
    
    func getRatioFor(row: Int, column: Int) -> Float {
        let models = heatModels.filter({ $0.populationIndex == row && $0.yearIndex == column })
        var ratioSum: Float = 0.0
        var count:Float = 0
        for model in models {
            ratioSum += model.ratio
            count += 1
        }
        
        if count != 0 { return ratioSum/count} else { return 0.0 }
    }
    
    private func getYearIndex(unit: Unit) -> Int {
        let years = Array(units.minYear...units.maxYear)
        guard let index = years.index(of: unit.year) else { return 0 }
        return index
    }
    
    private func getPopulationIndex(unit: Unit) -> Int {
        let population = unit.population
        var result = 0
        for index in 0...units.populations.count-1 {
            if population >= units.populations[index].min && population < units.populations[index].max {
                result = index
            }
        }
        return result
    }
    
    func getColorFor(row: Int, column: Int) -> CGColor {
        let ratio = getRatioFor(row: row, column: column)
        var color: CGColor
        color = (ratio != 0.0) ? CGColor.init(gray: CGFloat(1-ratio/5.4), alpha: 1.0) : NSColor.red.cgColor
        return color
    }
}
