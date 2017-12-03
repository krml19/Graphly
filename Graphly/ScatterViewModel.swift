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
    
    func prepareData(timelineValue: Int, populationValue: Int) -> ScatterChartData {
        let year = localDataProvider.models.minYear + timelineValue
        
        log.debug("Timeline value: \(timelineValue), populationValue: \(populationValue)")
            
        return ScatterConverter.convert(input: localDataProvider.models, label: nil, filterClosure: { (model) -> (Bool) in
            //                    return true
            //                    return model.year == year && model.population > populationMin && model.population < populationMax
            return model.year == year
        })
    }
}
