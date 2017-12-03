//
//  MockDataProvider.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Charts

class MockDataProvider: DataProviderProtocol {
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
    
    var gridChartData: CombinedChartData {
        func setChartData() -> CombinedChartData
        {
            let data = CombinedChartData()
            data.lineData = generateLineData()
            data.barData = generateBarData()
            return data
        }
        //: ## function generateLineData
        func generateLineData() -> LineChartData
        {
            //: ### ChartDataEntry
            var entries = [ChartDataEntry]()
            for index in 0..<12
            {
                entries.append(ChartDataEntry(x: Double(index) + 0.5, y: (Double(arc4random_uniform(15) + 5))))
            }
            //: ### LineChartDataSet
            let set = LineChartDataSet(values: entries, label: "Line DataSet")
            set.colors = [#colorLiteral(red: 0.941176470588235, green: 0.933333333333333, blue: 0.274509803921569, alpha: 1.0)]
            set.lineWidth = 2.5
            set.circleColors = [#colorLiteral(red: 0.941176470588235, green: 0.933333333333333, blue: 0.274509803921569, alpha: 1.0)]
            set.circleHoleRadius = 2.5
            set.fillColor = #colorLiteral(red: 0.941176470588235, green: 0.933333333333333, blue: 0.274509803921569, alpha: 1.0)
            set.mode = .cubicBezier
            set.drawValuesEnabled = true
            set.valueFont = NSUIFont.systemFont(ofSize: CGFloat(10.0))
            set.valueTextColor = #colorLiteral(red: 0.941176470588235, green: 0.933333333333333, blue: 0.274509803921569, alpha: 1.0)
            set.axisDependency = .left
            //: ### LineChartData
            let data = LineChartData()
            data.addDataSet(set)
            return data
        }
        //: ## function generateBarData
        func generateBarData() -> BarChartData
        {
            //: ### BarChartDataEntry
            var entries1 = [BarChartDataEntry]()
            var entries2 = [BarChartDataEntry]()
            
            for _ in 0..<12
            {
                entries1.append(BarChartDataEntry(x: 0.0, y: (Double(arc4random_uniform(25) + 25))))
                /*:
                 - Note: stacked
                 */
                entries2.append(BarChartDataEntry(x: 0.0, yValues: [Double(arc4random_uniform(13) + 12), Double(arc4random_uniform(13) + 12)]))
            }
            //: ### BarChartDataSet
            let set1            = BarChartDataSet(values: entries1, label: "Bar 1")
            set1.colors         = [#colorLiteral(red: 0.235294117647059, green: 0.862745098039216, blue: 0.305882352941176, alpha: 1.0)]
            set1.valueTextColor = #colorLiteral(red: 0.235294117647059, green: 0.862745098039216, blue: 0.305882352941176, alpha: 1.0)
            set1.valueFont      = NSUIFont.systemFont(ofSize: CGFloat(10.0))
            set1.axisDependency = .left
            
            let set2            = BarChartDataSet(values: entries2, label: "Bar 2")
            set2.stackLabels    = ["Stack 1", "Stack 2"]
            set2.colors         = [#colorLiteral(red: 0.23921568627451, green: 0.647058823529412, blue: 1.0, alpha: 1.0),  #colorLiteral(red: 0.090196078431373, green: 0.772549019607843, blue: 1.0, alpha: 1.0)]
            set2.valueTextColor = #colorLiteral(red: 0.23921568627451, green: 0.647058823529412, blue: 1.0, alpha: 1.0)
            set2.valueFont      = NSUIFont.systemFont(ofSize: CGFloat(10.0))
            set2.axisDependency = .left
            //: ### BarChartData
            let groupSpace = 0.06
            let barSpace = 0.02
            let barWidth = 0.45
            
            /*:
             - Note:  x2 dataset
             (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"
             */
            let data = BarChartData(dataSets: [set1, set2])
            data.barWidth = barWidth
            /*:
             - Note: make this BarData object grouped
             */
            data.groupBars(fromX: 0.0, groupSpace: groupSpace, barSpace: barSpace)     // start at x = 0
            return data
        }
        //: ## Principal
        
        
        return setChartData()
    }
}
