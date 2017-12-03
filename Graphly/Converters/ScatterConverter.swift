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
        let chartDataEntries = filtered.map({ChartDataEntry(x: Double($0.learnersNum), y: $0.salary.doubleValue)})
        let dataSet = ScatterChartDataSet(values: chartDataEntries, label: label)
        return ScatterChartData(dataSets: [dataSet])
    }
}

extension ScatterConverter {
    typealias FilteringClosure = ((Unit) -> (Bool))
    static let defaultFilteringClosure: FilteringClosure = { _ in
        return true
    }
}
