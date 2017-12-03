//
//  DataProvider.swift
//  Graphly
//
//  Created by Marcin Karmelita on 12/2/17.
//  Copyright © 2017 Marcin Karmelita. All rights reserved.
//

import Foundation
import Charts

protocol DataProviderProtocol {
    var scatterData: ScatterChartData { get }
    var gridChartData: CombinedChartData { get }
}




