//
//  HeatMapViewModel.swift
//  Graphly
//
//  Created by Krzysztof Rózga on 03/12/2017.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Cocoa

protocol HeatMapViewModelDelegate {
    func didFinishLoadingData()
}

class HeatMapViewModel {
    
    var delegate: HeatMapViewModelDelegate?
    
    var heatModels = [HeatModel]()
    var minRatio: Float?
    var maxRatio: Float?
    
    let units: Units = {
        return di.resolve(LocalDataProvider.self).models
    }()
    
    
    func loadData() {
        DispatchQueue.global().async {
            for unit in self.units.list {
                self.heatModels.append(HeatModel(unit: unit,yearIndex: self.getYearIndex(unit: unit) , populationIndex: self.getPopulationIndex(unit: unit)))
            }
            self.minRatio = self.heatModels.map{ $0.ratio }.min()
            self.maxRatio = self.heatModels.map{ $0.ratio }.max()
            DispatchQueue.main.async {
                self.delegate?.didFinishLoadingData()
            }
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
        
        if count != 0 {
            return ratioSum/count}
        else {
            return 0.0
        }
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
        return getColorFor(ratio: ratio)
    }
    
    func getColorFor(ratio: Float) -> CGColor {
        var color: CGColor
        guard let maxRatio = maxRatio else { return NSColor.red.cgColor }
        color = (ratio != 0.0) ? CGColor.init(gray: CGFloat(1-ratio/maxRatio), alpha: 1.0) : NSColor.white.cgColor
        return color
    }
}
