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
    typealias Completion = ((ScatterChartData) -> ())
    typealias SliderValues = (min: UInt, max: UInt, size: Int)
    let localDataProvider: LocalDataProvider = di.resolve(LocalDataProvider.self)
    var models: Units = Units()
    var timelineValues: SliderValues = (min: 0, max: 0, size: 0)
    var populationValues: SliderValues = (min: 0, max: 0, size: 0)
    
    func prepareData(timelineValue: UInt, populationValue: UInt, completion: @escaping Completion) {
        let year = models.minYear + timelineValue
//        let populationMin = 0
//        let populationMax = 0
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInteractive).async {
            self.localDataProvider.getModels(completion: { (models, error) in
                if error != nil {
                    // present error
                }
                self.models = models
//                self.timelineValues = (min: models.minYear, max: models.maxYear, size: models.sizeYear)
        
                let data = ScatterConverter.convert(input: models, label: nil, filterClosure: { (model) -> (Bool) in
//                    return true
//                    return model.year == year && model.population > populationMin && model.population < populationMax
                    return model.year == year
                })
                completion(data)
            })
        }
    }
}
