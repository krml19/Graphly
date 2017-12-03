//
//  DataProvider.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/3/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Charts

class DataProvider: DataProviderProtocol {
    var scatterData: ScatterChartData {
        return ScatterChartData()
    }
    
    var gridChartData: CombinedChartData {
        return CombinedChartData()
    }
    
    
}
