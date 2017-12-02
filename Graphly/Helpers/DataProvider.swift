//
//  DataProvider.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Charts

protocol DataProvider {
    var scatterData: ScatterChartData { get }
}

class RealDataProvider: DataProvider {
    var scatterData: ScatterChartData {
        return ScatterChartData()
    }
}

class MockDataProvider: DataProvider {
    var scatterData: ScatterChartData {
        var yVals1 = [ChartDataEntry]()
        var yVals2 = [ChartDataEntry]()
        var yVals3 = [ChartDataEntry]()
        let count = 25
        let range = 100.0
        for i in 0..<count {
            var val = Double(arc4random_uniform(UInt32(range))) + 3
            yVals1.append(ChartDataEntry(x: Double(i), y: val))
            val = Double(arc4random_uniform(UInt32(range))) + 3
            yVals2.append(ChartDataEntry(x: Double(i) + 0.33, y: val))
            val = Double(arc4random_uniform(UInt32(range))) + 3
            yVals3.append(ChartDataEntry(x: Double(i) + 0.66, y: val))
        }
        
        //: ### ScatterChartDataSet
        let set1 = ScatterChartDataSet(values: yVals1, label: "DS 1")
        set1.setScatterShape(.square )
        set1.colors =  ChartColorTemplates.liberty()
        set1.scatterShapeSize = 10.0
        
        let set2 = ScatterChartDataSet(values: yVals2, label: "DS 2")
        set2.setScatterShape( .circle)
        set2.scatterShapeHoleColor = NSUIColor.blue
        set2.scatterShapeHoleRadius = 3.5
        set2.colors = ChartColorTemplates.material()
        set2.scatterShapeSize = 10.0
        
        let set3 = ScatterChartDataSet(values: yVals3, label: "DS 3")
        set3.setScatterShape(.triangle)
        set3.colors = [NSUIColor.orange] //ChartColorTemplates.pastel()
        set3.scatterShapeSize = 10.0
        
        var dataSets = [ScatterChartDataSet]()
        dataSets.append(set1)
        dataSets.append(set2)
        dataSets.append(set3)
        //: ### ScatterChartData
        let data = ScatterChartData(dataSets: dataSets)
        data.setValueFont( NSUIFont(name: "HelveticaNeue-Light", size: CGFloat(7.0)))
        return data
    }
}
