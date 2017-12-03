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
    init(scatterData: ScatterChartData, year: Int) {
        self.scatterData = scatterData
        self.year = year
    }
}
