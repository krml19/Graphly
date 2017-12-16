//
//  GridChartCollectionViewModel.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Charts

class GridChartCollectionViewModel {
    let scatterData: ScatterChartData
    let year: Int
    let enabledLeftAxis: Bool
    let wireframe: Wireframe
    
    init(scatterData: ScatterChartData, year: Int, wireframe: Wireframe, enabledLeftAxis: Bool = false) {
        self.scatterData = scatterData
        self.year = year
        self.enabledLeftAxis = enabledLeftAxis
        self.wireframe = wireframe
    }
}
