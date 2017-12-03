//
//  ScatterViewModel.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Cocoa
import Charts

class ScatterViewModel: NSObject {
    typealias SliderValues = (min: Int, max: Int, size: Int)
    let localDataProvider: LocalDataProvider = di.resolve(LocalDataProvider.self)
    var year: Int = 0
    var population: (min: Int, max: Int) = (min: 0, max: 0)
    
    
    func prepareData(timelineValue: Int, populationValue: Int) -> ScatterChartData {
        year = localDataProvider.models.minYear + timelineValue
        population = localDataProvider.models.populations[populationValue]
    
        let data = ScatterConverter.convert(input: localDataProvider.models, label: nil, filterClosure: { (model) -> (Bool) in
            return model.year == year && model.population > population.min && model.population < population.max
        })
        log.debug("Year: \(year), population: \(population), elements: \(data.entryCount)")
        return data
    }
}
