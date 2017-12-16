//
//  ScatterConverter.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Charts
class ScatterConverter {
    
    class func convert(input: Units, label: String?, filterClosure: FilteringClosure = ScatterConverter.defaultFilteringClosure) -> ScatterChartData {
        let filtered = input.list.filter(filterClosure)
        let chartDataEntries = filtered.map({ChartDataEntry(x: $0.salary.doubleValue, y: Double($0.learnersNum))})
        let dataSet = ScatterChartDataSet(values: chartDataEntries, label: label)
        dataSet.setColor(Constants.Scatter.scatterColor)
        dataSet.scatterShapeSize = Constants.Scatter.scatterShapeSize
        dataSet.drawValuesEnabled = false
        
        dataSet.setScatterShape(.circle)
        return ScatterChartData(dataSets: [dataSet])
    }
    
    class func wireframe(_ units: Units) -> Wireframe {
        let minY: Double = units.minLearners
        let maxY: Double = units.maxLearners
        let minX: Double = units.minSalary
        let maxX: Double = units.maxSalary
        return (minX: minX, maxX: maxX, minY: minY, maxY: maxY)
    }
}

extension ScatterConverter {
    typealias FilteringClosure = ((Unit) -> (Bool))
    static let defaultFilteringClosure: FilteringClosure = { _ in
        return true
    }
}
